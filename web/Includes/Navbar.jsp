<%-- 
    Document   : Navbar
    Created on : 11 oct 2023, 21:12:01
    Author     : MarmaduX
--%>
<%@page import="logica.clases.Cliente"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand navbar-escritorio" href="/"><img src="Images/logo-sm-extra.png" alt="DescripciÃ³n del icono"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class='navbar-movil'>
            <% if (session.getAttribute("user") != null) {%>
            <div class="dropdown">
                <a class="btn btn-secondary dropdown-toggle user-profile text-movil " href="#" role="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <% Cliente client = (Cliente) session.getAttribute("cliente");%>
                    <%= client.getNombre()%> <% String idfoto = (String) session.getAttribute("fotoPerfil");%>
                    <% if (idfoto != null && !idfoto.equals("null")) {%>
                    <img src="https://i.imgur.com/<%= idfoto%>.png" class='image-navbar-perfil' />
                    <% } else { %> 
                    <img src="https://i.imgur.com/xqRjqEX.png" class='image-navbar-perfil'  />
                    <% }%> 
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <li><a class="dropdown-item text-movil" href="/Perfil">Ver perfil</a></li>
                    <li><a class="dropdown-item text-movil" href="/CerrarSesion">Cerrar sesión</a></li>
                </ul>
            </div>
            <% } else { %>
            <a class="nav-bar-item" href="/Login">Iniciar sesión</a>
            <% }%>
        </div>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Inicio</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link active dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Envíos</a>
                    <ul class="dropdown-menu menu-drop-movil">
                        <% if (session.getAttribute("user") != null) {%>
                        <li><a class="dropdown-item  menu-movil" aria-current="page" href="/VerMisEnvios">Ver mis envíos</a></li>
                            <% }%>
                        <li><a class="dropdown-item menu-movil" aria-current="page" href="/Seguimiento">Rastrear envío</a></li>
                        <li><a class="dropdown-item menu-movil" aria-current="page" href="Tarifas">Tarifas</a></li>
                        <li><a class="dropdown-item menu-movil" aria-current="page" href="VerZonasDeReparto">Zonas de reparto</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item menu-movil" aria-current="page" href="PreguntasFrecuentes">Preguntas frecuentes</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="VerInformacionEmpresa">Sobre nosotros</a>
                </li>
                <% if (session.getAttribute("admin") != null && (boolean) session.getAttribute("admin")) {%>
                <li class="nav-item dropdown">
                    <a class="nav-link active dropdown-toggle menu-drop-movil" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Administración</a>
                    <ul class="dropdown-menu"> 
                        <li><a class="dropdown-item menu-movil" aria-current="page" href="/ConfirmarEntrega">Confirmar entrega</a></li> 
                        <li><a class="dropdown-item menu-movil" aria-current="page" href="/Listaclientes">Listado de clientes</a></li> 
                    </ul>
                </li>
                <% }%>
            </ul>
        </div>
        <div class='navbar-escritorio'>
            <% if (session.getAttribute("user") != null) {%>
            <div class="dropdown">
                <a class="btn btn-secondary dropdown-toggle user-profile " href="#" role="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <% Cliente client = (Cliente) session.getAttribute("cliente");%>
                    <%= client.getNombre()%> <% String idfoto = (String) session.getAttribute("fotoPerfil");%>
                    <% if (idfoto != null && !idfoto.equals("null")) {%>
                    <img src="https://i.imgur.com/<%= idfoto%>.png" class='image-navbar-perfil' />
                    <% } else { %> 
                    <img src="https://i.imgur.com/xqRjqEX.png" class='image-navbar-perfil'  />
                    <% }%> 
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <li><a class="dropdown-item" href="/Perfil">Ver perfil</a></li>
                    <li><a class="dropdown-item" href="/CerrarSesion">Cerrar sesión</a></li>
                </ul>
            </div>
            <% } else { %>
            <a class="nav-bar-item" href="/Login">Iniciar sesión</a>
            <% }%>
        </div>
    </div>
</nav>
