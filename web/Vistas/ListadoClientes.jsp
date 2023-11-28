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
<%@page import="java.text.Normalizer"%>
<%@page import="java.util.regex.Pattern"%>
<%
    ArrayList<Cliente> listadoCli = (ArrayList<Cliente>) request.getAttribute("ListaClientes");
    ArrayList<Envio> listadoEnv = (ArrayList<Envio>) request.getAttribute("ListaEnvios");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/listadoClientes.css" rel="stylesheet">
        <link href="CSS/Styles.css" rel="stylesheet">
        <script src="JS/bootstrap.bundle.min.js"></script>
        <script src="JS/jquery-3.7.1.min.js"></script> 
        <script src="JS/ListarClientes.js"></script>
        <title>MLEntregas</title>
        <link rel="icon" href="Images/logo-sm-extra.png" type="image/png">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css" />
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
        
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <h1>Listado de clientes</h1>
            <div class="form-table">
                <table id="dataTable" class="table table-dark" style="border-style: none;">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Cédula</th>
                            <th>Correo</th>
                            <th>Teléfono</th>
                            <th>Dirección</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < listadoCli.size(); i++) {%>
                        <tr>
                            <td><%= listadoCli.get(i).getNombre()%> <%= listadoCli.get(i).getApellido()%></td>
                            <td><%= listadoCli.get(i).getCedula()%></td>
                            <td><%= listadoCli.get(i).getCorreo()%></td>
                            <td><%= listadoCli.get(i).getTelefono()%></td>
                            <% boolean found = false;
                                for (int h = 0; h < listadoEnv.size(); h++) {
                                    if (listadoCli.get(i).getCedula() == listadoEnv.get(h).getClienteEmisor().getCedula()) {
                                        if (!listadoEnv.get(h).getDireccionOrigen().getCalle().equals("Solano García")
                                && listadoEnv.get(h).getDireccionOrigen().getNro_puerta() != 1465) {%>
                            <td><%= listadoEnv.get(h).getDireccionOrigen().getCalle() + " "
                                    + listadoEnv.get(h).getDireccionOrigen().getNro_puerta() + " / "
                                    + listadoEnv.get(h).getDireccionOrigen().getSegunda_calle()%></td>
                                <%          found = true;
                                            break;
                                            }
                                    }
                                }
                                if (!found) { %>
                            <td>Desconocida</td>
                            <%  }
                        } %>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>