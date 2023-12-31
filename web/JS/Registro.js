/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function verificarCamposVacios() {
    let cedula = document.getElementById("InputCedula");
    let nombre = document.getElementById("InputNombre");
    let apellido = document.getElementById("InputApellido");
    let telefono = document.getElementById("InputTelefono");
    let correo = document.getElementById("InputCorreo");
    let contrasenia = document.getElementById("InputContrasenia");
    let contrasenia2 = document.getElementById("InputContrasenia2");

    let valorCedula = cedula.value;
    let valorNombre = nombre.value;
    let valorApellido = apellido.value;
    let valorTelefono = telefono.value;
    let valorCorreo = correo.value;
    let valorContrasenia = contrasenia.value;
    let valorContrasenia2 = contrasenia2.value;

    let errorCedula = document.getElementById("errorCedula");
    let errorNombre = document.getElementById("errorNombre");
    let errorApellido = document.getElementById("errorApellido");
    let errorTelefono = document.getElementById("errorTelefono");
    let errorCorreo = document.getElementById("errorCorreo");
    let errorContrasenia = document.getElementById("errorContrasenia");
    let errorContrasenia2 = document.getElementById("errorContrasenia2");
    let errorCedulaLong = document.getElementById("errorCedulaLong");
    let errorContraLong = document.getElementById("errorContraLong");
    let errorPwdDesigual = document.getElementById("errorPwdDesigual");

    errorCedulaLong.classList.add('oculto');
    errorContraLong.classList.add('oculto');
    errorCedula.classList.add('oculto');
    errorNombre.classList.add('oculto');
    errorApellido.classList.add('oculto');
    errorCorreo.classList.add('oculto');
    errorTelefono.classList.add('oculto');
    errorContrasenia.classList.add('oculto');
    errorContrasenia2.classList.add('oculto');

    if (valorCorreo === "") {
        correo.classList.add('input-error');
        errorCorreo.classList.remove('oculto');

        return false;
    }

    if (valorCedula === "") {
        cedula.classList.add('input-error');
        errorCedula.classList.remove('oculto');

        return false;
    }

    if (!/^\d{8}$/.test(valorCedula)) {
        cedula.classList.add('input-error');
        errorCedulaLong.classList.remove('oculto');

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

    if (valorTelefono === "") {
        telefono.classList.add('input-error');
        errorTelefono.classList.remove('oculto');

        return false;
    }

    if (!(/^\d{8}$/.test(valorTelefono) || /^\d{9}$/.test(valorTelefono))   ) {
        telefono.classList.add('input-error');
        errorTelefonoLong.classList.remove('oculto');

        return false;
    }

    if (valorContrasenia === "") {
        contrasenia.classList.add('input-error');
        errorContrasenia.classList.remove('oculto');

        return false;
    }

    if (valorContrasenia2 === "") {
        contrasenia2.classList.add('input-error');
        errorContrasenia2.classList.remove('oculto');

        return false;
    }

    if (valorContrasenia.length < 8) {
        contrasenia.classList.add('input-error');
        errorContraLong.classList.remove('oculto');

        return false;
    }

    if (valorContrasenia !== valorContrasenia2) {
        errorPwdDesigual.classList.remove('oculto');
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
    let errorContraLong2 = document.getElementById("errorContraLong2");
    let errorCorreoDuplicated = document.getElementById("errorCorreoDuplicated");
    let errorNombre = document.getElementById("errorNombre");
    let errorApellido = document.getElementById("errorApellido");
    let errorCorreo = document.getElementById("errorCorreo");
    let errorTelefono = document.getElementById("errorTelefono");
    let errorTelefonoLong = document.getElementById("errorTelefonoLong");
    let errorContrasenia = document.getElementById("errorContrasenia");
    let errorContrasenia2 = document.getElementById("errorContrasenia2");

    let cedula = document.getElementById("InputCedula");
    let nombre = document.getElementById("InputNombre");
    let apellido = document.getElementById("InputApellido");
    let correo = document.getElementById("InputCorreo");
    let telefono = document.getElementById("InputTelefono");
    let contrasenia = document.getElementById("InputContrasenia");
    let contrasenia2 = document.getElementById("InputContrasenia2");

    if (correo) {
        correo.classList.remove('input-error');
    }
    
    if (cedula) {
        cedula.classList.remove('input-error');
    }

    if (nombre) {
        nombre.classList.remove('input-error');
    }

    if (apellido) {
        apellido.classList.remove('input-error');
    }
    
    if (telefono) {
        telefono.classList.remove('input-error');
    }

    if (errorTelefonoLong) {
        errorTelefonoLong.classList.remove('input-error');
    }

    if (contrasenia) {
        contrasenia.classList.remove('input-error');
    }

    if (contrasenia2) {
        contrasenia2.classList.remove('input-error');
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
    
    if (errorTelefono) {
        errorTelefono.classList.add('oculto');
    }
    
    if (errorTelefonoLong) {
        errorTelefonoLong.classList.add('oculto');
    }

    if (errorContrasenia) {
        errorContrasenia.classList.add('oculto');
    }

    if (errorContraLong) {
        errorContraLong.classList.add('oculto');
    }

    if (errorContrasenia2) {
        errorContrasenia2.classList.add('oculto');
    }

    if (errorContraLong2) {
        errorContraLong.classList.add('oculto');
    }

    if (errorCorreoDuplicated) {
        errorCorreoDuplicated.classList.add('oculto');
    }
}

function compararContrasenias() {
    let contrasenia = document.getElementById("InputContrasenia").value;
    let contrasenia2 = document.getElementById("InputContrasenia2").value;
    let errorPwdDesigual = document.getElementById("errorPwdDesigual");


    if (contrasenia === contrasenia2) {
        errorPwdDesigual.classList.add('oculto');
    } else {
        errorPwdDesigual.classList.remove('oculto');
    }

}