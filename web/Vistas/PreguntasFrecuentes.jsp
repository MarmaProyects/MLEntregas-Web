<%-- 
    Document   : PreguntasFrecuentes
    Created on : 11 oct. 2023, 19:56:29
    Author     : leo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/bootstrap.min.css"/>
        <link rel="stylesheet" href="CSS/Styles.css"/>
        <link rel="stylesheet" href="CSS/Preguntas.css"/>
        <script src="JS/bootstrap.bundle.min.js"></script>
        <title>Preguntas Frecuentes</title>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <h1>Preguntas Frecuentes</h1>
            <div class='cuerpo'> 
                <div class='preguntas'>
                    <h4>¿Cómo hago un envío?</h4>
                    <hr>
                    <p>Telefónicamente solicitando el retiro del envío en domicilio.</p>
                    <p>Presencial en sucursales o agencias.</p>
                    <br>
                    <h5>Todos los envíos para su procesamiento deben estar correctamente embalados y rotulados con la siguiente información:</h5>
                    <ul>
                        <li>Nombre completo de destinatario</li>
                        <li>Si retira en agencia (agencia en la cual retira)</li>
                        <li>Si es entrega en domicilio (domicilio completo, localidad)</li>
                        <li>Teléfono del destinatario (en ambos casos)</li>
                    </ul>

                </div>
                <div class='preguntas'>
                    <h4>¿Cuál es nuestro horario?</h4>
                    <hr>
                    <p>El horario de atención está comprendido entre -- y --, mientras que el de envío entre -- y --.</p>
                </div>
                <div class='preguntas'>
                    <h4>¿Puede pagar el destinatario?</h4>
                    <hr>
                    <p>Sí, se puede pagar el envío al recibir en domicilio o retirar en nuestras sucursales.</p>
                </div>
                <div class='preguntas'>
                    <h4>¿Qué paquetes se pueden enviar?</h4>
                    <hr>
                    <p>Cualquier paquete que no supere el peso limite excluyendo cartas.</p>
                    <p>Por mas informacion visite el listado de <a href="/Tarifas">tarifas</a>.</p>
                </div>

                <div class='preguntas'>
                    <h4> ¿Puede ir otra persona a retirar mi paquete?</h4>
                    <hr>
                    <p>Nuestro tiempo de entrega es de 24 a 48 horas hábiles a partir de la recepción del envío por parte de MLEntregas. 
                        Existe un porcentaje menor de localidades en el interior en las cuales nuestro tiempo de entrega puede llegar a ser 72 horas hábiles.</p>
                </div>
                <div class='preguntas'>
                    <h4>¿Qué métodos de pago puedo utilizar?</h4>
                    <hr>
                    <p>Aceptamos credito, debito y efectivo; Contamos tambien con Mercado Pago, para pagar al tanto en fisico como desde nuestro sitio web.</p>
                </div>
                <div class='preguntas'>
                    <h4>¿Una vez que solicito un envio, cuanto tarda en llegar?</h4>
                    <hr>
                    <p>Depende del tiempo que tarde en llegar a Paysandú si es importado, y en caso de ser local suele tardar entre 1 y 3 dias hábiles.</p>
                </div> 
                <div class='preguntas'>
                    <h4>¿Ubicación de nuestras agencias y sucursales?</h4>
                    <hr>
                    <p>Podés ver todos los horarios y las direcciones de nuestra sucursal en <a href="/VerInformacionEmpresa">MLEntregas</a>.</p>
                </div> 
                <div class='preguntas'>
                    <h4>Tipos de estados y sus colores</h4>
                    <hr>
                    <p>El estado <span class="estado-text EnCamino">En camino</span> con el color amarillo, significa que el paquete esta haciendo su recorrido al destino.</p>
                    <p>El estado <span class="estado-text Preparando">En preparación</span> con el color naranja, significa que el paquete se está preparando para enviar.</p>
                    <p>El estado <span class="estado-text ListoParaRetirar">Listo para entregar</span> con el color verde claro, significa que el paquete esta listo para entregar en la agencia.</p>
                    <p>El estado <span class="estado-text Entregado">Entregado</span> con el color verde, significa que el paquete ya se entregó.</p>
                    <p>El estado <span class="estado-text Cancelado">Cancelado</span> con el color rojo, significa que el paquete fue cancelado y devuelto.</p>
                </div>
            </div>

        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>
