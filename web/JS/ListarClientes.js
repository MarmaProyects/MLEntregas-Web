/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function() {
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
        "columnDefs": [
            { "type": "type-based", "targets": "_all" }
        ]
    });
});