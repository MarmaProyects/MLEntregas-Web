<%-- 
    Document   : Seguimiento
    Created on : 12 oct 2023, 20:35:28
    Author     : MarmaduX
--%>

<%@page import="logica.dataTypes.TipoEstado"%>
<%@page import="logica.clases.Envio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <script src="JS/bootstrap.bundle.min.js"></script>
        <link href="CSS/seguimiento.css" rel="stylesheet">
        <link href="CSS/Styles.css" rel="stylesheet">
        <script src="JS/Scripts.js"></script>
        <title>MLEntregas</title>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <h1>Rastrear un envío</h1>
            <h4>Consulte aquí el estado de su envío, ingresando su número de rastreo.</h4>
            <div class="form-image">
                <div class="form">
                    <form action="/Seguimiento" name="rastreo" method="POST" onsubmit="return validarRastreo()">
                        <div class=" ">
                            <label>Codigo de rastreo</label>
                            <input type="text" oninput="validarNumero(this)" id="codigoRastreo" name="codigoRastreo">
                        </div>
                        <div class="error-message">
                            <% String error = (String) request.getAttribute("error"); %>
                            <% if (error != null) {%> 
                            <p class="error" id="errorrastreo"><%= error%></p> 
                            <% }%>
                            <p class="oculto error" id="errordigi">El código no debe estar vacío</p>
                            <p class="oculto error" id="errornull">El código de rastreo debe contener exactamente 9 dígitos.</p>
                        </div>
                        <div class=" ">
                            <button type="submit" class="btn button">Buscar</button>
                        </div>
                    </form>
                </div>
                <div class="image">
                    <img src="Images/paquete lupa.png" alt="Descripción del icono">
                </div> 
            </div>
        </div>
        <% Envio envio = (Envio) request.getAttribute("envio"); %>
        <% if (envio != null) {%> 
        <div class="contenedor-seguimiento">
            <h3 id="focus-scroll">Envio</h3>
            <div class="contenedor-tabla">
                <table class="table table-dark">
                    <tbody>
                        <tr>
                            <th>Numero de rastreo:</th>
                            <td><%= envio.getCodigoRastreo()%></td>
                        </tr>
                        <tr>
                            <th>Descripcion:</th>
                            <td><%= envio.getPaquete().getDescripcion()%></td>
                        </tr>
                        <tr>
                            <th>Peso:</th>
                            <td><%= envio.getPaquete().getPeso()%> kg</td>
                        </tr>
                        <tr>
                            <th>Fragil:</th> 
                                <% if (envio.getPaquete().isEsFragil()) { %>
                            <td>Si</td>
                            <% } else { %>
                            <td>No</td>
                            <% } %>
                        </tr>
                        <tr>
                            <th>Especial:</th>
                                <% if (envio.getPaquete().isEsEspecial()) { %>
                            <td>Si</td>
                            <% } else { %>
                            <td>No</td>
                            <% } %>
                        </tr>
                        <tr>
                            <th>Tipo envío:</th>
                                <% if (envio.getDireccionDestino().getIdDireccion() == 1) { %>
                            <td>Retiro agencia</td>
                            <% } else { %>
                            <td>Envio a domicilio</td>
                            <% } %>
                        </tr>
                    </tbody>
                </table>
            </div>

            <h3>Historial de estados</h3>
            <div class="contenedor-tabla">
                <table class="table table-dark" >
                    <thead>
                        <tr> 
                            <th>Fecha</th>
                            <th>Estado</th>
                            <th>Comentario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int h = envio.getEstados().size() - 1; h >= 0; h--) {%>
                        <tr>
                            <td><%= envio.getEstados().get(h).getFecha()%></td>
                            <td><span class="estado-seguimiento <%= envio.getEstados().get(h).getTipo() %>"><%= envio.getEstados().get(h).getTipo().getEstado()%></span></td>
                            <td><%= envio.getEstados().get(h).getComentario()%></td>
                        </tr>
                        <% } %>

                    </tbody>
                </table>
            </div>
        </div>
                        
        <% }%>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>
