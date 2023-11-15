/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.clases.Envio;
import logica.clases.Valoracion;
import logica.fabrica.Fabrica;

/**
 *
 * @author Angelo
 */
@WebServlet(name = "Valoracion", urlPatterns = {"/Valoracion"})
public class ValorarEnvio extends HttpServlet {

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
            out.println("<title>Servlet Valoracion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Valoracion at " + request.getContextPath() + "</h1>");
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
        int idEnvio = request.getParameter("idEnvio") != null ? Integer.parseInt(request.getParameter("idEnvio")) : 0;
        Envio envio = Fabrica.getInstancia().getControladorEnvio().verDetallesDelEnvio(idEnvio);
        if (idEnvio > 0 && envio != null) {
            Valoracion valo = Fabrica.getInstancia().getControladorEnvio().buscarValoracionId(idEnvio);
            if (valo != null && valo.getenvio().getIdEnvio() == idEnvio) {
                request.setAttribute("valoracion", valo);
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/Valoracion.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("/");
        }
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
        int idEnvio = Integer.parseInt(request.getParameter("inputIdEnvio"));
        Valoracion valo = Fabrica.getInstancia().getControladorEnvio().buscarValoracionId(idEnvio);
        if (valo != null) {
            response.sendRedirect("/");
        } else {
            int puntaje = Integer.parseInt(request.getParameter("puntaje"));
            String comentario = request.getParameter("campo_comentario");
            Fabrica.getInstancia().getControladorEnvio().crearValoracion(idEnvio, puntaje, comentario);
            response.sendRedirect("/");
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
