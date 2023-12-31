/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.clases.Cliente;
import logica.clases.Usuario;
import logica.fabrica.Fabrica;
import logica.interfaces.IAdministracion;

/**
 *
 * @author Angelo
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/Login.jsp");
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
            throws ServletException, IOException {
        String correo = request.getParameter("InputCorreo");
        String contrasenia = request.getParameter("InputContrasenia");

        Usuario user = Fabrica.getInstancia().getControladorCliente().obtenerUsuario(correo);

        ProtectedUserPassword encryptedPassword = (null);
        String encryptPassword = "";

        if (user != null) {
            try {
                encryptedPassword = new ProtectedUserPassword(user.getContrasenia());
                SecretKeySpec secretKey = new SecretKeySpec(user.getKeyGen(), "AES");
                encryptPassword = encryptedPassword.decrypt(secretKey);
            } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
                Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
            } catch (GeneralSecurityException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (contrasenia.equals(encryptPassword)) {
                HttpSession session = request.getSession(true);
                session.setAttribute("user", correo);

                IAdministracion IA = Fabrica.getInstancia().getControladorCliente();
                Cliente client = IA.traerClientePorCorreo(correo); 
                session.setAttribute("cliente", client); 
                session.setAttribute("fotoPerfil", user.getIdFoto());
                if (user.getAdmin() == 1) {
                    session.setAttribute("admin", true);
                }
                response.sendRedirect("/");
            } else {
                request.setAttribute("correo", correo);
                request.setAttribute("error", "password");
                request.getRequestDispatcher("/Vistas/Login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("correo", correo);

            request.setAttribute("error", "user");
            request.getRequestDispatcher("/Vistas/Login.jsp").forward(request, response);
        }

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
