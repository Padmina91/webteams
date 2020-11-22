"use strict"

function confirm_delete() {
   let delete_decision = confirm("Wollen Sie den Eintrag wirklich löschen?");
   if (delete_decision) {
      let delete_req = new XMLHttpRequest();
      let url = '/delete?id_param=' + this.value;
      delete_req.open('DELETE', url);
      delete_req.onload = () => {
         window.location.replace("http://127.0.0.1:8080");
         location.reload();
      };
      delete_req.send();
   }
}

document.addEventListener("DOMContentLoaded", () => {
   const delete_buttons = document.getElementsByClassName("delete_button");
   for (let delete_button of delete_buttons) {
      delete_button.addEventListener('click', confirm_delete, false);
   }
});