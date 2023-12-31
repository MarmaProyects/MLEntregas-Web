/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
 * @author franc
 */
@WebServlet(name = "NotisEmail", urlPatterns = {"/NotisEmail"})
public class ServletNotisEmail extends HttpServlet {

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
            out.println("<title>Servlet NotisEmail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NotisEmail at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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

        IAdministracion IA = Fabrica.getInstancia().getControladorCliente();
        HttpSession session = request.getSession(true);
        String correo = (String) session.getAttribute("user");
        String checkbox = (String) request.getParameter("notisEmail");
        boolean notisEmail = checkbox.contains("true");
        IA.cambiarNotisEmail(correo, notisEmail);
        Cliente client = IA.traerClientePorCorreo(correo);
        request.setAttribute("cliente", client);
        session.setAttribute("cliente", client);
        Usuario user = IA.obtenerUsuario(correo);
        session.setAttribute("fotoPerfil", user.getIdFoto());
        request.setAttribute("notisEmail", user.getNotisEmail());
        
        request.getRequestDispatcher("/Vistas/Perfil.jsp").forward(request, response);
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
