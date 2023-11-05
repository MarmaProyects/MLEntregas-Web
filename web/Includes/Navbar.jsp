<%-- 
    Document   : Navbar
    Created on : 11 oct 2023, 21:12:01
    Author     : MarmaduX
--%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><img src="Images/logo-sm-extra.png" alt="DescripciÃ³n del icono"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Inicio</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link active dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Envios</a>
                    <ul class="dropdown-menu">
                        <% if (session.getAttribute("user") != null) {%>
                        <li><a class="dropdown-item" aria-current="page" href="/VerMisEnvios">Ver mis envios</a></li>
                            <% }%>
                        <li><a class="dropdown-item" aria-current="page" href="/Seguimiento">Rastrear envio</a></li>
                        <li><a class="dropdown-item" aria-current="page" href="Tarifas">Tarifas</a></li>
                        <li><a class="dropdown-item" aria-current="page" href="VerZonasDeReparto">Zonas de reparto</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" aria-current="page" href="PreguntasFrecuentes">Preguntas frecuentes</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="VerInformacionEmpresa">Sobre nosotros</a>
                </li>
                <% if (session.getAttribute("admin") != null && (boolean) session.getAttribute("admin")) {%>
                <li class="nav-item dropdown">
                    <a class="nav-link active dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Administración</a>
                    <ul class="dropdown-menu"> 
                        <li><a class="dropdown-item" aria-current="page" href="/ConfirmarEntrega">Confirmar entrega</a></li> 
                        <li><a class="dropdown-item" aria-current="page" href="/Listaclientes">Listado de clientes</a></li> 
                    </ul>
                </li>
                <% }%>
            </ul>
        </div>
        <% if (session.getAttribute("user") != null) {%>
        <div class="dropdown">
            <a class="btn btn-secondary dropdown-toggle user-profile " href="#" role="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-square" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z"/>
                </svg>
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
</nav>
