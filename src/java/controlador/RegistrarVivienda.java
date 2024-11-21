/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario_ViviendaDAO;
import modelo.Vivienda;
import modelo.ViviendaDAO;

/**
 *
 * @author SEBASTIAN
 */
public class RegistrarVivienda extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int key = (Integer) session.getAttribute("key");
        String tipo;
        String ciudad;
        String direccion;
        String contrato;
        Float tamanio;
        Float presupuesto;
        String caracteristicas;
        int estado;
        String imagen;
        Vivienda viv = new Vivienda();

        tipo = new String(request.getParameter("tipo").getBytes("ISO-8859-1"), "UTF-8");
        ciudad = new String(request.getParameter("cid").getBytes("ISO-8859-1"), "UTF-8");
        direccion = new String(request.getParameter("dir").getBytes("ISO-8859-1"), "UTF-8");
        contrato = new String(request.getParameter("cont").getBytes("ISO-8859-1"), "UTF-8");
        tamanio = Float.valueOf(new String(request.getParameter("tam").getBytes("ISO-8859-1"), "UTF-8")); 
        presupuesto = Float.valueOf(new String(request.getParameter("pres").getBytes("ISO-8859-1"), "UTF-8")); 
        caracteristicas = new String(request.getParameter("car").getBytes("ISO-8859-1"), "UTF-8");
        imagen = new String(request.getParameter("img").getBytes("ISO-8859-1"), "UTF-8");
        
        viv.setTipo(tipo);
        viv.setCiudad(ciudad);
        viv.setContrato(contrato);
        viv.setDireccion(direccion);
        viv.setTamanio(tamanio);
        viv.setPresupuesto(presupuesto);
        viv.setCaracteristicas(caracteristicas);
        viv.setImagen(imagen);
        int vivid = ViviendaDAO.RegistrarVivienda(viv);
        int status = Usuario_ViviendaDAO.registrarUserViv(key, vivid);

        System.out.println("entro");

        if (status > 0) {
            System.out.println("registrado");
            response.sendRedirect("mensaje.jsp");
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
