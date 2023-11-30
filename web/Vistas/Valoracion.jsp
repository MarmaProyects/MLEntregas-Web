<%-- 
    Document   : Valoracion
    Created on : 25 oct 2023, 20:27:48
    Author     : Angelo
--%>
<%@page import="logica.clases.Valoracion"%>
<%@page import="logica.clases.Envio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <script src="JS/bootstrap.bundle.min.js"></script>
        <link href="CSS/Styles.css" rel="stylesheet">
        <link href="CSS/Valoracion.css" rel="stylesheet">
        <script src="JS/Valoracion.js"></script>
        <title>MLEntregas</title>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <% Valoracion valoracion = (Valoracion) request.getAttribute("valoracion"); %>
            <% if (valoracion != null) {%>
            <div id="divComentarioDelEnvio">
                <div id="divEstrellasValoracion">
                    <%int i;%>
                    <% for (i = 0; i < valoracion.getPuntaje(); i++) { %>
                    <label id="estrellaValoracion">&#9733;</label>
                    <% }%>
                    <% for (; i < 5; i++) { %>
                    <label id="estrellas_restantes">&#9733;</label>
                    <% }%>
                </div>
                <h1><%= valoracion.getPuntaje()%></h1>
                <% if (valoracion.getComentario().trim().equals("")){ %>
                <p id="sinComentario">No ingresó un comentario</p>
                <%}%>
                <p id="comentarioValoracion"><%= valoracion.getComentario()%></p>
            </div>
            <% } else {%>
            <div class="rating">
                <h1>Esperamos que el servicio le haya gustado</h1>
                <h2>¡Valóranos!</h2>
                <form action="/Valoracion" method="POST" id="formularioComentario" onsubmit="return validarEstrellas()">
                    <input type="hidden" name="inputIdEnvio" value="<%= request.getParameter("idEnvio")%>">
                    <div class="stars">
                        <input type="radio" name="star" id="star5" data-value="5" class="inputPuntearEstrellas"/>
                        <label for="star5" class="labelPuntearEstrellas">&#9733;</label>
                        <input type="radio" name="star" id="star4" data-value="4" class="inputPuntearEstrellas"/>
                        <label for="star4" class="labelPuntearEstrellas">&#9733;</label>
                        <input type="radio" name="star" id="star3" data-value="3" class="inputPuntearEstrellas"/>
                        <label for="star3" class="labelPuntearEstrellas">&#9733;</label>
                        <input type="radio" name="star" id="star2" data-value="2" class="inputPuntearEstrellas"/>
                        <label for="star2" class="labelPuntearEstrellas">&#9733;</label>
                        <input type="radio" name="star" id="star1" data-value="1" class="inputPuntearEstrellas"/>
                        <label for="star1" class="labelPuntearEstrellas">&#9733;</label>
                    </div>
                    <p class="rating-text">Calificación: <span id="rating-value">0</span></p>
                    <input type="hidden" id="input_puntaje" name="puntaje" value="0"/>
                    <div id="div_comentario">
                        <textarea class="form-control" rows="3" id="comentario_valoracion" placeholder="Escribe tu comentario..." name="campo_comentario"></textarea>
                    </div>
                    <div id="divBotonC">
                        <button type="submit" class="btn btn-primary button" id="botonComentario">Enviar Comentario</button>
                    </div>
                </form>
            </div>
            <%}%>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>


