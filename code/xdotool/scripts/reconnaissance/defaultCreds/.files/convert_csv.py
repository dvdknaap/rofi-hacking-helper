import csv

skip_fields=("<blank>" "(any 3 characters)" "(any 3 chars)" "(any)" "(created)" "(hostname/ipaddress)")
def extract_unique_userpass(csv_file: str, output_file: str = "userpass.txt"):
    unique_entries = set()
    
    with open(csv_file, newline='', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        
        for row in reader:
            username = row.get("username", "").strip()
            password = row.get("password", "").strip()
            
            if username not in skip_fields and password not in skip_fields:
                unique_entries.add(f"{username}:{password}")
    
    with open(output_file, "w", encoding="utf-8") as outfile:
        outfile.write("\n".join(sorted(unique_entries)))
    
    print(f"Saved {len(unique_entries)} unique entries to {output_file}")

# Gebruik de functie met je CSV-bestand
extract_unique_userpass("DefaultCreds-Cheat-Sheet.csv")
