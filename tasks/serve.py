#!/usr/bin/env python
import os # pour le chdir
import SimpleHTTPServer
import SocketServer
# minimal web server.
os.chdir(os.environ['HOME']+'/Sites/webroot/output')
PORT = 8000
Handler = SimpleHTTPServer.SimpleHTTPRequestHandler
httpd = SocketServer.TCPServer(("", PORT), Handler)
print "serving at port", PORT
httpd.serve_forever()
