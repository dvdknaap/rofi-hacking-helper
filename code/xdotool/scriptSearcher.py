import json
import tkinter as tk
from tkinter import ttk
from fuzzywuzzy import fuzz
import sys
import sv_ttk
import darkdetect
from typing import List, Dict


class ScriptSearcher:
    """
    A class to search and display scripts from a JSON file using a Tkinter-based GUI.
    
    Attributes:
        root (tk.Tk): The root Tkinter window.
        json_file (str): Path to the JSON file containing script data.
        form_width (int): Width of the GUI window.
        form_height (int): Height of the GUI window.
        last_query (str): The last search query used.
        update_job (int): Job identifier for scheduled updates.
        script_data (List[Dict]): List of scripts loaded from the JSON file.
        search_var (tk.StringVar): Tkinter variable for the search bar input.
        listbox (ttk.Treeview): Treeview widget displaying the script list.
    """

    def __init__(self, root: tk.Tk, json_file: str = "scripts_list.json", form_width: int = 500, form_height: int = 400):
        """
        Initializes the ScriptSearcher instance.

        Args:
            root (tk.Tk): The root Tkinter window.
            json_file (str): Path to the JSON file containing script data.
            form_width (int): Width of the GUI window.
            form_height (int): Height of the GUI window.
        """
        self.root = root
        self.json_file = json_file
        self.form_width = form_width
        self.form_height = form_height
        self.last_query = None
        self.update_job = None
        self.script_data = self.load_scripts()
        
        self.setup_ui()
        self.update_list()  # Ensures the list is always filled

    def load_scripts(self) -> List[Dict]:
        """
        Loads script data from the JSON file.

        Returns:
            List[Dict]: List of script data where each script is represented as a dictionary.
        """
        with open(self.json_file, "r", encoding="utf-8") as file:
            data = json.load(file)

        # Filters out scripts that are not of type "script"
        return [script for script in data if script.get("type") == "script"]

    def filter_scripts(self, query: str) -> List[Dict]:
        """
        Filters scripts based on the search query.

        Args:
            query (str): The search query to filter scripts by.

        Returns:
            List[Dict]: A list of scripts that match the search query.
        """
        query = query.lower().strip()

        if not query:
            return self.script_data

        query_parts = query.split()  # Split the search term into multiple parts

        return [
            script for script in self.script_data 
            if all(
                query_part == script.get("path", "").lower() for query_part in query_parts
            ) or all(
                query_part == script.get("description", "").lower() for query_part in query_parts
            ) or all(
                query_part in script.get("path", "").lower() for query_part in query_parts
            ) or all(
                query_part in script.get("description", "").lower() for query_part in query_parts
            ) or any(
                fuzz.ratio(query, script.get("path", "").lower()) > 80 for query in query_parts
            ) or any(
                fuzz.ratio(query, script.get("description", "").lower()) > 80 for query in query_parts
            )
        ]

    def update_list(self, event=None):
        """
        Schedules an update to the list of displayed scripts based on the current search query.
        
        Args:
            event (tk.Event, optional): The event that triggered the update. Defaults to None.
        """
        if self.update_job:
            self.root.after_cancel(self.update_job)

        self.update_job = self.root.after(300, self._execute_update)

    def _execute_update(self):
        """
        Executes the update of the script list based on the current search query.
        This function is called after a short delay to ensure the user has finished typing.
        """
        query = self.search_var.get().strip()

        if query == self.last_query:
            return

        self.last_query = query
        filtered = self.filter_scripts(query)

        self.listbox.delete(*self.listbox.get_children())

        for script in filtered:
            self.listbox.insert("", "end", values=(script["path"], script.get("description", "No description")))

        # Optionally select the first item if there's any filtered result
        if filtered:
            self.listbox.selection_set(self.listbox.get_children()[0])
            self.listbox.focus(self.listbox.get_children()[0])

    def setup_ui(self):
        """
        Sets up the user interface elements including the search bar and listbox.
        """
        self.root.title("Script Search")
        sv_ttk.set_theme(darkdetect.theme())
        
        screen_width, screen_height = self.root.winfo_screenwidth(), self.root.winfo_screenheight()
        x, y = (screen_width // 2) - (self.form_width // 2), (screen_height // 2) - (self.form_height // 2) - 100
        self.root.geometry(f"{self.form_width}x{self.form_height}+{x}+{y}")

        # Bind escape and Ctrl+C to close the window
        self.root.bind("<Escape>", self.close_window)
        self.root.bind("<Control-c>", self.close_window)

        self.create_search_bar()
        self.create_listbox()

    def close_window(self, event=None):
        """
        Closes the window when the Escape key or Ctrl+C is pressed.

        Args:
            event (tk.Event, optional): The event that triggered the close. Defaults to None.
        """
        self.root.destroy()
        exit(0)

    def create_search_bar(self):
        """
        Creates the search bar at the top of the window.
        """
        tk.Label(self.root, text="Search:").pack(pady=5)

        self.search_var = tk.StringVar()
        search_entry = tk.Entry(self.root, textvariable=self.search_var)
        search_entry.pack(fill=tk.X, padx=10)
        
        search_entry.bind("<Return>", self.check_and_echo_selected)
        search_entry.bind("<KP_Enter>", self.check_and_echo_selected)
        search_entry.bind("<KeyRelease>", self.update_list)
        search_entry.bind("<Control-a>", self.select_all_text)
        search_entry.bind("<Up>", self.move_selection_up)
        search_entry.bind("<Down>", self.move_selection_down)
        search_entry.focus_set()

    def create_listbox(self):
        """
        Creates the listbox that displays the filtered script paths and descriptions.
        """
        frame = tk.Frame(self.root)
        frame.pack(fill=tk.BOTH, expand=True, padx=10, pady=5)

        columns = ("Path", "Description")

        self.listbox = ttk.Treeview(frame, columns=columns, show="headings")
        self.listbox.heading("Path", text="Path")
        self.listbox.heading("Description", text="Description")

        scrollbar = ttk.Scrollbar(frame, orient="vertical", command=self.listbox.yview)
        self.listbox.configure(yscrollcommand=scrollbar.set)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        self.listbox.pack(fill=tk.BOTH, expand=True)

        self.bind_listbox_events()

    def bind_listbox_events(self):
        """
        Binds the necessary events to the listbox.
        """
        self.listbox.bind("<Return>", self.echo_selected)
        self.listbox.bind("<KP_Enter>", self.echo_selected)
        self.listbox.bind("<Double-1>", self.echo_selected)
        self.listbox.bind("<Up>", self.move_selection_up)
        self.listbox.bind("<Down>", self.move_selection_down)

    def check_and_echo_selected(self, event=None):
        """
        Checks if a script is selected in the list and executes it. 
        If nothing is selected, the list is updated.
        
        Args:
            event (tk.Event, optional): The event that triggered the check. Defaults to None.
        """
        if self.listbox.selection():
            self.echo_selected()
        else:
            self.update_list()

    def echo_selected(self, event=None):
        """
        Echoes the selected script's path when a user selects an item from the list.

        Args:
            event (tk.Event, optional): The event that triggered the echo. Defaults to None.
        """
        selected_item = self.listbox.selection()

        if selected_item:
            item = self.listbox.item(selected_item[0], "values")

            if item:
                print(item[0])
                sys.stdout.flush()
                self.root.destroy()
                exit(0)

    def select_all_text(self, event=None):
        """
        Selects all text in the search bar.

        Args:
            event (tk.Event): The event that triggered the text selection.
        """
        event.widget.select_range(0, 'end')
        event.widget.icursor('end')
        return "break"

    def move_selection_up(self, event=None):
        """
        Moves the selection up in the listbox.

        Args:
            event (tk.Event, optional): The event that triggered the movement. Defaults to None.
        """
        self._move_selection(-1)

    def move_selection_down(self, event=None):
        """
        Moves the selection down in the listbox.

        Args:
            event (tk.Event, optional): The event that triggered the movement. Defaults to None.
        """
        self._move_selection(1)

    def _move_selection(self, direction: int):
        """
        Moves the selection in the listbox by a given direction (up or down).

        Args:
            direction (int): The direction to move the selection (-1 for up, 1 for down).
        """
        items = self.listbox.get_children()

        if not items:
            return

        selected = self.listbox.selection()
        index = items.index(selected[0]) if selected else -1
        new_index = max(0, min(index + direction, len(items) - 1))

        self.listbox.selection_set(items[new_index])
        self.listbox.focus(items[new_index])
        self.listbox.see(items[new_index])  # Ensures the selection remains visible

    
if __name__ == "__main__":
    root = tk.Tk()
    app = ScriptSearcher(root, json_file="documentation/scripts_list.json", form_width=1000, form_height=500)
    root.mainloop()
