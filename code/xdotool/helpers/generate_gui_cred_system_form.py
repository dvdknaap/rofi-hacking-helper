import json
import tkinter as tk
from tkinter import ttk, simpledialog
import argparse
import darkdetect
import sv_ttk
from typing import Dict, Any


class DynamicFormApp:
    """A dynamic form application with scrollable fields and editable labels."""

    DEFAULT_FIELDS = ["ip", "website", "domain", "username", "password", "dc", "ns_ip", "ad_username_file", "ad_password_file"]

    def __init__(self, root: tk.Tk, prefill_data: Dict[str, str], form_width: int, form_height: int):
        """Initialize the form GUI."""
        self.root = root
        self.root.title("Dynamic Form")

        # Apply system theme (dark or light)
        sv_ttk.set_theme(darkdetect.theme())

        # Position window in the center
        screen_width = root.winfo_screenwidth()
        screen_height = root.winfo_screenheight()
        x = int((screen_width / 2) - (form_width / 2))
        y = int((screen_height / 2) - (form_height / 2) - 100)
        root.geometry(f"{form_width}x{form_height}+{x}+{y}")

        # Scrollable Frame Setup
        self.canvas = tk.Canvas(root, highlightthickness=0)
        self.scrollbar = ttk.Scrollbar(root, orient="vertical", command=self.canvas.yview)
        self.scroll_frame = ttk.Frame(self.canvas)

        self.scroll_frame.bind("<Configure>", lambda e: self.canvas.configure(scrollregion=self.canvas.bbox("all")))
        self.canvas.create_window((0, 0), window=self.scroll_frame, anchor="nw")
        self.canvas.configure(yscrollcommand=self.scrollbar.set)

        # Scrollwheel binding (Windows + Linux)
        root.bind_all("<MouseWheel>", self._on_mousewheel)  # Windows
        root.bind_all("<Button-4>", self._on_mousewheel)  # Linux (some distro’s)
        root.bind_all("<Button-5>", self._on_mousewheel)  # Linux (some distro’s)

        self.canvas.pack(side="left", fill="both", expand=True)
        self.scrollbar.pack(side="right", fill="y")

        # Store input fields
        self.entries = {}

        # Input fields frame
        self.form_frame = ttk.Frame(self.scroll_frame)
        self.form_frame.pack(padx=10, pady=10, fill="both", expand=True)

        # Initialize the control buttons immediately so that they exist
        self.controls_frame = ttk.Frame(self.scroll_frame)
        self.controls_frame.pack(fill="x", pady=10)

        self.add_button = ttk.Button(self.controls_frame, text="➕ Add Field", command=self.prompt_new_field)
        self.add_button.pack(anchor="e", padx=5, pady=(0, 5))

        self.submit_button = ttk.Button(self.controls_frame, text="Submit", command=self.submit)
        self.submit_button.pack(anchor="e", padx=5)

        # Populate fields
        self.populate_fields(prefill_data)

    def _on_mousewheel(self, event: tk.Event) -> None:
        """Enable smooth scrolling using the mouse wheel."""
        if event.num == 4 or event.delta > 0:
            self.canvas.yview_scroll(-1, "units")
        elif event.num == 5 or event.delta < 0:
            self.canvas.yview_scroll(1, "units")

    def populate_fields(self, prefill_data: Dict[str, str]) -> None:
        """Populate the form with default and prefilled fields."""

        set_first_field_focus=True

        for field in self.DEFAULT_FIELDS:
            value = prefill_data.get(field, "")
            self.add_field(field_name=field, value=value, editable=False, set_focus=set_first_field_focus)
            set_first_field_focus=False

        for field, value in prefill_data.items():
            if field not in self.entries:
                self.add_field(field_name=field, value=value, editable=True, set_focus=set_first_field_focus)
                set_first_field_focus=False

    def prompt_new_field(self) -> None:
        """Ask user for a new field name before adding it."""
        field_name = simpledialog.askstring("New Field", "Enter field name:")
        if field_name and field_name not in self.entries:
            self.add_field(field_name=field_name, value="", editable=True)

    def add_field(self, field_name: str, value: str = "", editable: bool = True, set_focus: bool = False) -> None:
        """Add a new input field with an optional editable label and remove button."""
        if field_name in self.entries:
            return  # Avoid duplicate fields

        row = len(self.entries)

        # Label + Edit Button + Remove Button
        label_frame = ttk.Frame(self.form_frame)
        label_frame.grid(row=row, column=0, padx=5, pady=5, sticky="w")

        label = ttk.Label(label_frame, text=field_name)
        label.pack(side="left")

        if editable:
            edit_button = ttk.Button(label_frame, text="✏️", width=2, command=lambda: self.edit_label(label))
            edit_button.pack(side="left", padx=(5, 0))

            remove_button = ttk.Button(label_frame, text="❌", width=2, command=lambda: self.remove_field(field_name, label_frame, entry))
            remove_button.pack(side="left", padx=(5, 0))

        # Entry field
        entry = ttk.Entry(self.form_frame)
        entry.grid(row=row, column=1, padx=5, pady=5, sticky="ew")
        entry.insert(0, value)


        # Focus on the first input
        if set_focus:
            entry.focus_set()

        # Bind keyboard shortcuts
        entry.bind("<Control-a>", self.select_all_entry_text)  # Windows/Linux Ctrl + A
        entry.bind("<Command-a>", self.select_all_entry_text)  # Mac ⌘ + A
        entry.bind("<Return>", self.submit_on_enter)
        entry.bind("<KP_Enter>", self.submit_on_enter)

        self.entries[field_name] = entry

        # Always move the buttons to the bottom
        self.controls_frame.pack_forget()
        self.controls_frame.pack(fill="x", pady=10)

    def edit_label(self, label: ttk.Label) -> None:
        """Allow the user to edit the label name."""
        old_name = label.cget("text")
        new_name = simpledialog.askstring("Edit Field Name", "Enter new field name:", initialvalue=old_name)
        if new_name and new_name not in self.entries:
            self.entries[new_name] = self.entries.pop(old_name)
            label.config(text=new_name)

    def remove_field(self, field_name: str, label_frame: ttk.Frame, entry: ttk.Entry) -> None:
        """Remove a custom field."""
        if field_name in self.entries:
            del self.entries[field_name]
        label_frame.destroy()
        entry.destroy()

    def select_all_entry_text(self, event) -> str:
        """Selects all text in an input field with Ctrl + A or ⌘ + A."""
        event.widget.select_range(0, tk.END)
        return "break"  # Prevents default behavior of Tkinter

    def submit_on_enter(self, event) -> None:
        """Submit the form when Enter is pressed in any input field."""
        self.submit()

    def submit(self) -> None:
        """Collect form data and print it as JSON."""
        result = {name: entry.get() for name, entry in self.entries.items() if entry.winfo_exists()}
        print(json.dumps(result))
        
        self.root.quit()
        self.root.destroy()
        exit(0)

def parse_arguments() -> Dict[str, Any]:
    """Parse JSON input for prefilled form values."""
    parser = argparse.ArgumentParser(description="Dynamic Form with Prefilled Data")
    parser.add_argument("--fields", type=str, help="JSON string with prefilled values")
    args = parser.parse_args()

    if args.fields:
        try:
            return json.loads(args.fields)
        except json.JSONDecodeError:
            print("Invalid JSON format.")
            exit(1)
    return {}


def main() -> None:
    """Start the dynamic form application."""
    form_width, form_height = 800, 500
    prefill_data = parse_arguments()
    root = tk.Tk()
    app = DynamicFormApp(root, prefill_data, form_width, form_height)
    root.mainloop()


if __name__ == "__main__":
    main()
