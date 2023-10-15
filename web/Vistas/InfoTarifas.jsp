<%-- 
    Document   : InfoTarifas
    Created on : Oct 11, 2023, 8:34:04 PM
    Author     : franc
--%>

<%@page import="logica.clases.Tarifa"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% ArrayList<Tarifa> listadoTar = (ArrayList<Tarifa>) request.getAttribute("ListaTarifas"); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <script src="JS/bootstrap.bundle.min.js"></script>
        <title>MLEntregas</title>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
        <link href="CSS/Styles.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/CSS/InfoTarifasStyle.css">
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <h1>Tarifas</h1>
            <div id="cuerpo">

                <div id="divTablaNormales">
                    <h2>Tarifas normales</h2>
                    <table class="table table-bordered">
                        <tr>
                            <th>Nombre</th>
                            <th>Precio base</th>
                        </tr>
                        <% for (int i = 0; i < listadoTar.size(); i++) {%>
                        <% if (listadoTar.get(i).getIdTarifa() <= 3) {%>
                        <tr>
                            <td><%= listadoTar.get(i).getNombre()%></td>
                            <td>$<%= listadoTar.get(i).getPrecio()%></td>
                        </tr>
                        <% } %>
                        <% }%>
                    </table>
                </div>

                <div id="divTablaEspeciales">
                    <table class="table table-bordered">
                        <h2>Tarifas especiales</h2>
                        <tr>
                            <th>Nombre</th>
                            <th>Precio base</th>
                        </tr>
                        <% for (int h = 0; h < listadoTar.size(); h++) {%>
                        <% if (listadoTar.get(h).getIdTarifa() > 3) {%>
                        <tr>
                            <td><%= listadoTar.get(h).getNombre()%></td>
                            <td>$<%= listadoTar.get(h).getPrecio()%></td>
                        </tr>
                        <% }%>
                        <% }%>
                    </table>
                </div>
            </div>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>