#!/bin/bash

: '
start http server and always return 200
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "python3 -c \"PORT=1337; import http.server; import socketserver; exec('class Handler(http.server.SimpleHTTPRequestHandler):\\n def send_error(self, code, message=None):\\n  self.send_response(200); self.end_headers(); self.wfile.write(b\\'OK\\')'); http.server.HTTPServer(('0.0.0.0', PORT), Handler).serve_forever()\""
