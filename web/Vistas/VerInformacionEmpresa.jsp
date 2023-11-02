<%-- 
    Document   : VerInformacionEmpresa
    Created on : 12 oct. 2023, 15:21:59
    Author     : leo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script> href = "/JS/bootstrap.bunlde.min.js"</script>
        <title>Informacion de la empresa</title>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
        <link rel="stylesheet" href="CSS/bootstrap.min.css"/>
        <link rel="stylesheet" href="CSS/Styles.css"/>
        <link rel="stylesheet" href="CSS/VerInformacionEmpresa.css"/>
        <script src="JS/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>

    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <h1 id="Titulo"><strong>MLEntregas</strong></h1>
        <div id="contenedor1">
            <div id="DivLogo">
                <img id="logo" src="Images/Logo_Paginas.png" alt="Descripción del icono">
            </div>
            <div id="descripcionEmpresa">
                <h5><strong>Sobre nosotros</strong></h5>
                <p>MLEntregas es una empresa de paquetería local sanducera que propone una nueva opción a la hora de repartir paquetes; <br>
                    Contamos con un local para el manejo de los mismos y un sistema de reparto para llevarlos a la puerta de tu casa.</p>
            </div>
        </div>
        <div id="contenedor2">
            <div id="DivContacto" class="informacion-contacto">
                <h2>Información de Contacto <br></h2>
                <p>Teléfono: <a href="tel:+123456789">123-456-789</a> <br></p>
                <p>Correo Electrónico: <a href="mailto:mlentregas@gmail.com">mlentregas@gmail.com</a> <br></p>
                <p>Dirección: Solano García 1465, Paysandú, Uruguay <br></p>
            </div>
            <div id="DivMapa">
                <iframe allowfullscreen="" height="450" loading="lazy" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7895.174648745623!2d-58.06147869595547!3d-32.309617584208534!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95afcb94ccad11d9%3A0x7cfd8a8fffbe81bd!2sMLEntregas!5e0!3m2!1sen!2s!4v1633887284420!5m2!1sen!2s" style="border:0;" width="600"></iframe>
            </div>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>
