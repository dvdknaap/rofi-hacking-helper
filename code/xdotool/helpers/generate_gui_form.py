import json
import tkinter as tk
import argparse
from typing import Dict, List, Union
from tkinter import ttk, simpledialog
import sv_ttk
import darkdetect

class FormApp:
    """A GUI form that collects user input and outputs it as JSON."""

    def __init__(self, root: tk.Tk, fields: List[Union[str, Dict]]) -> None:
        """
        Initialize the GUI.

        :param root: The main window of Tkinter.
        :param fields: A list of field names or JSON objects with additional parameters.
        """
        self.root = root
        self.fields = fields
        self.entries: Dict[str, tk.Widget] = {}

        root.title("Required Data")

        for i, field in enumerate(fields):
            if isinstance(field, str):
                label_text = field
                field_name = field.lower().replace(" ", "_")
                field_type = "text"
                default_value = ""
                options = []
            elif isinstance(field, dict):
                label_text = field.get("label", "Field")
                field_name = field.get("name", label_text.lower().replace(" ", "_"))
                field_type = field.get("type", "text")
                options = field.get("options", [])
                default_value = field.get("default", "")

            tk.Label(root, text=label_text).grid(row=i, column=0, padx=10, pady=5)

            if field_type == "text" or field_type == "number":
                if field_type == "number":
                    vcmd = (self.root.register(self.validate_numeric_input), "%P")
                    entry = ttk.Entry(root, validate="key", validatecommand=vcmd)
                else:
                    entry = ttk.Entry(root)

                entry.grid(row=i, column=1, padx=10, pady=5)

                if default_value:
                    entry.insert(0, default_value)  # Set the default value

                entry.bind("<Control-a>", self.select_all_entry_text)  # Bind Ctrl + A
                entry.bind("<Command-a>", self.select_all_entry_text)  # Voor Mac (⌘ + A)
                self.entries[field_name] = entry
                
            elif field_type == "select" and options:
                entry = ttk.Combobox(root, values=options, state="readonly")
                entry.grid(row=i, column=1, padx=10, pady=5)

                if default_value in options:
                    entry.set(default_value)  # Use the specified default value
                else:
                    entry.current(0)  # Select default first option

                self.entries[field_name] = entry
            else:
                print(f"Error: Invalid field type '{field_type}' for '{field_name}'")
                exit(1)

            # Focus on the first input
            if i == 0:
                entry.focus_set()

        submit_button = ttk.Button(root, text="Send", command=self.submit)
        submit_button.grid(row=len(fields), columnspan=2, pady=10)

        # Bind Enter key to submit function
        root.bind("<Return>", lambda event: self.submit())

    def validate_numeric_input(self, new_value: str) -> bool:
        """Validates whether the input contains only numeric values."""
        return new_value.isdigit() or new_value == ""
    
    def select_all_entry_text(self, event) -> str:
        """Selects all text in an input field with Ctrl + A or ⌘ + A."""

        event.widget.select_range(0, tk.END)
        return "break"  # Prevents default behavior of Tkinter

    def submit(self) -> None:
        """Collect user input and close the window."""

        result = {name: entry.get() for name, entry in self.entries.items()}
        self.root.destroy()
        print(json.dumps(result, indent=4))

def parse_arguments() -> List[Union[str, Dict]]:
    """Parse JSON input and supports both a list of field names and a list of objects."""

    parser = argparse.ArgumentParser(description="Show a form based on JSON input.")
    parser.add_argument("json_input", type=str, help="JSON-formatted list of fields or objects.")
    args = parser.parse_args()

    try:
        fields = json.loads(args.json_input)

        if not isinstance(fields, list):
            raise ValueError("Invalid JSON format. Expected a list.")
        
        return fields
    except json.JSONDecodeError as e:
        print("Error: Invalid JSON input.", file=e.stderr)
        exit(1)

def main() -> None:
    """Start the form."""

    fields = parse_arguments()
    root = tk.Tk()
    app = FormApp(root, fields)

    sv_ttk.set_theme(darkdetect.theme())
    root.mainloop()

if __name__ == "__main__":
    main()
