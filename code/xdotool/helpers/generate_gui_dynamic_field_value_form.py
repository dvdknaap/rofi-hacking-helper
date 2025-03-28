import json
import sys
import tkinter as tk
from tkinter import Listbox
import sv_ttk
import darkdetect

class JSONSelectorApp:
    """GUI application to select a key from a JSON file and return its value."""

    def __init__(self, root: tk.Tk, json_file: str, form_width: int = 500, form_height: int = 400) -> None:
        """
        Initialize the application.

        :param root: Tkinter root window.
        :param json_file: Path to the JSON file.
        """
        self.root = root
        self.form_width = form_width
        self.form_height = form_height
        self.json_data = self.load_json(json_file)
        self.keys = list(self.json_data.keys())

        self.root.title("Select a field")

        # Apply system theme (dark or light)
        sv_ttk.set_theme(darkdetect.theme())

        # center screen and give given width and height
        screen_width = self.root.winfo_screenwidth()
        screen_height = self.root.winfo_screenheight()
        x = (screen_width // 2) - (self.form_width // 2)
        y = (screen_height // 2) - (self.form_height // 2) - 100
        self.root.geometry(f"{self.form_width}x{self.form_height}+{x}+{y}")

        self.listbox = Listbox(root, height=len(self.keys), selectmode=tk.SINGLE)
        self.listbox.pack(padx=10, pady=10, fill=tk.BOTH, expand=True)

        for key in self.keys:
            self.listbox.insert(tk.END, key)

        self.listbox.bind("<Return>", self.submit_value)
        self.listbox.bind("<KP_Enter>", self.submit_value)
        self.listbox.bind("<Up>", self.move_selection)
        self.listbox.bind("<Down>", self.move_selection)

        self.listbox.select_set(0)  # Select first item by default
        self.listbox.focus_set()

    def load_json(self, json_file: str) -> dict:
        """
        Load JSON data from a file.

        :param json_file: Path to the JSON file.
        :return: Parsed JSON dictionary.
        """
        try:
            with open(json_file, "r", encoding="utf-8") as file:
                return json.load(file)
        except (FileNotFoundError, json.JSONDecodeError) as e:
            print(f"Error loading JSON: {e}")
            sys.exit(1)

    def submit_value(self, event: tk.Event) -> None:
        """
        Print the selected key's value and exit.

        :param event: Tkinter event.
        """
        selected_index = self.listbox.curselection()
        if selected_index:
            selected_key = self.keys[selected_index[0]]
            print(self.json_data[selected_key])  # Output value
            self.root.destroy()

    def move_selection(self, event: tk.Event) -> None:
        """
        Handle Up and Down arrow navigation.

        :param event: Tkinter event.
        """
        current_selection = self.listbox.curselection()
        if not current_selection:
            return

        current_index = current_selection[0]
        if event.keysym == "Up" and current_index > 0:
            self.listbox.select_clear(current_index)
            self.listbox.select_set(current_index - 1)
        elif event.keysym == "Down" and current_index < len(self.keys) - 1:
            self.listbox.select_clear(current_index)
            self.listbox.select_set(current_index + 1)

        self.listbox.activate(self.listbox.curselection())


def main() -> None:
    """
    Main function to start the Tkinter application.
    """
    if len(sys.argv) != 2:
        print("Usage: python generate_gui_dynamic_field_value_form.py <path_to_json_file>")
        sys.exit(1)

    json_file = sys.argv[1]
    form_width, form_height = 800, 500

    root = tk.Tk()
    app = JSONSelectorApp(root, json_file, form_width, form_height)
    root.mainloop()


if __name__ == "__main__":
    main()
