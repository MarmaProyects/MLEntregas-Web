<%-- 
    Document   : VerZonasDeReparto
    Created on : 18 oct 2023, 12:53:44
    Author     : Angelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.clases.Localidad"%>
<%@page import="java.util.ArrayList"%>
<% ArrayList<Localidad> arrayL = (ArrayList<Localidad>) request.getAttribute("ListaLocalidades"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <link href="CSS/Styles.css" rel="stylesheet">
        <title>MLEntregas</title>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
              integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
              crossorigin=""/>
        <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
                integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
        crossorigin=""></script>
        <script src="JS/VerZonasDeReparto.js"></script>
        <link href="CSS/VerZonasDeReparto.css" rel="stylesheet">
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <h1>Zonas de Reparto</h1>
            <h2>Pide nuestro servicio desde tu localidad!</h2>
            <div id="contenido"> 
                <table class="table table-dark">
                    <tr>
                        <th> </th>
                        <th>Nombre</th>
                        <th>Codigo Postal</th>
                        <th>Precio</th>
                    </tr>
                    <% for (int i = 0; i < arrayL.size(); i++) {%>
                    <tr>
                        <td><%= i + 1%></td>
                        <td><a href="#" class="coord-link" data-lat="<%= arrayL.get(i).getLatitud()%>" data-lng="<%= arrayL.get(i).getLongitud()%>" 
                               data-zoom="<%= arrayL.get(i).getZoom()%>"><%= arrayL.get(i).getNombre()%></a></td>
                        <td><%= arrayL.get(i).getCodigoPostal()%></td>
                        <td><%= arrayL.get(i).getPrecio()%></td>
                    </tr>
                    <%}%>
                </table>   
                <div id="DivMapa" class="border border-dark-subtle border-4">
                </div>
            </div>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>
