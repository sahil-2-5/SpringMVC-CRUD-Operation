/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function validate_empty(field, message) {
    var value = document.getElementById(field).value.trim();
    if (value === "") {
        alert(message);
        document.getElementById(field).focus();
        return false;
    }
    return true;
}