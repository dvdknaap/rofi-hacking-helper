#!/bin/bash

: '
start server and always return 200
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "port" "port")

# Generate GUI form
generate_form "${PORT_FIELD}"

PORT=${form_data["port"]}

execute_command "python3 -c \"import http.server; import socketserver; exec('class Handler(http.server.SimpleHTTPRequestHandler):\\n def send_error(self, code, message=None):\\n  self.send_response(200); self.end_headers(); self.wfile.write(b\\'OK\\')'); http.server.HTTPServer(('0.0.0.0', ${PORT}), Handler).serve_forever()\""
create_new_line
