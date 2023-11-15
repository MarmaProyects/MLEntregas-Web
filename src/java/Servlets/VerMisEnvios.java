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
import javax.servlet.http.HttpSession;
import logica.clases.Envio;
import logica.fabrica.Fabrica;
import logica.interfaces.IAdministracion;
import logica.interfaces.IEnvio;

/**
 *
 * @author leo
 */
@WebServlet(name = "VerMisEnvios", urlPatterns = {"/VerMisEnvios"})
public class VerMisEnvios extends HttpServlet {

    public Fabrica fab = Fabrica.getInstancia();

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
            out.println("<title>Servlet VerMisEnvios</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerMisEnvios at " + request.getContextPath() + "</h1>");
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
        IEnvio iEnvio = fab.getControladorEnvio();
        HttpSession session = request.getSession(true);
        request.setAttribute("ListaEnvios", iEnvio.listarEnviosPorCorreo((String) session.getAttribute("user")));
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/VerMisEnvios.jsp");
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
        IEnvio iEnvio = fab.getControladorEnvio();
        IAdministracion iPago = fab.getControladorPago();
        int idEnvio = Integer.parseInt(request.getParameter("idEnvio"));
        String tipoPago = request.getParameter("tipoPago");
        Envio envio = iEnvio.verDetallesDelEnvio(idEnvio);
        iPago.pagarEnvio(envio.getPago().getIdPago(), tipoPago);
        request.setAttribute("ListaEnvios", iEnvio.listaDeEnviosEnCamino());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/VerMisEnvios.jsp");
        dispatcher.forward(request, response);
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
