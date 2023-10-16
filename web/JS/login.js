/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



function validarCamposLogin() {
    let inputEmail = document.getElementById("InputCorreo");
    let inputClave = document.getElementById("InputContrasenia");

    let valorEmail = inputEmail.value;
    let valorClave = inputClave.value;

    let errorEmail = document.getElementById("errorCorreo");
    let errorClave = document.getElementById("errorContrasenia"); 
 

    if (valorEmail === "") {
        inputEmail.classList.add('input-error');
        inputClave.classList.remove('input-error');
        errorEmail.classList.remove('oculto');
        errorClave.classList.add('oculto'); 

        return false;
    }

    if (valorClave === "") {
        inputClave.classList.add('input-error');
        inputEmail.classList.remove('input-error');
        errorClave.classList.remove('oculto');
        errorEmail.classList.add('oculto'); 

        return false;
    }
    
    return true;
}


function clearErrors() {
    let errorEmail = document.getElementById("errorCorreo");
    let errorClave = document.getElementById("errorContrasenia");
    let errorCorreoNoExiste = document.getElementById("errorCorreoNoExiste");
    let errorContraWrong = document.getElementById("errorContraWrong");


    let inputEmail = document.getElementById("InputCorreo");
    let inputClave = document.getElementById("InputContrasenia");

    if (inputEmail) {
        inputEmail.classList.remove('input-error');
    }

    if (inputClave) {
        inputClave.classList.remove('input-error');
    }

    if (errorEmail) {
        errorEmail.classList.add('oculto');
    }

    if (errorClave) {
        errorClave.classList.add('oculto');
    }

    if (errorCorreoNoExiste) {
        errorCorreoNoExiste.classList.add('oculto');
    }

    if (errorContraWrong) {
        errorContraWrong.classList.add('oculto');
    }
}