<%-- 
    Document   : VerMisEnvios
    Created on : 25 oct. 2023, 18:55:54
    Author     : leo
--%>

<%@page import="logica.dataTypes.TipoEstado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.clases.Envio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/Styles.css" rel="stylesheet">
        <link href="CSS/VerMisEnvios.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <% ArrayList<Envio> listadoEnv = (ArrayList<Envio>) request.getAttribute("ListaEnvios"); %>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <h1>Mis envios</h1>
            <div id="DivTabla">
                <table>
                    <tr>
                        <th>Dirección de origen</th>
                        <th>Dirección de destino</th>
                        <th>Cliente receptor</th>
                        <th>Descripción</th>
                        <th>Precio del envío</th>
                        <th>Estado(Envío)</th>
                        <th>Estado(Pago)</th>
                    </tr>
                    <% if (!listadoEnv.isEmpty()) {%>
                    <% for (int i = 0; i < listadoEnv.size(); i++) {%>
                    <tr>
                        <td><%= listadoEnv.get(i).getDireccionDestino().getCalle() + "/" + listadoEnv.get(i).getDireccionDestino().getSegunda_calle() + " " + listadoEnv.get(i).getDireccionDestino().getNro_puerta()%></td>
                        <td><%= listadoEnv.get(i).getDireccionOrigen().getCalle() + "/" + listadoEnv.get(i).getDireccionOrigen().getSegunda_calle() + " " + listadoEnv.get(i).getDireccionOrigen().getNro_puerta()%></td>
                        <td><%= listadoEnv.get(i).getClienteReceptor().getNombre() + " " + listadoEnv.get(i).getClienteReceptor().getApellido()%></td>
                        <td><%= listadoEnv.get(i).getPaquete().getDescripcion()%></td>
                        <td><%= listadoEnv.get(i).getPago().getPrecio()%></td>
                        <% int J = listadoEnv.get(i).getEstados().size();%>
                        <td> <%= listadoEnv.get(i).getEstados().get(J - 1).getTipo().getEstado()%> </td>
                        <% if (listadoEnv.get(i).getPago().getFecha() != null) {%>
                        <td> Pago </td>
                        <%}%>
                        <% if (listadoEnv.get(i).getPago().getFecha() == null) {%>
                    <button type="button" class="botonModal" data-envio-id="<%= i%>" data-bs-toggle="modal" data-bs-target="#exampleModal" data-target-form="<%= listadoEnv.get(i).getIdEnvio()%>">
                        Confirmar Envío
                    </button>
                    <%}%>
                    </td>
                    </tr>
                    <%}%>
                    <% }%>
                </table>
            </div>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>
