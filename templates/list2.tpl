## coding: utf-8
<!DOCTYPE html>
<html>
   <head>
      <title>Web-Teams</title>
      <meta charset="UTF-8" />
   </head>
   <body>
      <%
         nr = 0
      %>
      <ul>
         % for key in data:
         <%
            nr += 1
         %>
         <li>Team ${nr}:
            <a href="/edit/${key}/${listform}/">bearbeiten</a>
            <!-- hier müssen Sie den "Schalter" für das Löschen ergänzen -->
            <ul>
               <li>${data[key][0]}, ${data[key][1]}, ${data[key][2], ${data[key][3]}</li>
               <li>${data[key][4]}, ${data[key][5]}, ${data[key][6], ${data[key][7]}</li>
            </ul>
         </li>
         % endfor
      </ul>
      <div>
         <a href="/add/${listform}/">erfassen</a>
      </div>
      <div>
         <button class="toggle_list">Als ${listform_text} darstellen</button>
      </div>
      <script type="text/javascript" src="webteams.js"></script>
      <!-- Zeile 33 gibt einen Error. Stack Trace:
      File "C:\Python39\lib\site-packages\mako\lexer.py", line 143, in parse_until_text
      raise exceptions.SyntaxException(
      mako.exceptions.SyntaxException: Expected: \|,} in file 'templates/list2.tpl' at line: 33 char: 42
      -->
   </body>
</html>