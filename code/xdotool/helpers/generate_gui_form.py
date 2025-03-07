import json
import tkinter as tk
import argparse
from typing import Dict, List

class FormApp:
    """A simple GUI form application that collects user input and returns JSON output."""
    
    def __init__(self, root: tk.Tk, fields: List[str]) -> None:
        """
        Initialize the form application.
        
        :param root: The root Tkinter window.
        :param fields: A list of field names to display.
        """
        self.root = root
        self.fields = fields
        self.entries: Dict[str, tk.Entry] = {}

        root.title("Required Data")

        for i, field in enumerate(fields):
            tk.Label(root, text=field).grid(row=i, column=0, padx=10, pady=5)
            entry = tk.Entry(root)
            entry.grid(row=i, column=1, padx=10, pady=5)
            self.entries[field] = entry

            # Zet focus op de eerste input field
            if i == 0:
                entry.focus_set()

        submit_button = tk.Button(root, text="Send", command=self.submit)
        submit_button.grid(row=len(fields), columnspan=2, pady=10)

        # Bind Enter-toets aan de submit functie
        root.bind("<Return>", lambda event: self.submit())

    def submit(self) -> None:
        """
        Collects user input, prints the result as JSON, and closes the window.
        """
        result = {name: entry.get() for name, entry in self.entries.items()}
        self.root.destroy()
        print(json.dumps(result, indent=4))

def parse_arguments() -> List[str]:
    """
    Parses command-line arguments for the JSON input.

    :return: A list of field names.
    """
    parser = argparse.ArgumentParser(description="Display a form based on JSON input.")
    parser.add_argument("json_input", type=str, help="JSON-formatted list of field names.")
    args = parser.parse_args()

    try:
        fields = json.loads(args.json_input)
        if not isinstance(fields, list) or not all(isinstance(field, str) for field in fields):
            raise ValueError("Invalid JSON format. Expected a list of strings.")
        return fields
    except json.JSONDecodeError:
        print("Error: Invalid JSON input.")
        exit(1)

def main() -> None:
    """
    Main function to start the form application.
    """
    fields = parse_arguments()

    root = tk.Tk()
    app = FormApp(root, fields)
    root.mainloop()

if __name__ == "__main__":
    main()
