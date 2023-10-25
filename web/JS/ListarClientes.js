/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function traerDireccionCliente() {

}

function buscarNombre() {
    let input = document.getElementById("nombre-apellido").value;
    if (input!= null || !input.equals("")) {
        input = encodeURIComponent(input);
    }
    window.location.href = "/Listaclientes?buscar=" + input;
}

function validarNomApe() {
    let input = document.getElementById("nombre-apellido");
    let valor = input.value;

    let errordigi = document.getElementById("errordigi");
    let errorNomApe = document.getElementById("errorNomApe");
    if (errorNomApe === "") {
        input.classList.add('oculto');
    }
    if (valor === "") {
        input.classList.add('input-error');
        errordigi.classList.remove('oculto');
        return false;
    }
    return true;
}

document.addEventListener('DOMContentLoaded', function () {
    let input = document.getElementById("nombre-apellido");
    input.focus();
});

function pulsar(e) {
    if (e.keyCode === 13) {
        e.preventDefault();
        var boton = document.getElementById("btnBuscar");
        boton.click();
    }
}