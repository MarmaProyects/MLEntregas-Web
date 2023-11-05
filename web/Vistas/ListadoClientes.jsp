<%-- 
    Document   : ListadoClientes
    Created on : Oct 13, 2023, 7:22:02 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Collections"%>
<%@page import="logica.clases.Envio"%>
<%@page import="logica.clases.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Cliente> listadoCli = (ArrayList<Cliente>) request.getAttribute("ListaClientes");
    ArrayList<Envio> listadoEnv = (ArrayList<Envio>) request.getAttribute("ListaEnvios");
%>

<%
    Collections.sort(listadoCli, ( cliente1,         cliente2) -> cliente1.getNombre().compareTo(cliente2.getNombre()));
%> <!-- Ordena los nombres alfabéticamente -->

<%
    Collections.sort(listadoCli, ( cliente1,     cliente2) -> cliente1.getApellido().compareTo(cliente2.getApellido()));
%> <!-- Ordena los apellidos alfabéticamente -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/Styles.css" rel="stylesheet">
        <script src="JS/bootstrap.bundle.min.js"></script>
        <script src="JS/ListarClientes.js"></script>
        <title>MLEntregas</title>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
        <link href="CSS/listadoClientes.css" rel="stylesheet">
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <h1>Listado de clientes</h1>
            <div class="form-acordion">
                <div class="form">
                    <label style="margin-right: 20px; font-size: 22px;">Nombre / Apellido</label> <br>
                    <div class=" ">
                        <input onkeypress="pulsar(event)" type="text" oninput="validarInputNomApe(this)" id="nombre-apellido" name="nombre-apellido">
                    </div>
                    <div class=" ">
                        <button type="submit" onclick="buscarNombre()" class="btn search button" id="btnBuscar" autofocus>Buscar</button>
                    </div>
                </div>
                <div class="acordion">
                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <% String nomApe = (String) request.getAttribute("nomApe"); %>
                        <% if (listadoCli.size() != 0) { %>
                        <% for (int i = 0; i < listadoCli.size(); i++) { %>
                        <% if (nomApe == null || nomApe.equals("") || listadoCli.get(i).getNombre().contains(nomApe) || listadoCli.get(i).getApellido().contains(nomApe)) {%>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#flush-collapse<%= i%>" aria-expanded="false" aria-controls="flush-collapse<%= i%>">
                                    <%= listadoCli.get(i).getNombre()%> <%= listadoCli.get(i).getApellido()%>
                                </button>
                            </h2>
                            <div id="flush-collapse<%= i%>" class="accordion-collapse collapse">
                                <div class="accordion-body">
                                    <p>Cédula: <%= listadoCli.get(i).getCedula()%> </p>
                                    <p>Correo: <%= listadoCli.get(i).getCorreo()%> </p>
                                    <p>Teléfono/Celular: <%= listadoCli.get(i).getTelefono()%> </p>
                                    <%
                                        boolean found = false;
                                        for (int h = 0; h < listadoEnv.size(); h++) {
                                            if (listadoCli.get(i).getCedula() == listadoEnv.get(h).getClienteEmisor().getCedula()) {
                                                if (!listadoEnv.get(h).getDireccionOrigen().getCalle().equals("Solano García") && 
                                                    listadoEnv.get(h).getDireccionOrigen().getNro_puerta() != 1465) {
                                                    %>
                                                    <p>Dirección: <%= listadoEnv.get(h).getDireccionOrigen().getCalle()  + " " + 
                                                            listadoEnv.get(h).getDireccionOrigen().getNro_puerta() + " / " + 
                                                            listadoEnv.get(h).getDireccionOrigen().getSegunda_calle()%></p>
                                                    <%
                                                    found = true;
                                                    break;
                                                }
                                            }
                                        }
                                        if (!found) {
                                            %>
                                                <p>Dirección: Desconocido</p>
                                            <%
                                        }
                                    %>
                                    
                                </div>
                            </div>
                        </div>
                        <% }%>
                        <% }%>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>