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
import logica.clases.Cliente;
import logica.clases.Usuario;
import logica.fabrica.Fabrica;
import logica.interfaces.IAdministracion;

/**
 *
 * @author MarmaduX
 */
@WebServlet(name = "Perfil", urlPatterns = {"/Perfil"})
public class Perfil extends HttpServlet {

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
            out.println("<title>Servlet Perfil</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Perfil at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);
        String correo = (String) session.getAttribute("user");
        IAdministracion IA = Fabrica.getInstancia().getControladorCliente();
        Cliente client = IA.traerClientePorCorreo(correo);
        request.setAttribute("cliente", client);
        session.setAttribute("cliente", client);
        Usuario user = IA.obtenerUsuario(correo);
        session.setAttribute("fotoPerfil", user.getIdFoto());
        request.setAttribute("notisEmail", user.getNotisEmail());
        
        request.getRequestDispatcher("/Vistas/Perfil.jsp").forward(request, response);
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
        String correo_in_session = (String) session.getAttribute("user");
        String idFoto = (String) session.getAttribute("fotoPerfil");
        int cedula = Integer.parseInt(request.getParameter("cedula"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        int telefono = Integer.parseInt(request.getParameter("telefono"));
        Usuario user = IA.obtenerUsuario(correo);
        Cliente cliente = IA.traerClientePorCorreo(correo);
        Cliente cliente_cedula = IA.traerClienteSeleccionado(cedula);
        Cliente clienteViejo = (Cliente) session.getAttribute("cliente");
        request.setAttribute("cliente", clienteViejo);
        session.setAttribute("cliente", clienteViejo);
        session.setAttribute("user", correo_in_session);
        session.setAttribute("fotoPerfil", idFoto);

        if ((user == null || user.getCorreo().equals(correo_in_session)) && (cliente_cedula == null || cliente_cedula.getCedula() == clienteViejo.getCedula()) && (cliente == null || cliente.getCorreo().equals(clienteViejo.getCorreo()))) {
            IA.editarClienteSeleccionado(cedula, clienteViejo.getCedula(), nombre, apellido, telefono, correo);
            IA.editarUsuario(correo, idFoto, correo_in_session);
        } else {
            request.setAttribute("correo", correo);
            request.setAttribute("nombre", nombre);
            request.setAttribute("cedula", cedula);
            request.setAttribute("apellido", apellido);
            request.setAttribute("telefono", telefono);
            request.setAttribute("error", "correo");
            if (!(cliente == null || cliente_cedula.getCedula() == clienteViejo.getCedula())) {
                request.setAttribute("error", "Cedula");
            } else if (!(cliente == null || cliente.getCorreo() == clienteViejo.getCorreo())) {
                request.setAttribute("error", "correo");
            }
            request.getRequestDispatcher("/Vistas/Perfil.jsp").forward(request, response);
            return;
        }
        Cliente client = IA.traerClientePorCorreo(correo);
        request.setAttribute("cliente", client);
        session.setAttribute("cliente", client);
        session.setAttribute("user", correo);
        session.setAttribute("fotoPerfil", idFoto);

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
