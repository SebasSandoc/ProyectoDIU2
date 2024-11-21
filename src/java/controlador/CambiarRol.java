/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 *
 * @author SEBASTIAN
 */
public class CambiarRol extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id;
        int rol;
        ArrayList<Usuario> usu = new ArrayList<>();
        Usuario user = new Usuario();

        id = Integer.parseInt(new String(request.getParameter("seleccion").getBytes("ISO-8859-1"), "UTF-8"));
        rol = Integer.parseInt(new String(request.getParameter("op").getBytes("ISO-8859-1"), "UTF-8"));

        if (rol == 4) {
            int status = UsuarioDAO.eliminar(id);
            if (status > 0) {
                System.out.println("registrado");
                response.sendRedirect("mensaje.jsp");
            }
        } else {

            usu = UsuarioDAO.buscar("WHERE UsuarioID=" + id);
            user = usu.get(0);
            System.out.println("rol: " + rol);
            user.setRol(rol);
            int status = UsuarioDAO.modificarRol(id, user);

            System.out.println("entro");

            if (status > 0) {
                System.out.println("registrado");
                response.sendRedirect("mensaje.jsp");
            }
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
        processRequest(request, response);
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
