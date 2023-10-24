/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function validarNumero(input) {
    input.value = input.value.replace(/[^0-9]/g, "");

    if (input.value.length > 9) {
        input.value = input.value.slice(0, 9);
    }
}

function validarDigitos(input) {
    input.value = input.value.replace(/[^0-9]/g, "");
}

function validarRastreo() {
    let input = document.getElementById("codigoRastreo");
    let valor = input.value;
    
    let errordigi = document.getElementById("errordigi");
    let errorrastreo = document.getElementById("errorrastreo");
    let errornull = document.getElementById("errornull");
    if (errorrastreo) {
        errorrastreo.classList.add('oculto');
    }
    if (valor === "") {
        input.classList.add('input-error');
        errordigi.classList.remove('oculto');
        errornull.classList.add('oculto');
        return false;
    }

    if (!/^\d{9}$/.test(valor)) {
        input.classList.add('input-error');
        errornull.classList.remove('oculto');
        errordigi.classList.add('oculto');
        return false;
    }

    return true;
}

document.addEventListener('DOMContentLoaded', function () {
    var titulo = document.getElementById('envio-title');

    var posicion = titulo.getBoundingClientRect();

    window.scrollTo({
        top: posicion.top + window.scrollY,
        behavior: 'smooth'
    });
});