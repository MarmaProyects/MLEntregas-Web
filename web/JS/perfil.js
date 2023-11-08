/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function () {
    $("#btnEdit").on('click', function () {
        const info = document.getElementById("myTabContent");
        info.classList.toggle('oculto');
        const editinfo = document.getElementById("contentEdit");
        editinfo.classList.toggle('oculto');
        const button = document.getElementById("btnEdit");
        if (button.textContent == 'Editar Perfil') {
            button.textContent = "Cancelar";
            button.classList.toggle("gris");
        } else {
            button.textContent = "Editar Perfil";
            button.classList.toggle("gris");
        }
    });
    $('#fileToUpload').on('change', function () {
        const url_api = "https://imgur-8mef.vercel.app/upload";
        const client_id = '75618ba7b147238';
        const selectedFile = this.files[0]; 
        if (selectedFile) {
            const file = new FormData(); 
            file.append('file', selectedFile);
            const settings = {
                contentType: false,
                processData: false,
                crossDomain: true,
                type: "POST",
                dataType: "json",
                url: url_api,
                headers: {
                    Authorization: "Client-ID 75618ba7b147238"
                },
                data: file
            };
            $.ajax(settings)
                    .done(function (data) {
                        let idFoto = data['data']['id'];
                        let servletURL = "/ImageUpload";
                        let dataImage = {
                            idFoto: idFoto
                        };
                        let jsonString = JSON.stringify(dataImage);
                        let settings = {
                            method: "POST",
                            body: jsonString,
                            sheaders: {
                                "Content-Type": "application/json"
                            },
                        };
                        fetch(servletURL, settings)
                                .then(function (response) {
                                    if (response.ok) {
                                        console.log(response)
                                    } else {
                                        console.error("Error en la solicitud:", response.statusText);
                                    }
                                })
                                .catch(function (error) {
                                    console.error("Error:", error);
                                });
                    })
                    .fail(function (error) {
                        console.error('Error al cargar el archivo a Imgur:', error);
                    });
        }
    });
});

function validateFields() {
    let cedula = document.getElementById("cedula");
    let nombre = document.getElementById("nombre");
    let apellido = document.getElementById("apellido");
    let telefono = document.getElementById("telefono");
    let correo = document.getElementById("correo");
    let errorCedula = document.getElementById("errorCedula");
    let errorNombre = document.getElementById("errorNombre");
    let errorApellido = document.getElementById("errorApellido");
    let errorTelefono = document.getElementById("errorTelefono");
    let errorCorreo = document.getElementById("errorCorreo");
    let errorCedulaLong = document.getElementById("errorCedulaLong");
    if (cedula.value === "") {
        cedula.classList.add('input-error');
        errorCedula.classList.remove('oculto');
        return false;
    }

    if (correo.value === "") {
        correo.classList.add('input-error');
        errorCorreo.classList.remove('oculto');
        return false;
    }

    if (!/^\d{8}$/.test(cedula.value)) {
        cedula.classList.add('input-error');
        errorCedulaLong.classList.remove('oculto');
        return false;
    }

    if (nombre.value === "") {
        nombre.classList.add('input-error');
        errorNombre.classList.remove('oculto');
        return false;
    }

    if (apellido.value === "") {
        apellido.classList.add('input-error');
        errorApellido.classList.remove('oculto');
        return false;
    }

    if (telefono.value === "") {
        telefono.classList.add('input-error');
        errorTelefono.classList.remove('oculto');
        return false;
    }

    let errorTelefonoLong = document.getElementById("errorTelefonoLong");
    if (!(/^\d{8}$/.test(telefono.value) || /^\d{9}$/.test(telefono.value))) {
        telefono.classList.add('input-error');
        errorTelefonoLong.classList.remove('oculto');
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
    let errorCedulaDuplicated = document.getElementById("errorCedulaDuplicated");
    let errorCedulaLong = document.getElementById("errorCedulaLong");
    let errorCorreoDuplicated = document.getElementById("errorCorreoDuplicated");
    let errorNombre = document.getElementById("errorNombre");
    let errorApellido = document.getElementById("errorApellido");
    let errorCorreo = document.getElementById("errorCorreo");
    let errorTelefono = document.getElementById("errorTelefono");
    let errorTelefonoLong = document.getElementById("errorTelefonoLong");
    let cedula = document.getElementById("cedula");
    let nombre = document.getElementById("nombre");
    let apellido = document.getElementById("apellido");
    let correo = document.getElementById("correo");
    let telefono = document.getElementById("telefono");
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

    if (errorCedulaDuplicated) {
        errorCedulaDuplicated.classList.add('oculto');
    }

    if (errorCorreoDuplicated) {
        errorCorreoDuplicated.classList.add('oculto');
    }
}
