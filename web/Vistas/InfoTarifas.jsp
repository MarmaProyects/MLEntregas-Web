<%-- 
    Document   : InfoTarifas
    Created on : Oct 11, 2023, 8:34:04 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tarifas</title>
        <link rel="stylesheet" type="text/css" href="/CSS/InfoTarifasStyle.css">
    </head>
    <body>
        <h1>Tarifas</h1>
        <div id="divTabla">
            <table>
                <tr>
                    <th>Nombre</th>
                    <th>Precio base</th>
                </tr>
                <tr>
                    <td>Hasta 5kg</td>
                    <td>$100.0</td>
                </tr>
                <tr>
                    <td>Desde 5kg hasta 10kg</td>
                    <td>$200.0</td>
                </tr>
                <tr>
                    <td>Desde 10kg hasta 15kg</td>
                    <td>$300.0</td>
                </tr>
                <% for (int i = 0; i < listadoEnv.size(); i++) {%>
                <tr>
                    <td><%= /* Obtener nombre de tarifas BD */ %></td>
                    <td><%= /* Obtener precio de tarifa BD */ %></td>
                </tr>
                <% } %>
            </table>
        </div>
    </body>
</html>
