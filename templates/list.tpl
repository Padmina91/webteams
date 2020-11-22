## coding: utf-8
<!DOCTYPE html>
<html>
   <head>
      <title>Web-Teams</title>
      <meta charset="UTF-8" />
   </head>
   <body>
      <table>
         <tr>
            <th>Name</th><th>Vorname</th><th>Matr.-Nr.</th><th>Semesteranzahl</th><th>Aktion 1</th><th>Aktion 2</th>
         </tr>
         % for key in data:
         <tr>
            <td>${data[key][0]}</td>
            <td>${data[key][1]}</td>
            <td>${data[key][2]}</td>
            <td>${data[key][3]}</td>
         </tr>
         <tr>
            <td>${data[key][4]}</td>
            <td>${data[key][5]}</td>
            <td>${data[key][6]}</td>
            <td>${data[key][7]}</td>
            <td><a href="/edit/${key}">bearbeiten</a></td>
            <td><button class="delete_button" value="${key}">löschen</button></td>
         </tr>
         % endfor
      </table>
      <div>
         <a href="/add">erfassen</a>
      </div>
      <script type="text/javascript" src="/webteams.js"></script>
   </body>
</html>