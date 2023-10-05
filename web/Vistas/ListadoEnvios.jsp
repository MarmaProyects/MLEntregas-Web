<%-- 
    Document   : ListadoEnvios
    Created on : Oct 4, 2023, 10:41:56 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% ArrayList<Envio> listadoEnv = null; %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar envíos</title>
    </head>
    <body>
        <h1>Listado de envíos</h1>
        <table>
            <tr>
                <th>Id envío</th>
                <th>Dirección destino</th>
                <th>Cliente emisor</th>
                <th>Código rastreo</th>
            </tr>
            <% for (int i = 0; i < listadoEnv.length(); i++) {%>
            <td><%= listadoEnv[i].getIdEnvio()%></td>
            <td><%= listadoEnv[i].getDireccionD()%></td>
            <td><%= listadoEnv[i].getClienteE()%></td>
            <td><%= listadoEnv[i].getCodigoR() %></td>
            <% }%>
        </table>
    </body>
</html>