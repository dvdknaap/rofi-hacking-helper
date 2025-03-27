import json
import tkinter as tk
import argparse
from typing import List, Dict, Union, Tuple, Any
from tkinter import ttk, simpledialog
import sv_ttk
import darkdetect

class FormApp:
    """A GUI form that collects user input and outputs it as JSON."""

    def __init__(self, root: tk.Tk, fields: List[Union[str, Dict]], active_cred_system_fields: Dict[str, Any] | str, form_width: int = 800, form_height: int = 800) -> None:
        """
        Initialize the GUI.

        :param root: The main window of Tkinter.
        :param fields: A list of field names or JSON objects with additional parameters.
        :param active_cred_system_fields: A list of field names or JSON objects with additional parameters.
        :param form_width: Form width.
        :param form_height: Form height.
        """
        self.root = root
        self.fields = fields
        self.entries: Dict[str, tk.Widget | str] = {}
        form_fields_added = False 
        first_field = True

        root.title("Required Data")

        # get screen width and height
        screen_width = root.winfo_screenwidth() # width of the screen
        screen_height = root.winfo_screenheight() # height of the screen

        # calculate x and y coordinates for the Tk root window
        x = (screen_width/2) - (form_height/2)
        y = (screen_height/2) - (form_height/2) - 100

        root.geometry('%dx%d+%d+%d' % (form_width, form_height, x, y))

        # Scrollable Frame Setup
        self.canvas = tk.Canvas(root, highlightthickness=0)  # Highlight weg
        scrollbar = ttk.Scrollbar(root, orient="vertical", command=self.canvas.yview)
        
        self.scroll_frame = ttk.Frame(self.canvas)

        self.scroll_frame.bind("<Configure>", lambda e: self.canvas.configure(scrollregion=self.canvas.bbox("all")))
        self.canvas.create_window((0, 0), window=self.scroll_frame, anchor="nw")
        self.canvas.configure(yscrollcommand=scrollbar.set)

        # Scrollwheel binding (Windows + Linux)
        root.bind_all("<MouseWheel>", self._on_mousewheel)  # Windows
        root.bind_all("<Button-4>", self._on_mousewheel)  # Linux (op sommige distro’s)
        root.bind_all("<Button-5>", self._on_mousewheel)  # Linux (op sommige distro’s)

        self.canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")

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

            # Check if field name is in credential system
            if active_cred_system_fields != "" and field_name in active_cred_system_fields:
                if active_cred_system_fields.get(field_name, "") != "":
                    
                    self.entries[field_name] = active_cred_system_fields.get(field_name, "")
                    continue

            tk.Label(self.scroll_frame, text=label_text).grid(row=i, column=0, padx=10, pady=5)

            if field_type == "text" or field_type == "number":
                if field_type == "number":
                    vcmd = (self.root.register(self.validate_numeric_input), "%P")
                    entry = ttk.Entry(self.scroll_frame, validate="key", validatecommand=vcmd)
                else:
                    entry = ttk.Entry(self.scroll_frame)

                entry.grid(row=i, column=1, padx=10, pady=5)

                if default_value:
                    entry.insert(0, default_value)  # Set the default value

                entry.bind("<Control-a>", self.select_all_entry_text)  # Bind Ctrl + A
                entry.bind("<Command-a>", self.select_all_entry_text)  # Voor Mac (⌘ + A)
                entry.bind("<Return>", lambda event, field_name=field_name: self.submit_on_enter(event, field_name))
                self.entries[field_name] = entry
                
            elif field_type == "select" and options:
                entry = ttk.Combobox(self.scroll_frame, values=options, state="readonly")
                entry.grid(row=i, column=1, padx=10, pady=5)

                if default_value in options:
                    entry.set(default_value)  # Use the specified default value
                else:
                    entry.current(0)  # Select default first option

                self.entries[field_name] = entry

            elif field_type == "checkbox":
                var = tk.BooleanVar(value=default_value)
                entry = tk.Checkbutton(self.scroll_frame, text=label_text, variable=var)
                entry.grid(row=i, column=1, padx=5, pady=5)
                self.entries[field_name] = var

            elif field_type == "radio" and options:
                var = tk.StringVar(value=default_value)
                row_offset = i  # Row offset for radio buttons
                for j, option in enumerate(options):
                    entry = tk.Radiobutton(self.scroll_frame, text=option, value=option, variable=var)
                    entry.grid(row=1, column=row_offset, padx=2, pady=2)
                    row_offset += 1
                self.entries[field_name] = var

            else:
                print(f"Error: Invalid field type '{field_type}' for '{field_name}'")
                exit(1)

            form_fields_added = True

            # Focus on the first input
            if first_field == True:
                entry.focus_set()
                first_field = False
                
        if form_fields_added == False:
            self.submit()
            return
        
        submit_button = ttk.Button(self.scroll_frame, text="Send", command=self.submit)
        submit_button.grid(row=len(fields), columnspan=2, pady=10)

        # Bind Enter key to submit function
        root.bind("<Return>", lambda event: self.submit())

    def _on_mousewheel(self, event) -> None:
        """Enable mousewheel scrolling"""
        if event.num == 4:  # Linux scroll up
            self.canvas.yview_scroll(-1, "units")
        elif event.num == 5:  # Linux scroll down
            self.canvas.yview_scroll(1, "units")
        else:  # Windows / macOS
            self.canvas.yview_scroll(-1 * (event.delta // 120), "units")

    def validate_numeric_input(self, new_value: str) -> bool:
        """Validates whether the input contains only numeric values."""
        return new_value.isdigit() or (new_value.startswith("-") and new_value[1:].isdigit()) or new_value == ""
    
    def select_all_entry_text(self, event) -> str:
        """Selects all text in an input field with Ctrl + A or ⌘ + A."""

        event.widget.select_range(0, tk.END)
        return "break"  # Prevents default behavior of Tkinter

    def submit_on_enter(self, event, field_name: str) -> None:
        """Submit the form when Enter is pressed in any input field."""
        self.submit()

    def submit(self) -> None:
        """Collect user input and close the window."""

        result = {
            name: (entry.get() if isinstance(entry, (tk.StringVar, ttk.Entry)) else entry)
            for name, entry in self.entries.items()
        }

        print(json.dumps(result))

        self.root.quit()
        self.root.destroy()
        exit(0)

def parse_arguments() -> Tuple[List[Union[str, Dict]], Dict[str, Any]]:
    """Parse JSON input and supports both a list of field names and a list of objects."""

    parser = argparse.ArgumentParser(description="Show a form based on JSON input.")
    parser.add_argument("json_input", type=str, help="JSON-formatted list of fields or objects.")
    parser.add_argument("active_cred_system_json", type=str, help="JSON-formatted list of fields from credential system.")
    args = parser.parse_args()

    try:
        active_cred_system_fields=""
        fields = ""
        if [ "${args.json_input}" != "" ]:
            fields = json.loads(args.json_input)

        if not isinstance(fields, list):
            raise ValueError("Invalid JSON format. Expected a list.")
        
        if args.active_cred_system_json != "":
            active_cred_system_fields = json.loads(args.active_cred_system_json)

            if not isinstance(active_cred_system_fields, dict):
                raise ValueError("Invalid JSON format. Expected a dict.")
            
        return fields,active_cred_system_fields
    except json.JSONDecodeError as e:
        print("Error: Invalid JSON input.", file=e.stderr)
        exit(1)

def main() -> None:
    """Start the form."""

    fields, active_cred_system_fields = parse_arguments()
    form_width=400
    form_height=400

    root = tk.Tk()
    app = FormApp(root, fields, active_cred_system_fields, form_width, form_height)

    sv_ttk.set_theme(darkdetect.theme())

    root.mainloop()

if __name__ == "__main__":
    main()
