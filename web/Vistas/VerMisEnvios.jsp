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
        <script>href="JS/VerMisEnvios.js"</script>
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
                                <form id="wallet_container_form">
                                    <button type="submit" class="button" data-envio-id="<%= i%> data-target-form="<%= listadoEnv.get(i).getIdEnvio()%>">PAGAR ENVIO</button>
                                </form>
                                <div id="wallet_container"></div>
                                <!-- Carga el script de Mercado Pago -->
                                <script src="https://sdk.mercadopago.com/js/v2"></script>
                                <script>
                                    // Public key (credencial de la aplicación MP)
                                    const publicKey = "TEST-4a59c665-1f53-49e5-8ed9-c9d2687b543b"
                                    const mp = new MercadoPago(publicKey)
                                    const bricksBuilder = mp.bricks()

                                    const el = document.querySelector("#wallet_container_form")

                                    const handleSubmit = async function (e) {
                                        e.preventDefault()

                                        const formData = new FormData(e.target)
                                        const url = "/createPayment"

                                        // Acá se hace una petición post al "doPost" del servlet
                                        // Pidiendo el id de la preferencia

                                        // const result = await fetch(url, {
                                        //   method: "post",
                                        //   headers: {
                                        //     "Content-Type": "application/json",
                                        //     "Accept": "application/json"
                                        //   },
                                        //   body: JSON.stringify({
                                        //     title: "Nombre del producto",
                                        //     // Acá pueden ir más datos
                                        //   })
                                        // })

                                        // if (result.status !== 200) {
                                        //   alert("Something went wrong")
                                        //   return
                                        // }

                                        // const data = await result.json()
                                        // const { id } = data

                                        mp.bricks().create("wallet", "wallet_container", {
                                            initialization: {
                                                // Usar id obtenido
                                                preferenceId: "1523556454-bc9b5c6f-e167-42fb-990c-429b124a7356",
                                                redirectMode: "modal",
                                            },
                                        })
                                    }
                                    el.addEventListener("submit", handleSubmit)
                                </script>
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
