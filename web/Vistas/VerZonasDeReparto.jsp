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
        <link href="CSS/VerZonasDeReparto.css" rel="stylesheet">
        <title>MLEntregas</title>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <h1>Zonas de Reparto</h1>
            <h2>Pide nuestro servicio desde tu localidad!</h2>
            <div id="contenedorImagenes">
                <img src="/Images/Zonas Paysandu.png"  usemap="#ciudadMap" id="zonasPay">
                <img src="/Images/Zonas aledañas.png" id="zonasAledanias">
            </div>
            <br>
            <div id="contenedorTablas">
            <div id="tablaPay">
                <table class="table table-bordered">
                    <h2>Zonas en Paysandú</h2>
                    <tr>
                        <th>Nombre</th>
                        <th>Codigo Postal</th>
                        <th>Precio</th>
                    </tr>
                    <% for (int i = 0; i < 5; i++) {%>
                    <tr>
                        <td><%= arrayL.get(i).getNombre()%></td>
                        <td><%= arrayL.get(i).getCodigoPostal()%></td>
                        <td><%= arrayL.get(i).getPrecio()%></td>
                    </tr>
                    <%}%>
                </table>
            </div>
            <div id="tablaAledanio">
                <table class="table table-bordered">
                    <h2>Zonas Aledañas</h2>
                    <tr>
                        <th>Nombre</th>
                        <th>Codigo Postal</th>
                        <th>Precio</th>
                    </tr>
                    <% for (int i = 6; i < 9; i++) {%>
                    <tr>
                        <td><%= arrayL.get(i).getNombre()%></td>
                        <td><%= arrayL.get(i).getCodigoPostal()%></td>
                        <td><%= arrayL.get(i).getPrecio()%></td>
                    </tr>
                    <%}%>
                </table>
            </div>
        </div>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>
