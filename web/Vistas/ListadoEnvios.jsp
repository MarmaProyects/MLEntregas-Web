<%-- 
    Document   : ListadoEnvios
    Created on : Oct 4, 2023, 10:41:56 PM
    Author     : franc
--%>

<%@page import="logica.clases.Envio"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% ArrayList<Envio> listadoEnv = (ArrayList<Envio>) request.getAttribute("ListaEnvios"); %>
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
            <% for (int i = 0; i < listadoEnv.size(); i++) {%>
                <td><%= listadoEnv.get(i).getIdEnvio()%></td>
                <td><%= listadoEnv.get(i).getDireccionDestino().getCalle() %></td>
                <td><%= listadoEnv.get(i).getClienteEmisor().getNombre() %></td>
                <td><%= listadoEnv.get(i).getPaquete().getDescripcion() %></td>
            <% }%>
        </table>
    </body>
</html>