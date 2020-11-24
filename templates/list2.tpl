## coding: utf-8
<!DOCTYPE html>
<html>
   <head>
      <title>Web-Teams</title>
      <meta charset="UTF-8" />
      <link rel="preconnect" href="https://fonts.gstatic.com" />
      <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;800&family=Quicksand:wght@400;700&display=swap" rel="stylesheet" />
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
               <a class="pseudo-button" href="/edit/${key}">bearbeiten</a>
               <button class="delete_button" value="${key}">löschen</button>
               <ul>
                  <li>${data[key][0]}, ${data[key][1]}, ${data[key][2]}, ${data[key][3]}</li>
                  <li>${data[key][4]}, ${data[key][5]}, ${data[key][6]}, ${data[key][7]}</li>
               </ul>
            </li>
            % endfor
         </ul>
         <span>
            <a class="pseudo-button" href="/add">erfassen</a>
         </span>
         <span>
            <button class="toggle_list">Als ${listform_text} darstellen</button>
         </span>
         <script type="text/javascript" src="webteams.js"></script>
      </span>
      <div class="centered-class">
         <img id="doggo-picture" src="https://static.giga.de/wp-content/uploads/2018/01/dog-shiba-GettyImages-824848938.jpg" />
      </div>
   </body>
</html>