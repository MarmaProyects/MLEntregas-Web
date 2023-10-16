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
        <link rel="stylesheet" href="CSS/Styles.css">
        <link rel="stylesheet" href="CSS/Login.css">
        <script src="JS/bootstrap.bundle.min.js"></script>
        <script src="JS/login.js"></script>
        <title>Login</title>
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <div id="divTitulo">
                <h1>¡Bienvenido!</h1>
            </div>
            <div class="formularioLogin">
                <form action="/Login" method="POST" id="formulearioL" onsubmit="return validarCamposLogin()">
                    <div class=" ">
                        <label for="InputEmail1" class="form-label">Correo Electronico:</label>
                        <input type="email"  onfocus="clearErrors()" class="form-control" name="InputCorreo" id="InputCorreo" value="<%= request.getAttribute("correo") != null ? request.getAttribute("correo") : ""%>">
                    </div>
                    <div class="error-message">
                        <span id="errorCorreo" class="error oculto">
                            Debe ingresar su email.
                        </span>
                        <% if (request.getAttribute("error") == "user") {%>
                        <span id="errorCorreoNoExiste" class="error">
                            No existe un usuario con este correo.
                        </span>
                        <% }%>
                    </div>
                    <div class="">
                        <label for="InputPassword1" class="form-label">Contraseña:</label>
                        <input type="password" onfocus="clearErrors()" class="form-control" name="InputContrasenia" id="InputContrasenia"  >
                    </div>
                    <div class="error-message">
                        <span id="errorContrasenia" class="oculto">
                            Debe ingresar su contraseña.
                        </span>
                        <% if (request.getAttribute("error") == "password") {%>
                        <span id="errorContraWrong" class="error">
                            Contraseña incorrecta.
                        </span>
                        <% }%>
                    </div>
                    <br>
                    <div id="divInicioSesion">
                        <button type="submit" class="btn button" id="botonIniciarS">Iniciar Sesion</button>
                    </div>
                    <a href="/Registro" class="link">¿No tienes cuenta?</a>
                    <a href="#" class="link-right">¿Olvidó su contraseña?</a>
                </form>
            </div>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>
