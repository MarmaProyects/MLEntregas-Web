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
        <script src="JS/bootstrap.bundle.min.js"></script> 
        <link href="CSS/Styles.css" rel="stylesheet">
        <link href="CSS/VerMisEnvios.css" rel="stylesheet"> 
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
        <title>MLEntregas</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <script src="JS/VerMisEnvios.js"></script>
        <script src="https://www.paypalobjects.com/api/checkout.js"></script>
        <script src="https://sdk.mercadopago.com/js/v2"></script>
    </head>
    <body>
        <% ArrayList<Envio> listadoEnv = (ArrayList<Envio>) request.getAttribute("ListaEnvios"); %>
        <% Integer posicion = 0; %>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <h1>MIS ENVÍOS</h1>
            <% if (!listadoEnv.isEmpty()) {%>
            <% for (int i = 0; i < listadoEnv.size(); i++) {%>
            <div class="TablaEnvio">
                <table>
                    <div id="contenedorEnvio" class="estadoDiv">
                        <% int J = listadoEnv.get(i).getEstados().size();%>
                        <div class="solapa <%= listadoEnv.get(i).getEstados().get(J - 1).getTipo()%>"><%= listadoEnv.get(i).getEstados().get(J - 1).getTipo().getEstado()%></div>
                        <div id="contenedorDatosEnvio">
                            <div id="divDatosClientes">
                                <p>Dirección de origen: <%= listadoEnv.get(i).getDireccionOrigen().getCalle() + "/" + listadoEnv.get(i).getDireccionOrigen().getSegunda_calle() + " " + listadoEnv.get(i).getDireccionOrigen().getNro_puerta()%></p>
                                <p>Dirección de destino: <%= listadoEnv.get(i).getDireccionDestino().getCalle() + "/" + listadoEnv.get(i).getDireccionDestino().getSegunda_calle() + " " + listadoEnv.get(i).getDireccionDestino().getNro_puerta()%></p>
                                <p>Cliente receptor: <%= listadoEnv.get(i).getClienteReceptor().getNombre() + " " + listadoEnv.get(i).getClienteReceptor().getApellido()%></p>
                            </div>
                            <div id="divDatosEnvio">
                                <p>Descripción: <%= listadoEnv.get(i).getPaquete().getDescripcion()%></p>
                                <p>Precio del envío: <%= listadoEnv.get(i).getPago().getPrecio()%></p> 
                                <div id="divCodigoRastreo">
                                    <p>Codigo de rastreo: <%= listadoEnv.get(i).getCodigoRastreo()%></p>
                                    <input type="hidden" value=<%= listadoEnv.get(i).getCodigoRastreo()%> id="InputCodigoRastreo_<%= i%>">
                                    <button class="clipboardCopyButton" boton-copiar-CR="<%= i%>">
                                        <img src="Images/copiarIcon.png" alt="📋" style="width: 16px; height: 16px;" id="imagenCopiar_<%= i%>"
                                    </button>
                                    <div class="alerta">Copiado</div>
                                </div>
                            </div>
                        </div>
                        <% boolean cancelado = false;%>
                        <% for (int f = 0; f < listadoEnv.get(i).getEstados().size(); f++) { %>
                        <%if (listadoEnv.get(i).getEstados().get(f).getTipo().equals(TipoEstado.Cancelado)) {%>
                        <% cancelado = true;%>
                        <%}%>
                        <%}%>
                        <% if (!cancelado) { %>
                        <div id="contenedorBotonesEnvio">
                            <% if (listadoEnv.get(i).getPago().getFecha() != null) {%>
                            <p id="EnvioPagoTexto"> ENVÍO PAGO </p>
                            <%} else {%>
                            <div id="divBotonesEnvio">
                                <form class="wallet_container_form" >
                                    <button type="submit" data-bs-toggle="modal" data-bs-target="#ModalMedioPago" class="button" data-envio-precio="<%= listadoEnv.get(i).getPago().getPrecio()%>" data-envio-id="<%= i%>" data-target-form=<%= listadoEnv.get(i).getIdEnvio()%>>PAGAR ENVIO</button>
                                </form> 
                            </div>
                            <%}%>
                        </div>
                        <%}%>
                    </div>
                </table>
            </div>
            <%}%>
            <% }%> 
            <div class="modal fade" id="ModalMedioPago" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalToggleLabel">MÉTODOS DE PAGO</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Seleccione su método de pago:
                        </div>
                        <div class="modal-footer " style='
                             flex-direction: column;'>
                            <div id="paymentBrick_container"></div>  
                            <div id="paypal-button-container"></div>
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