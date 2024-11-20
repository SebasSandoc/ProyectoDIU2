/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 *
 * @author SEBASTIAN
 */
public class EditarClave extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int key = (Integer) session.getAttribute("key");
        response.setContentType("text/html;charset=UTF-8");
        String cold;
        String cnew;
        ArrayList<Usuario> user;

        cold = new String(request.getParameter("cold").getBytes("ISO-8859-1"), "UTF-8");
        cnew = new String(request.getParameter("cnew").getBytes("ISO-8859-1"), "UTF-8");
        
        System.out.println("claveeeee="+key);

        user = UsuarioDAO.buscar(" WHERE usuarioID = " + key);
        System.out.println(user);
        if (user.get(0).getClave().equals(cold)) {
            int status = UsuarioDAO.modificarClave(key, cnew);

            System.out.println("entro");

            if (status > 0) {
                System.out.println("registrado");
                response.sendRedirect("mensaje.jsp");
            }
        } else {

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
