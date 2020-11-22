# coding: utf-8

import codecs
from pathlib import Path
import os.path

from mako.template import Template
from mako.lookup import TemplateLookup

class View:

   def __init__(self):
      self.lookup = TemplateLookup('./templates')

   def create_list(self, data_param):
      template = self.lookup.get_template('list.tpl')
      markup = template.render(data = data_param)
      return markup

   def create_form(self, id, data_param):
      template = self.lookup.get_template('form.tpl')
      markup = template.render(data = data_param, key = id)
      return markup

   def read_file(self, file_name):
      content = ''
      current_file = Path(os.path.abspath(__file__))
      webteams_dir = current_file.parent.parent
      templates_dir = os.path.join(webteams_dir, 'templates')
      with codecs.open(os.path.join(templates_dir, file_name), 'r', 'utf-8') as fp:
         content = fp.read()
      return content