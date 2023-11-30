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
        <link href="CSS/Styles.css" rel="stylesheet">
        <script src="JS/bootstrap.bundle.min.js"></script>
        <title>MLEntregas</title>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
        <link href="CSS/home.css" rel="stylesheet">
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <div class="home-content border border-4">
                <div id="divLogo">
                    <img src="/Images/Logo_Paginas.png" alt="logoHome" width="250px" height="250px">
                </div>
                <div class="container">
                    <% if (session.getAttribute("user") == null) {%>
                    <div class="row">
                        <div class="col-6">
                            <a href="/Login" class="btn home-buttons button">Ingresar</a>
                        </div>
                        <div class="col-6">
                            <a href="/Registro" class="btn home-buttons button">Registrate</a>
                        </div>
                    </div>
                    <%}%>
                    <div class="row">
                        <div class="col-6">
                            <a href="/Seguimiento" class="btn home-buttons button">Rastrear Envío</a>
                        </div>
                        <div class="col-6">
                            <a href="/Tarifas" class="btn home-buttons button">Tarifas</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <a href="mailto:mlentregas@gmail.com" class="btn home-buttons button">Contáctanos</a>
                        </div>
                    </div>
                </div>
            </div> 

            <div class="home-content-movil ">
                <div id="divLogoMovil">
                    <img src="/Images/Logo_Paginas.png" alt="logoHome" width="250px" height="250px">
                </div>
                <div class="container">
                    <div class="row">
                        <% if (session.getAttribute("user") == null) {%>
                        <div class="col-12">
                            <a href="/Login" class="btn home-buttons button  boton-home">Ingresar</a>
                        </div>
                        <div class="col-12">
                            <a href="/Registro" class="btn home-buttons button  boton-home">Registrate</a>
                        </div> 
                        <%}%> 
                        <div class="col-12">
                            <a href="/Seguimiento" class="btn home-buttons button  boton-home">Rastrear Envío</a>
                        </div>
                        <div class="col-12">
                            <a href="/Tarifas" class="btn home-buttons button  boton-home">Tarifas</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <a href="mailto:mlentregas@gmail.com" class="btn home-buttons button  boton-home">Contáctanos</a>
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
