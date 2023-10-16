/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function verificarCamposVacios() {
    let cedula = document.getElementById("InputCedula");
    let nombre = document.getElementById("InputNombre");
    let apellido = document.getElementById("InputApellido");
    let correo = document.getElementById("InputCorreo");
    let contrasenia = document.getElementById("InputContrasenia");

    let valorCedula = cedula.value;
    let valorNombre = nombre.value;
    let valorApellido = apellido.value;
    let valorCorreo = correo.value;
    let valorContrasenia = contrasenia.value;

    let errorCedula = document.getElementById("errorCedula");
    let errorNombre = document.getElementById("errorNombre");
    let errorApellido = document.getElementById("errorApellido");
    let errorCorreo = document.getElementById("errorCorreo");
    let errorContrasenia = document.getElementById("errorContrasenia");
    let errorCedulaLong = document.getElementById("errorCedulaLong");
    let errorContraLong = document.getElementById("errorContraLong");

    errorCedulaLong.classList.add('oculto');
    errorContraLong.classList.add('oculto');
    errorCedula.classList.add('oculto');
    errorNombre.classList.add('oculto');
    errorApellido.classList.add('oculto');
    errorCorreo.classList.add('oculto');
    errorContrasenia.classList.add('oculto');

    if (valorCedula === "") {
        cedula.classList.add('input-error');
        errorCedula.classList.remove('oculto');

        return false;
    }

    if (valorNombre === "") {
        nombre.classList.add('input-error');
        errorNombre.classList.remove('oculto');

        return false;
    }

    if (valorApellido === "") {
        apellido.classList.add('input-error');
        errorApellido.classList.remove('oculto');

        return false;
    }

    if (valorCorreo === "") {
        correo.classList.add('input-error');
        errorCorreo.classList.remove('oculto');

        return false;
    }

    if (valorContrasenia === "") {
        contrasenia.classList.add('input-error');
        errorContrasenia.classList.remove('oculto');

        return false;
    }


    if (!/^\d{8}$/.test(valorCedula)) {
        cedula.classList.add('input-error');
        errorCedulaLong.classList.remove('oculto');

        return false;
    }

    if (valorContrasenia.length < 8) {
        contrasenia.classList.add('input-error');
        errorContraLong.classList.remove('oculto');

        return false;
    }
    return true;
}


function validarCedula(input) {
    input.value = input.value.replace(/[^0-9]/g, "");

    if (input.value.length > 8) {
        input.value = input.value.slice(0, 8);
    }
}

function clearErrors() {
    let errorCedula = document.getElementById("errorCedula");
    let errorCedulaLong = document.getElementById("errorCedulaLong");
    let errorContraLong = document.getElementById("errorContraLong");
    let errorCorreoDuplicated = document.getElementById("errorCorreoDuplicated");
    let errorNombre = document.getElementById("errorNombre");
    let errorApellido = document.getElementById("errorApellido");
    let errorCorreo = document.getElementById("errorCorreo");
    let errorContrasenia = document.getElementById("errorContrasenia");

    let cedula = document.getElementById("InputCedula");
    let nombre = document.getElementById("InputNombre");
    let apellido = document.getElementById("InputApellido");
    let correo = document.getElementById("InputCorreo");
    let contrasenia = document.getElementById("InputContrasenia");

    if (cedula) {
        cedula.classList.remove('input-error');
    }

    if (nombre) {
        nombre.classList.remove('input-error');
    }

    if (apellido) {
        apellido.classList.remove('input-error');
    }

    if (correo) {
        correo.classList.remove('input-error');
    }

    if (contrasenia) {
        contrasenia.classList.remove('input-error');
    }

    if (errorCedula) {
        errorCedula.classList.add('oculto');
    }

    if (errorCedulaLong) {
        errorCedulaLong.classList.add('oculto');
    }

    if (errorNombre) {
        errorNombre.classList.add('oculto');
    }

    if (errorApellido) {
        errorApellido.classList.add('oculto');
    }

    if (errorCorreo) {
        errorCorreo.classList.add('oculto');
    }

    if (errorContrasenia) {
        errorContrasenia.classList.add('oculto');
    }

    if (errorContraLong) {
        errorContraLong.classList.add('oculto');
    }

    if (errorCorreoDuplicated) {
        errorCorreoDuplicated.classList.add('oculto');
    }
}