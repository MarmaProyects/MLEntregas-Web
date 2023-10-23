/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.clases.Cliente;
import logica.clases.Usuario;
import logica.fabrica.Fabrica;
import logica.interfaces.IAdministracion;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gasto
 */
@WebServlet(name = "Registro", urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "hola</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/Registro.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {

        IAdministracion IA = Fabrica.getInstancia().getControladorCliente();
        int cedula = Integer.parseInt(request.getParameter("InputCedula"));
        String nombre = request.getParameter("InputNombre");
        String apellido = request.getParameter("InputApellido");
        String correo = request.getParameter("InputCorreo");
        String contrasenia = request.getParameter("InputContrasenia");
        String contrasenia2 = request.getParameter("InputContrasenia2");
        Cliente cliente = IA.traerClienteSeleccionado(cedula);

        Usuario user = IA.obtenerUsuario(correo);
        ProtectedUserPassword encryptedPassword = null;

        try {
            encryptedPassword = new ProtectedUserPassword(contrasenia);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeySpecException ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String encryptPassword = "";
        try {
            encryptPassword = encryptedPassword.encrypt();
        } catch (GeneralSecurityException ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (!contrasenia.equals(contrasenia2)) {
            request.setAttribute("correo", correo);
            request.setAttribute("nombre", nombre);
            request.setAttribute("cedula", cedula);
            request.setAttribute("apellido", apellido);
            request.setAttribute("contrasenia", contrasenia);
            request.setAttribute("contrasenia2", contrasenia2);
            request.getRequestDispatcher("/Vistas/Registro.jsp").forward(request, response);
        } 
        
        if (user == null) {
            IA.crearUsuario(correo, encryptPassword, encryptedPassword.getKey().getEncoded());
        } else {
            request.setAttribute("correo", correo);
            request.setAttribute("nombre", nombre);
            request.setAttribute("cedula", cedula);
            request.setAttribute("apellido", apellido);
            request.getRequestDispatcher("/Vistas/Registro.jsp").forward(request, response);
        }

        if (cliente != null) {
            IA.editarClienteSeleccionado(cedula, nombre, apellido, 0, correo);
        } else {
            IA.agregarCliente(cedula, nombre, apellido, 0, correo);
        }
        HttpSession session = request.getSession(true);
        session.setAttribute("user", correo);

        response.sendRedirect("/");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
