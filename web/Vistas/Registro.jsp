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
        <link rel="stylesheet" href="CSS/Styles.css">
        <link rel="stylesheet" href="CSS/Registro.css">
        <script src="JS/bootstrap.bundle.min.js"></script>
        <script src="JS/Registro.js"></script>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
        <script src="JS/Scripts.js"></script>
        <title>Registro</title>
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <h1>Registro de Usuario</h1>
            <div class="formularioRegistro">
                <form action="/Registro" method="POST" id="formularioL" onsubmit="return verificarCamposVacios()">
                    <div class="">
                        <label for="InputEmail1" class="form-label">Correo Electrónico</label>
                        <input type="email" maxlength="40" onfocus="clearErrors()" class="form-control" id="InputCorreo" name="InputCorreo" value="<%= request.getAttribute("correo") != null ? request.getAttribute("correo") : ""%>">
                    </div>
                    <div class="error-message">
                        <span id="errorCorreo" class="error oculto">
                            Debe ingresar su email.
                        </span>
                        <% if (request.getAttribute("correo") != null) {%>
                        <span id="errorCorreoDuplicated" class="error">
                            Este email ya esta en uso.
                        </span>
                        <% }%>
                    </div>
                    <div class="">
                        <label for="InputCedula" class="form-label">Cedula</label> 
                        <input type="text" onfocus="clearErrors()" class="form-control" oninput="validarCedula(this)" id="InputCedula" name="InputCedula" value="<%= request.getAttribute("cedula") != null ? request.getAttribute("cedula") : ""%>">
                    </div>
                    <div class="error-message">
                        <span id="errorCedula" class="error oculto">
                            Debe ingresar su cédula sin puntos ni guión.
                        </span>
                        <span id="errorCedulaLong" class="error oculto">
                            Debe ingresar el total de su cédula.
                        </span>
                    </div>
                    <div class="">
                        <label for="InputNombre" class="form-label">Nombre</label>
                        <input type="text" maxlength="30" onfocus="clearErrors()" class="form-control" id="InputNombre" name="InputNombre" value="<%= request.getAttribute("nombre") != null ? request.getAttribute("nombre") : ""%>">
                    </div>
                    <div class="error-message">
                        <span id="errorNombre" class="error oculto">
                            Debe ingresar su nombre.
                        </span>
                    </div>
                    <div class="">
                        <label for="InputApellido" class="form-label">Apellido</label>
                        <input type="text" maxlength="30" onfocus="clearErrors()" class="form-control" id="InputApellido" name="InputApellido" value="<%= request.getAttribute("apellido") != null ? request.getAttribute("apellido") : ""%>">
                    </div>
                    <div class="error-message">
                        <span id="errorApellido" class="error oculto">
                            Debe ingresar su apellido.
                        </span>
                    </div>
                    <div class="">
                        <label for="InputTelefono" class="form-label">Teléfono/Celular</label>
                        <input type="text" maxlength="9" onfocus="clearErrors()" oninput="validarDigitos(this)" class="form-control" id="InputTelefono" name="InputTelefono" value="<%= request.getAttribute("telefono") != null ? request.getAttribute("telefono") : ""%>">
                    </div>
                    <div class="error-message">
                        <span id="errorTelefono" class="error oculto">
                            Debe ingresar su número
                        </span>
                        <span id="errorTelefonoLong" class="error oculto">
                            Debe ingresar un número válido (8 o 9 dígitos).
                        </span>
                    </div>
                    <div class="">
                        <label for="InputPassword1" class="form-label">Contraseña</label>
                        <input type="password" maxlength="40" onfocus="clearErrors()" class="form-control" id="InputContrasenia" name="InputContrasenia" value="<%= request.getAttribute("contrasenia") != null ? request.getAttribute("contrasenia") : ""%>">
                    </div>
                    <div class="error-message">
                        <span id="errorContrasenia" class="error oculto">
                            Debe ingresar su contraseña.
                        </span>
                        <span id="errorContraLong" class="error oculto">
                            Debe ingresar 8 o más caracteres.
                        </span>
                    </div>
                    <div class="">
                        <label for="InputPassword2" class="form-label">Confirmar contraseña</label>
                        <input type="password" maxlength="40" onfocus="clearErrors()" oninput="compararContrasenias()" class="form-control" id="InputContrasenia2" name="InputContrasenia2">
                    </div>
                    <div class="error-message">
                        <span id="errorContrasenia2" class="error oculto">
                            Debe ingresar su contraseña.
                        </span> 
                        
                        <span id="errorPwdDesigual" class="error oculto">
                            Las contraseñas no son iguales.
                        </span>
                        
                    </div>
                    <div id="divRegistrarUsuario">
                        <button type="submit" class="btn btn-primary button" id="botonR">Registrarme</button>
                    </div>
                </form>
            </div>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>