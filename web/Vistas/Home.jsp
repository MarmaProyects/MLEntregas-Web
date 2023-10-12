<%-- 
    Document   : Home
    Created on : 4 oct. 2023, 20:20:19
    Author     : gasto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/home.css" rel="stylesheet">
        <script src="JS/bootstrap.bundle.min.js"></script>
        <title>MLEntregas</title>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
    </head>
    <body>
        <div class="contenedor">
            <header>
                <jsp:include page="/Includes/Navbar.jsp" />
            </header>
            <div class="home-content">
                <h5 class="home-title">¡ENTREGA RÁPIDA!</h5>
                <h5 class="home-title">¡COMUNÍCATE YA!</h5>
                <div class="container">
                    <div class="row">
                        <div class="col-6">
                            <a href="#" class="btn home-buttons">Ingresar</a>
                        </div>
                        <div class="col-6">
                            <a href="#" class="btn home-buttons">Registraté</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <a href="#" class="btn home-buttons">Rastrear Envío</a>
                        </div>
                        <div class="col-6">
                            <a href="#" class="btn home-buttons">Tarifas</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <a href="#" class="btn home-buttons">Contáctanos</a>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </body>
</html>
