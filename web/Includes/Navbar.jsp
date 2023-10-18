<%-- 
    Document   : Navbar
    Created on : 11 oct 2023, 21:12:01
    Author     : MarmaduX
--%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><img src="Images/logo-sm-extra.png" alt="Descripción del icono"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="Tarifas">Tarifas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/Seguimiento">Rastrear envio</a>
                </li>
                <li class="nav-itemw">
                    <a class="nav-link active" aria-current="page" href="VerZonasDeReparto">Zonas de reparto</a>
                </li>
                <li class="nav-itemw">
                    <a class="nav-link active" aria-current="page" href="PreguntasFrecuentes">Preguntas frecuentes</a>
                </li>
                <li class="nav-itemw">
                    <a class="nav-link active" aria-current="page" href="VerInformacionEmpresa">Sobre nosotros</a>
                </li>
                <% if (session.getAttribute("user") != null) {%>
                <li class="nav-itemw">
                    <a class="nav-link active" aria-current="page" href="VerInformacionEmpresa"><%= session.getAttribute("user") %></a>
                </li>
                <% }%>
            </ul>
        </div>
    </div>
</nav>
