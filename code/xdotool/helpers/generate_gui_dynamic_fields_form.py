import sys
import os
import json
import tkinter as tk
from tkinter import ttk, messagebox
import sv_ttk
import darkdetect

class DynamicFieldForm:
    def __init__(self, directory: str, form_width: int = 500, form_height: int = 400):
        self.directory = directory
        self.form_width = form_width
        self.form_height = form_height
        self.files = self.load_json_files()
        self.treeview = None

        self.root = tk.Tk()
        self.root.title("Select a Dynamic Field")

        # Apply system theme (dark or light)
        sv_ttk.set_theme(darkdetect.theme())

    def load_json_files(self):
        """
        Loads all JSON files in the specified directory.
        :return: List of dictionaries containing the parsed JSON data.
        """
        files = []
        for filename in os.listdir(self.directory):
            if filename.endswith(".json") and filename != "active_dynamic_fields.json":
                filepath = os.path.join(self.directory, filename)
                try:
                    with open(filepath, "r") as file:
                        data = json.load(file)
                        files.append({"path": filepath, "data": data})
                except json.JSONDecodeError:
                    print(f"Error loading JSON from {filepath}")
        return files

    def populate_treeview(self):
        """
        Populates the Treeview with formatted file data.
        """
        treeview = ttk.Treeview(self.root, columns=("ip", "domain", "username", "password"), show="headings")
        treeview.heading("ip", text="IP")
        treeview.heading("domain", text="Domain")
        treeview.heading("username", text="Username")
        treeview.heading("password", text="Password")

        treeview.column("ip", width=100, anchor="center")
        treeview.column("domain", width=150, anchor="center")
        treeview.column("username", width=100, anchor="center")
        treeview.column("password", width=100, anchor="center")

        for file in self.files:
            ip = file["data"].get("ip", "N/A")
            domain = file["data"].get("domain", "N/A")
            username = file["data"].get("username", "N/A")
            password = file["data"].get("password", "N/A")
            file_path = file["path"]

            unique_tag = file_path
            treeview.insert("", "end", values=(ip, domain, username, password), tags=(unique_tag,))
            treeview.tag_bind(unique_tag, "<Double-1>", lambda event, filepath=file_path: self.on_select(filepath))

        return treeview

    def on_select(self, file_path):
        """
        Handles file selection and exits the application.
        """
        print(file_path)
        self.root.quit()
        self.root.destroy()
        exit(0)

    def confirm_selection(self):
        """
        Confirms the selection and processes the data.
        """
        selected_item = self.treeview.selection()
        if selected_item:
            file_path = self.treeview.item(selected_item)["tags"][0]
            self.on_select(file_path)
        else:
            messagebox.showwarning("No Selection", "Please select a file.")

    def on_key_press(self, event):
        """
        Handles keyboard navigation and selection.
        """
        selected = self.treeview.selection()
        items = self.treeview.get_children()

        if event.keysym == "Down":
            if not selected:
                self.treeview.selection_set(items[0])
            else:
                current_index = items.index(selected[0])
                if current_index < len(items) - 1:
                    self.treeview.selection_set(items[current_index + 1])

        elif event.keysym == "Up":
            if selected:
                current_index = items.index(selected[0])
                if current_index > 0:
                    self.treeview.selection_set(items[current_index - 1])

        elif event.keysym == "Return":  # Enter key
            if selected:
                file_path = self.treeview.item(selected)["tags"][0]
                self.on_select(file_path)

    def create_form(self):
        """
        Creates the form, including the window and Treeview.
        """
        screen_width = self.root.winfo_screenwidth()
        screen_height = self.root.winfo_screenheight()
        x = (screen_width // 2) - (self.form_width // 2)
        y = (screen_height // 2) - (self.form_height // 2) - 100
        self.root.geometry(f"{self.form_width}x{self.form_height}+{x}+{y}")

        self.treeview = self.populate_treeview()
        self.treeview.pack(padx=10, pady=10, fill="both", expand=True)

        select_button = tk.Button(self.root, text="Select File", command=self.confirm_selection)
        select_button.pack(padx=10, pady=10)

        # Bind arrow keys and Enter to navigate and select
        self.root.bind("<Up>", self.on_key_press)
        self.root.bind("<Down>", self.on_key_press)
        self.root.bind("<Return>", self.on_key_press)

        self.root.mainloop()


def main(directory):
    """
    Main function to initiate the DynamicFieldForm.
    """
    if not os.path.isdir(directory):
        print("Error: The provided path is not a valid directory.")
        return

    form_width, form_height = 800, 500
    form = DynamicFieldForm(directory, form_width, form_height)
    form.create_form()


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Error: Please provide a directory path as an argument.")
    else:
        main(sys.argv[1])
