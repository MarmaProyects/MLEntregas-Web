<%-- 
    Document   : Perfil
    Created on : 25 oct 2023, 20:03:47
    Author     : MarmaduX
--%>

<%@page import="logica.fabrica.Fabrica"%>
<%@page import="logica.clases.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/Styles.css">
        <link rel="stylesheet" href="CSS/perfil.css">
        <script src="JS/bootstrap.bundle.min.js"></script> 
        <title>MLEntregas</title>
    </head>
    <body>
        <header>
            <jsp:include page="/Includes/Navbar.jsp" />
        </header>
        <div class="contenedor">
            <% Cliente client = (Cliente) request.getAttribute("cliente"); %>
            <div class="container emp-profile">
                <form method="post">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="profile-img">
                                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog" alt=""/>
                                <div class="file btn btn-lg btn-primary boton-file">
                                    Cambiar foto
                                    <input class="boton-file" type="file" name="file"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="profile-head">
                                <h5>
                                    <%= client.getNombre() + " " +  client.getApellido() %>
                                </h5> 
                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Editar Perfil"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="profile-work">
                                <p>OPERACIONES</p>
                                <a href="">Website Link</a><br/>
                                <a href="">Bootsnipp Profile</a><br/>
                                <a href="">Bootply Profile</a> 
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="tab-content profile-tab" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Cédula de Identidad</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p><%= client.getCedula() %></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Nombre Completo</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p><%= client.getNombre() + " " +  client.getApellido() %></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Email</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p><%= client.getCorreo() %></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Teléfono</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p><%=  client.getTelefono() %></p>
                                        </div>
                                    </div> 
                                </div>
                                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Experience</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>Expert</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Hourly Rate</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>10$/hr</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Total Projects</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>230</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>English Level</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>Expert</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Availability</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>6 months</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Your Bio</label><br/>
                                            <p>Your detail description</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>           
            </div>
        </div>
        <header>
            <jsp:include page="/Includes/Footer.jsp" />
        </header>
    </body>
</html>
