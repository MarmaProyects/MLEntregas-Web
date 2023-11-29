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
        <script src="JS/jquery-3.7.1.min.js"></script> 
        <script defer src="JS/ConfirmarEntrega.js"></script>
        <script src="JS/Scripts.js"></script>
        <link href="CSS/ConfirmarEntrega.css" rel="stylesheet">
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
        <title>MLEntregas</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css" />
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
    </head>
    <body>
        <% ArrayList<Envio> listadoEnv = (ArrayList<Envio>) request.getAttribute("ListaEnvios"); %>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class='contenedor'>
            <h1>Envíos en camino</h1>
            <div id="DivTabla">
                <% if (listadoEnv.size() == 0) {%>
                <div class="row mensaje-no-envios">
                    <p>No hay envíos para confirmar</p> 
                    <p class="paquete-escrito">📦</p>
                </div>
                <% } else { %>
                <table class="table table-dark table-envio" id="dataTable" style="border-style: none;">
                    <thead>
                    <tr>
                        <th>Dirección Destino</th>
                        <th>Cliente Emisor</th>
                        <th>Cliente Receptor</th>
                        <th>Descripción</th>
                        <th><button class="button" id=" " data-bs-target="#modalQR" data-bs-dismiss="modal" data-bs-toggle="modal">QR Mercado Pago</button>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (int i = 0; i < listadoEnv.size(); i++) {%>
                    <tr>
                        <% String segunda_calle = listadoEnv.get(i).getDireccionDestino().getSegunda_calle();%>
                        <td><a style="text-decoration: underline;" onclick="verMapa('<%= listadoEnv.get(i).getDireccionDestino().getCalle()%>', '<%= listadoEnv.get(i).getDireccionDestino().getNro_puerta()%>')">
                                <%= listadoEnv.get(i).getDireccionDestino().getCalle() + " Nro Puerta " + listadoEnv.get(i).getDireccionDestino().getNro_puerta()%>
                                <%= segunda_calle.isBlank() ? "" : ", esq. " + segunda_calle%></a></td>
                        <td><%= listadoEnv.get(i).getClienteEmisor().getNombre() + " " + listadoEnv.get(i).getClienteEmisor().getApellido()%></td>
                        <td><%= listadoEnv.get(i).getClienteReceptor().getNombre() + " " + listadoEnv.get(i).getClienteReceptor().getApellido()%></td>
                        <td><%= listadoEnv.get(i).getPaquete().getDescripcion()%></td>
                        <td>
                            <button type="button" class="button" id="" data-envio-id="<%= i%>" data-target-precio="<%= listadoEnv.get(i).getPago().getPrecio()%>" data-bs-toggle="modal" data-bs-target="#ModalMedioPago" data-target-form="<%= listadoEnv.get(i).getIdEnvio()%>">
                                Confirmar Envío
                            </button>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
                <% } %>
                <div class="modal fade" id="ModalMedioPago" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalToggleLabel">MÉTODOS DE PAGO</h1>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
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
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div id="contenedorQR" class="contenedorQR"></div>
                                Escaneé el código QR para realizar el pago.
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
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="button buttonCancel" data-bs-dismiss="modal">Cancelar</button>
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
                <div class="modal fade" id="modalQR" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content"> 
                            <div class="modal-header"> 
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div id="contenedorQR2" class="contenedorQR"></div>
                                Escaneé el código QR para realizar el pago.
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>

