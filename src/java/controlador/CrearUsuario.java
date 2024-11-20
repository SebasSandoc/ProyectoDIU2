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
public class CrearUsuario extends HttpServlet {

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
        String nombre;
        String apellido;
        String email;
        String usuario;
        String strFecn;
        String genero;
        String clave;

        nombre = new String(request.getParameter("cnom").getBytes("ISO-8859-1"), "UTF-8");
        apellido = new String(request.getParameter("cap").getBytes("ISO-8859-1"), "UTF-8");
        email = new String(request.getParameter("cmail").getBytes("ISO-8859-1"), "UTF-8");
        usuario = new String(request.getParameter("cuser").getBytes("ISO-8859-1"), "UTF-8");
        genero = new String(request.getParameter("cgen").getBytes("ISO-8859-1"), "UTF-8");
        clave = new String(request.getParameter("cclave").getBytes("ISO-8859-1"), "UTF-8");
        strFecn = new String(request.getParameter("cfech").getBytes("ISO-8859-1"), "UTF-8");
        
        Date fecn = null;

        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = format.parse(strFecn);
            fecn = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace(); 
        }
               

        Usuario u = new Usuario();

        u.setNombre(nombre);
        u.setApellido(apellido);
        u.setCorreo(email);
        u.setUsuario(usuario);
        u.setClave(clave);
        u.setGenero(genero);
        u.setFecha_nacimiento(fecn);
        

        System.out.println("entro");

        int status = UsuarioDAO.agregarUsuario(u);

        System.out.println("entro");

        if (status > 0) {
            System.out.println("registrado");
            //response.sendRedirect("mensaje.jsp");
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
