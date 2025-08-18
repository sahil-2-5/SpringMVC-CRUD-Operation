/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

function ajaxCall(url, method, destination, data, syncFlag) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById(destination).innerHTML = this.responseText;
        }
    };
    xhttp.open(method, url, syncFlag);
    xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhttp.send(data);
}

function LoadForm() {
    ajaxCall("AccountMaster.com?cmdAction=LoadForm", "GET", "load", "", true);
}

function InsertAccountData() {
    var result = validate_empty('name', 'Account Name Should Not Be Left Blank!') &&
            validate_empty('balance', 'Account Balance Should Not Be Left Blank!');

    if (!result) {
        return false;
    }

    let name = document.getElementById('name').value;
    let balance = document.getElementById('balance').value;

    let params = "name=" + name + "&balance=" + balance;

    ajaxCall("AccountMaster.com?cmdAction=InsertAccountData", "POST", "load", params, false);
}

function LoadAccountData() {
    ajaxCall("AccountMaster.com?cmdAction=LoadAccountData", "GET", "load", "", true);
}

function DeleteAccount(id) {

    if (!confirm("Are you sure you want to delete account ?")) {
        return;
    }

    let params = "id=" + id;

    ajaxCall("AccountMaster.com?cmdAction=DeleteAccount", "POST", "load", params, false);

}

function LoadDataInFormForUpdate(id) {
    let params = "id=" + id;

    ajaxCall("AccountMaster.com?cmdAction=LoadDataInFormForUpdate", "POST", "load", params, true);
}

function updateAccountData() {
    let id = document.getElementById('id').value;
    let name = document.getElementById('name').value;
    let balance = document.getElementById('balance').value;

    let params = "id=" + id + "&name=" + name + "&balance=" + balance;

    ajaxCall("AccountMaster.com?cmdAction=UpdateAccountData", "POST", "load", params, false);
}
