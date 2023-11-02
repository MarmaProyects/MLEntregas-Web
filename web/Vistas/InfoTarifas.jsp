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
                <div class='table_tarifa'>
                    <h4 class="subtitle">Tarifas normales</h4>
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col">NOMBRE</th>
                                <th scope="col">PRECIO BASE</th> 
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int h = 0; h < listadoTar.size(); h++) {%>
                            <% if (listadoTar.get(h).getIdTarifa() <= 3) {%>
                            <tr>
                                <th><%= h + 1%> </th>
                                <th><%= listadoTar.get(h).getNombre()%></th>
                                <th>$<%= listadoTar.get(h).getPrecio()%></th>
                            </tr>
                            <% }%>
                            <% }%> 
                        </tbody>
                    </table>
                </div>   
                <div class='table_tarifa'>
                    <h4 class="subtitle">Tarifas especiales</h4>
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col">NOMBRE</th>
                                <th scope="col">PRECIO BASE</th> 
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int h = 0; h < listadoTar.size(); h++) {%>
                            <% if (listadoTar.get(h).getIdTarifa() > 3) {%>
                            <tr>
                                <th><%= h + 1%> </th>
                                <th><%= listadoTar.get(h).getNombre()%></th>
                                <th>$<%= listadoTar.get(h).getPrecio()%></th>
                            </tr>
                            <% }%>
                            <% }%> 
                        </tbody>
                    </table>
                </div> 

            </div>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>