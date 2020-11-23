## coding: utf-8
<!DOCTYPE html>
<html>
   <head>
      <title>Web-Teams</title>
      <meta charset="UTF-8" />
      <link href="webteams.css" rel="stylesheet" type="text/css" />
   </head>
   <body>
      <span class="body_span">
         <%
            nr = 0
         %>
         <ul>
            % for key in data:
            <%
               nr += 1
            %>
            <li>Team ${nr}:
               <a class="a_button" href="/edit/${key}">bearbeiten</a>
               <button class="delete_button" value="${key}">löschen</button>
               <ul>
                  <li>${data[key][0]}, ${data[key][1]}, ${data[key][2]}, ${data[key][3]}</li>
                  <li>${data[key][4]}, ${data[key][5]}, ${data[key][6]}, ${data[key][7]}</li>
               </ul>
            </li>
            % endfor
         </ul>
         <span>
            <a class="a_button" href="/add">erfassen</a>
         </span>
         <span>
            <button class="toggle_list">Als ${listform_text} darstellen</button>
         </span>
         <script type="text/javascript" src="webteams.js"></script>
      </span>
   </body>
</html>