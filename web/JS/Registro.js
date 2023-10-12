/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function verificarCamposVacios() {
    var cedula = document.getElementById("InputCedula");
    console.log(cedula);
    var mensajeErrorCedula = document.getElementById("errorCedula");
    cedula.addEventListener("blur", function () {
        var valorCampoCedula = cedula.value;

        if (valorCampoCedula === "") {
            mensajeErrorCedula.textContent = "Este campo es obligatorio.";
            cedula.classList.remove("ocultarElemento");
            alert("error");
        } else {
            mensajeErrorCedula.textContent = "";
            cedula.classList.add("ocultarElemento");
        }
    });

}
