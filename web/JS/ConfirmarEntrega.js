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

const contenedorQR2 = document.getElementById('contenedorQR2');
new QRCode(contenedorQR2, 'https://mpago.la/pos/79869461');

$(document).ready(function () {
    $.extend($.fn.dataTable.ext.type.search, {
        // Define un método de búsqueda que sea insensible a acentos
        "type-based": function (data) {
            return !data ?
                    '' :
                    typeof data === 'string' ?
                    data
                    .replace(/á/g, 'a')
                    .replace(/é/g, 'e')
                    .replace(/í/g, 'i')
                    .replace(/ó/g, 'o')
                    .replace(/ú/g, 'u')
                    .replace(/ñ/g, 'n') :
                    data;
        }
    });

    // Inicializa el DataTable y aplica la configuración
    $('#dataTable').DataTable({
        language: {
            "decimal": "",
            "emptyTable": "No hay información",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ entradas",
            "infoEmpty": "Mostrando 0 to 0 of 0 entradas",
            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ entradas",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "Sin resultados encontrados",
            "paginate": {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        },
        columnDefs: [
            {"type": "type-based", "targets": "_all"},
            { targets: 4, orderable: false }
        ]
    });
});

function verMapa(calle, numero) {
    let direccion =  "Paysandu" + "+" + calle + "+" + numero;
    let url = 'https://www.google.com/maps?q=' + direccion; // Construye la URL de búsqueda en Google Maps
    window.open(url, '_blank'); // Abre la URL en una nueva pestaña
};
