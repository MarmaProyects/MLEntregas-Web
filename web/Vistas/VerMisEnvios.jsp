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
        <script src="JS/Script.js"></script>
        <link href="CSS/Styles.css" rel="stylesheet">
        <link href="CSS/VerMisEnvios.css" rel="stylesheet">
        <script src="https://sdk.mercadopago.com/js/v2"></script>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
        <title>JSP Page</title>
    </head>
    <body>
        <% ArrayList<Envio> listadoEnv = (ArrayList<Envio>) request.getAttribute("ListaEnvios"); %>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <h1>MIS ENVÍOS</h1>
            <% if (!listadoEnv.isEmpty()) {%>
            <% for (int i = 0; i < listadoEnv.size(); i++) {%>
            <div class="TablaEnvio">
                <table>
                    <div id="contenedorEnvio">
                        <div id="contenedorDatosEnvio">
                            <div id="divDatosClientes">
                                <p>Dirección de origen: <%= listadoEnv.get(i).getDireccionOrigen().getCalle() + "/" + listadoEnv.get(i).getDireccionOrigen().getSegunda_calle() + " " + listadoEnv.get(i).getDireccionOrigen().getNro_puerta()%></p>
                                <p>Dirección de destino: <%= listadoEnv.get(i).getDireccionDestino().getCalle() + "/" + listadoEnv.get(i).getDireccionDestino().getSegunda_calle() + " " + listadoEnv.get(i).getDireccionDestino().getNro_puerta()%></p>
                                <p>Cliente receptor: <%= listadoEnv.get(i).getClienteReceptor().getNombre() + " " + listadoEnv.get(i).getClienteReceptor().getApellido()%></p>
                            </div>
                            <div id="divDatosEnvio">
                                <p>Descripción: <%= listadoEnv.get(i).getPaquete().getDescripcion()%></p>
                                <p>Precio del envío: <%= listadoEnv.get(i).getPago().getPrecio()%></p>
                                <% int J = listadoEnv.get(i).getEstados().size();%>
                                <p>Estado: <%= listadoEnv.get(i).getEstados().get(J - 1).getTipo().getEstado()%></p>
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
                            <p id="EnvioPagoTexto"> ENVIO PAGO </p>
                            <%} else {%>
                            <div id="divBotonesEnvio">
                                <button class="button" type="button" class="botonModal" data-envio-id="<%= i%>" data-bs-toggle="modal" data-bs-target="#exampleModal" data-target-form="<%= listadoEnv.get(i).getIdEnvio()%>">
                                    PAGAR ENVIO
                                </button>
                            </div>
                            <%}%>
                        </div>
                        <%}%>
                    </div>
                </table>
            </div>
            <%}%>
            <% }%>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>
