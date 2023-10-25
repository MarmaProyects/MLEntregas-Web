/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('button[data-envio-id]').forEach(function (button) {
        button.addEventListener('click', function () {
            let idEnvio = this.getAttribute('data-target-form');
            document.getElementById('creditoIdEnvio').value = idEnvio;
            document.getElementById('inputCredito').value = idEnvio;
            document.getElementById('efectivoIdEnvio').value = idEnvio;
        });
    });
});

const contenedorQR = document.getElementById('contenedorQR');
new QRCode(contenedorQR, 'https://mpago.la/pos/79869461');
