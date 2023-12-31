<%-- 
    Document   : Perfil
    Created on : 25 oct 2023, 20:03:47
    Author     : MarmaduX
--%>

<%@page import="logica.fabrica.Fabrica"%>
<%@page import="logica.clases.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/Styles.css">
        <link rel="stylesheet" href="CSS/perfil.css"> 
        <script src="JS/bootstrap.bundle.min.js"></script>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
        <script src="JS/jquery-3.7.1.min.js"></script>  
        <script src="JS/perfil.js"></script> 
        <title>MLEntregas</title>
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <% Cliente client = (Cliente) request.getAttribute("cliente");%>
            <% String idfoto = (String) session.getAttribute("fotoPerfil");%>
            <div class="container emp-profile"> 
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <% if (idfoto != null && !idfoto.equals("null")) {%>
                            <img src="https://i.imgur.com/<%= idfoto%>.png" class='image' title="source: imgur.com" />
                            <% } else { %> 
                            <img src="https://i.imgur.com/xqRjqEX.png" class='image' title="source: imgur.com" />
                            <% }%> 
                            <div class="file btn btn-lg btn-primary boton-file">
                                Cambiar foto
                                <input class="boton-file" id='fileToUpload' type="file" name="file" accept=".png, .jpg, .jpeg"/>
                            </div>
                        </div>
                        <div class="profile-work">
                            <p>OPERACIONES</p>
                            <a href="/VerMisEnvios">Ver envios</a><br/>
                            <a href="/Seguimiento">Buscar envio</a><br/>
                            <label for="notifEmail" title="Recibir notificaciones por correo" style="color: white; font-weight: 600; font-size: 14px;">
                                Notificaciones de estados</label> <% Boolean valueNotisEmail = (Boolean) request.getAttribute("notisEmails");  %>
                            <input title="Recibir notificaciones por correo" type="checkbox" id="notisEmail" name="notifEmail" value="<% request.getAttribute("notisEmails"); %>"
                                   <% if (request.getAttribute("notisEmail") != null && (Boolean) request.getAttribute("notisEmail")) { %> checked <% }%>>
                        </div>
                    </div>
                    <div class="row col-md-8">
                        <div id="nameProfile" class="col-md-9">
                            <div class="profile-head">
                                <h5>
                                    <%= client.getNombre() + " " + client.getApellido()%>
                                </h5>
                            </div>
                        </div>
                        <div id="titleEditProfile" class="oculto col-md-12">
                            <div class="profile-head">
                                <p class='editarPTitle'>
                                    Editar Perfil
                                </p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <% if (request.getAttribute("error") != null) {%> 
                            <% } else { %> 
                            <button type="button" class="profile-edit-btn button" id="btnEdit" value="Editar Perfil">Editar Perfil</button>  
                            <% } %>
                        </div> 
                        <div class="">
                            <% String oculto = "oculto";%> 
                            <div class="tab-content profile-tab <%= (request.getAttribute("error") != null) ? oculto : ""%>" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Cédula de Identidad</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p><%= client.getCedula()%></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Nombre Completo</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p><%= client.getNombre() + " " + client.getApellido()%></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Email</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p><%= client.getCorreo()%></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Teléfono</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p><%=  client.getTelefono()%></p>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                            <div class="editar-perfil form-perfil <%= (request.getAttribute("error") == null) ? oculto : ""%>" id="contentEdit"> 
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <form action="/Perfil" method='POST' onsubmit="return validateFields()">
                                        <div class="row"> 
                                            <div class="col-md-3"></div>
                                            <div class="col-md-6">
                                                <label class="labelPerfil">Cédula de Identidad</label>
                                                <input class="input-edit" onfocus="clearErrors()" name='cedula'  id='cedula' oninput="validarCedula(this)" type="text" value="<%= client.getCedula()%>"/>
                                                <div class="error-message">
                                                    <span id="errorCedula" class="error oculto">
                                                        Debe ingresar su cédula sin puntos ni guión.
                                                    </span>
                                                    <span id="errorCedulaLong" class="error oculto">
                                                        Debe ingresar el total de su cédula.
                                                    </span>
                                                    <% if (request.getAttribute("error") == "Cedula") {%>
                                                    <span id="errorCedulaDuplicated" class="error">
                                                        Esa cédula ya esta en uso.
                                                    </span>
                                                    <% }%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row"> 
                                            <div class="col-md-3"></div>
                                            <div class="col-md-6">
                                                <label class="labelPerfil">Nombre</label>
                                                <input class="input-edit" onfocus="clearErrors()" name='nombre' id='nombre' type="text" value="<%= client.getNombre()%>"/>
                                                <div class="error-message">
                                                    <span id="errorNombre" class="error oculto">
                                                        Debe ingresar su nombre.
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row"> 
                                            <div class="col-md-3"></div>
                                            <div class="col-md-6">
                                                <label class="labelPerfil">Apellido</label>
                                                <input class="input-edit" onfocus="clearErrors()" name='apellido' id='apellido' type="text" value="<%= client.getApellido()%>"/>
                                                <div class="error-message">
                                                    <span id="errorApellido" class="error oculto">
                                                        Debe ingresar su apellido.
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row"> 
                                            <div class="col-md-3"></div>
                                            <div class="col-md-6">
                                                <label class="labelPerfil">Email</label>
                                                <input class="input-edit" onfocus="clearErrors()"  name='correo' id='correo' type="text" value="<%= client.getCorreo()%>"/>
                                                <div class="error-message">
                                                    <span id="errorCorreo" class="error oculto">
                                                        Debe ingresar su email.
                                                    </span>
                                                    <% if (request.getAttribute("error") == "correo") {%>
                                                    <span id="errorCorreoDuplicated" class="error">
                                                        Ese email ya esta en uso.
                                                    </span>
                                                    <% }%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row"> 
                                            <div class="col-md-3"></div>
                                            <div class="col-md-6">
                                                <label class="labelPerfil">Teléfono</label>
                                                <input class="input-edit" onfocus="clearErrors()" max="999999999" name='telefono' id="telefono" type="text" value="<%= client.getTelefono()%>"/>
                                                <div class="error-message">
                                                    <span id="errorTelefono" class="error oculto">
                                                        Debe ingresar su número
                                                    </span>
                                                    <span id="errorTelefonoLong" class="error oculto">
                                                        Debe ingresar un número válido (8 o 9 dígitos).
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3"> 
                                            </div>
                                            <div class="col-md-3"> 
                                                <button type="button" class="profile-edit-btn button buttonCancel" id="btnCancel" value="Editar Perfil">Cancelar</button> 
                                            </div>
                                            <div class="col-md-3">
                                                <input class='btn button profile-edit-btn' type="submit" value="Guardar" />
                                            </div> 
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>          
                </div>
            </div>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>
