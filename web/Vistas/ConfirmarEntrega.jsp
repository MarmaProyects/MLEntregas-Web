<%-- 
    Document   : ConfirmarEntrega
    Created on : 13 oct. 2023, 19:36:59
    Author     : leo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="logica.clases.Envio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/Styles.css" rel="stylesheet">
        <script src="JS/bootstrap.bundle.min.js"></script>
        <link href="CSS/ConfirmarEntrega.css" rel="stylesheet">
        <script src="JS/jquery.min.js"></script>
    </head>
    <body>
        <% ArrayList<Envio> listadoEnv = (ArrayList<Envio>) request.getAttribute("ListaEnvios"); %>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <h1>Listado de envíos</h1>
        <div id="DivTabla">
            <table>
                <tr>
                    <th>Dirección destino</th>
                    <th>Cliente emisor</th>
                    <th>Descripción</th>
                </tr>
                <% for (int i = 0; i < listadoEnv.size(); i++) {%>
                <tr>
                    <td><%= listadoEnv.get(i).getDireccionDestino().getCalle()%></td>
                    <td><%= listadoEnv.get(i).getClienteEmisor().getNombre() + " " + listadoEnv.get(i).getClienteEmisor().getApellido()%></td>
                    <td><%= listadoEnv.get(i).getPaquete().getDescripcion()%></td>
                    <td>
                        <button type="button" class="botonModal" data-envio-id="<%= i%>" data-bs-toggle="modal" data-bs-target="#exampleModal" data-target-form="<%= listadoEnv.get(i).getIdEnvio()%>">
                            Confirmar Envío
                        </button>
                    </td>
                </tr>
                <%}%>
            </table>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="title-container">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">¿Desea confirmar la entrega?</h1>
                            </div>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <% if (!listadoEnv.isEmpty()) {%>
                            <form method="post" action="<%= request.getContextPath()%>/ConfirmarEntrega"> 
                                <input type="hidden" name="idEnvio" value="">
                                <input type="submit" value="Confirmar envío">
                            </form>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            document.querySelectorAll('button[data-envio-id]').forEach(function (button) {
                button.addEventListener('click', function () {
                    let idEnvio = this.getAttribute('data-target-form');
                    document.querySelector('input[name="idEnvio"]').value = idEnvio;
                });
            });
        </script>
    </body>
</html>

