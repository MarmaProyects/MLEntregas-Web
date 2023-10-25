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
        <script defer src="JS/qrcode.min.js"></script>
        <script defer src="JS/ConfirmarEntrega.js"></script>
        <script src="JS/Scripts.js"></script>
        <link href="CSS/ConfirmarEntrega.css" rel="stylesheet">
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
                        <button type="button" class="button" id="" data-envio-id="<%= i%>" data-target-precio="<%= listadoEnv.get(i).getPago().getPrecio()%>" data-bs-toggle="modal" data-bs-target="#ModalMedioPago" data-target-form="<%= listadoEnv.get(i).getIdEnvio()%>">
                            Confirmar Envío
                        </button>
                    </td>
                </tr>
                <%}%>
            </table>
            <div class="modal fade" id="ModalMedioPago" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalToggleLabel">MÉTODOS DE PAGO</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Seleccione su método de pago:
                        </div>
                        <div class="modal-footer">
                            <button class="button" data-bs-target="#ModalPagarEfectivo" data-bs-dismiss="modal" data-bs-toggle="modal">Efectivo</button>
                            <input type="hidden" id="inputCredito" value="">
                            <button class="button" id="btnCredito" data-bs-target="#modalPagarCredito" onclick="agregarPrecio()" data-bs-dismiss="modal" data-bs-toggle="modal">Crédito</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="modalPagarCredito" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="tituloModalPagoCredito"></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div id="contenedorQR" class="contenedorQR"></div>
                            Escanee el código QR para realizar el pago.
                        </div>
                        <div class="modal-footer">
                            <% if (!listadoEnv.isEmpty()) {%>
                            <form method="post" action="<%= request.getContextPath()%>/ConfirmarEntrega"> 
                                <input type="hidden" id="creditoIdEnvio" name="idEnvio" value="">
                                <input type="hidden" name="tipoPago" value="Credito">
                                <input class="button" type="submit" value="Confirmar envío">
                            </form>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="ModalPagarEfectivo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="title-container">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">¿Desea confirmar la entrega?</h1>
                            </div>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="button cancel" data-bs-dismiss="modal">Cancelar</button>
                            <% if (!listadoEnv.isEmpty()) {%>
                            <form method="post" action="<%= request.getContextPath()%>/ConfirmarEntrega"> 
                                <input type="hidden" id="efectivoIdEnvio" name="idEnvio" value="">
                                <input type="hidden" name="tipoPago" value="Efectivo">
                                <input class="button" type="submit" value="Confirmar envío">
                            </form>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

