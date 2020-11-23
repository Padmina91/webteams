## coding: utf-8
<!DOCTYPE html>
<html>
   <head>
      <title>Web-Teams</title>
      <meta charset="UTF-8" />
      <link href="webteams.css" rel="stylesheet" type="text/css" />
   </head>
   <body>
      <div class="body_div">
         <span class="body_span">
            <table>
               <tr>
                  <th id="name_test">Name</th><th>Vorname</th><th>Matr.-Nr.</th><th>Semesterzahl</th>
               </tr>
               % for key in data:
               <tr class="team">
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
                     <td><a class="pseudo-button" href="/edit/${key}">bearbeiten</a></td>
                     <td><button class="delete_button" value="${key}">löschen</button></td>
                  </tr>
               </tr>
               % endfor
            </table>
            <span>
               <a class="pseudo-button" href="/add">erfassen</a>
            </span>
            <span>
               <button class="toggle_list">Als ${listform_text} darstellen</button>
            </span>
         </span>
      </div>
      <script type="text/javascript" src="webteams.js"></script>
   </body>
</html>