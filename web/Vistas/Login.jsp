<%-- 
    Document   : Login
    Created on : 12 oct 2023, 20:11:42
    Author     : Angelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/Login.css">
        <script src="JS/bootstrap.bundle.min.js"></script>
        <script src="JS/Login.js"></script>
        <title>Login</title>
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div id="divTitulo">
            <h1>¡Bienvenido!</h1>
        </div>
        <div class="formularioLogin">
            <form id="formularioL">
                <div class="mb-3">
                    <label for="InputEmail1" class="form-label">Correo Electronico</label>
                    <input type="email" class="form-control" id="InputCorreo" required>
                </div>
                <div class="col-auto">
                    <span id="errorCorreo" class="ocultarElemento">
                        Debe ingresar entre 1 y 40 digitos.
                    </span>
                </div>
                <div class="mb-3">
                    <label for="InputPassword1" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="InputContrasenia" required>
                </div>
                <div class="col-auto">
                    <span id="errorContrasenia" class="ocultarElemento">
                        Debe ingresar entre 1 y 9 digitos.
                    </span>
                </div>
                <br>
                <div id="divInicioSesion">
                    <button type="submit" class="btn btn-primary" id="botonIniciarS">Iniciar Sesion</button>
                </div>
                <div class="row linksLogin">
                    <a href="#" class="link">¿Olvidó su contraseña?</a>
                    <a href="/Registro" class="link">¿No tienes cuenta?</a>
                </div>
            </form>
        </div>
    </body>
</html>
