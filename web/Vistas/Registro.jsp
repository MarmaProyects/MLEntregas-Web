<%-- 
    Document   : Login
    Created on : Oct 4, 2023, 9:00:45 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/Login.css">

        <title>Registro</title>
    </head>
    <body>
        <div id="divTitulo">
            <h1>Registro de Usuario</h1>
        </div>
        <div class="formularioRegistro">
            <form>
                <div class="mb-3">
                    <label for="InputCedula" class="form-label">Cedula</label>
                    <input type="text" class="form-control" id="InputCedula" required>
                </div>
                <div class="col-auto">
                    <span id="passwordHelpInline" class="form-text">
                        Debe ingresar entre 1 y 8 digitos.
                    </span>
                </div>

                <div class="mb-3">
                    <label for="InputNombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="InputNombre" required>
                </div>
                <div class="mb-3">
                    <label for="InputApellido" class="form-label">Apellido</label>
                    <input type="text" class="form-control" id="InputApellido" required>
                </div>
                <div class="mb-3">
                    <label for="InputEmail1" class="form-label">Correo Electronico</label>
                    <input type="email" class="form-control" id="InputEmail1" required>
                </div>
                <div class="mb-3">
                    <label for="InputPassword1" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="InputPassword1" required>
                </div>
                <div id="divRegistrarUsuario">
                    <button type="submit" class="btn btn-primary" id="botonR">Registrar Usuario</button>
                </div>
            </form>
        </div>



    </body>
</html>