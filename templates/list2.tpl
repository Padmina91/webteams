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
            <a href="/edit/${key}/${listform0}/">bearbeiten</a>
            <!-- hier müssen Sie den "Schalter" für das Löschen ergänzen -->
            <ul>
               <li>${data[key][0]}, ${data[key][1]}, ${data[key][2]}</li>
               <!-- hier müssen Sie die Angaben für das 2. Team-Mitglied ergänzen -->
            </ul>
         </li>
         % endfor
      </ul>
      <div>
         <a href="/add/${listform0}/">erfassen</a>
      </div>
      <div>
         <a href="/?listform=${listform}">Als ${listformText} darstellen</a>
      </div>
      <script type="text/javascript" src="/webteams.js"></script>
   </body>
</html>