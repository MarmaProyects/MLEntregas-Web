<%-- 
    Document   : Valoracion
    Created on : 25 oct 2023, 20:27:48
    Author     : Angelo
--%>
<%@page import="logica.clases.Envio"%>
<script src="JS/Valoracion.js"></script>
<div class="rating">
    <h1>Esperamos que el servicio le haya gustado</h1>
    <h2>¡Valóranos!</h2>
    <form action="/Valoracion" method="POST" id="formularioComentario">
        <% Envio envio = (Envio) request.getAttribute("envio");%>
        <input type="hidden" id="codigoRastreoValoracion" name="codigoRastreoValoracion" value="<%= envio.getCodigoRastreo()%>">
        <div class="stars">
            <input type="radio" name="star" id="star5" data-value="5" />
            <label for="star5">&#9733;</label>
            <input type="radio" name="star" id="star4" data-value="4" />
            <label for="star4">&#9733;</label>
            <input type="radio" name="star" id="star3" data-value="3" />
            <label for="star3">&#9733;</label>
            <input type="radio" name="star" id="star2" data-value="2" />
            <label for="star2">&#9733;</label>
            <input type="radio" name="star" id="star1" data-value="1" />
            <label for="star1">&#9733;</label>
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



