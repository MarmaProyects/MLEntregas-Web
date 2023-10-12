/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function verificarCamposVacios (){
    let cedula = document.getElementById("InputCedula");
    let nombre = document.getElementById("InputNombre");
    let apellido = document.getElementById("InputApellido");
    let correo = document.getElementById("InputCorreo");
    let contrasenia = document.getElementById("InputContrasenia");
    let formularioRegistro = document.getElementById("formularioR");
    
    formularioRegistro.addEventListener("submit", function(event){
        event.preventDefault();
        let alertas = "";
        if(cedula.value.length > 8){
            let alerta = document.getElementsByName("errorCedula");
            alerta.className = alerta.className.replace("ocultarElemento", "");
        }
    });
        
    
}
