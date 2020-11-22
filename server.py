#coding: utf-8

import sys
import os
import cherrypy
from app import application

def main():
   # Get current directory
   try:
       current_dir = os.path.dirname(os.path.abspath(__file__))
   except:
       current_dir = os.path.dirname(os.path.abspath(sys.executable))
   # disable autoreload
   cherrypy.engine.autoreload.unsubscribe()
   # Logger aktivieren
   cherrypy.config.update({
      'log.access_file': "access.log",
      'log.error_file': "server.log",
      'log.screen': True,
   })
   # Static content config
   static_config = {
      '/': {
         'tools.staticdir.root': current_dir,
         'tools.staticdir.on': True,
         'tools.staticdir.dir': './content'
      }
   }
   # Mount static content handler
   cherrypy.tree.mount(application.Application(), '/', static_config)
   # suppress traceback-info
   cherrypy.config.update({'request.show_tracebacks': False})
   # Start server
   cherrypy.engine.start()
   cherrypy.engine.block()
   
#class Control:
#   def __init__(self):
#      pass
#
#   @cherrypy.expose
#   def shutdown(self):
#      cherrypy.engine.exit()

if __name__ == '__main__':
   main()