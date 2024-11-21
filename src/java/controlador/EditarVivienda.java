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
import javax.servlet.http.HttpSession;
import modelo.UsuarioDAO;
import modelo.Vivienda;
import modelo.ViviendaDAO;

public class EditarVivienda extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        String tipo;
        String ciudad;
        String direccion;
        String contrato;
        Float tamanio;
        Float presupuesto;
        String caracteristicas;
        int estado;
        String imagen;
        int id;
        Vivienda viv = new Vivienda();

        tipo = new String(request.getParameter("tipo").getBytes("ISO-8859-1"), "UTF-8");
        ciudad = new String(request.getParameter("cid").getBytes("ISO-8859-1"), "UTF-8");
        direccion = new String(request.getParameter("dir").getBytes("ISO-8859-1"), "UTF-8");
        contrato = new String(request.getParameter("cont").getBytes("ISO-8859-1"), "UTF-8");
        tamanio = Float.valueOf(new String(request.getParameter("tam").getBytes("ISO-8859-1"), "UTF-8"));
        presupuesto = Float.valueOf(new String(request.getParameter("pres").getBytes("ISO-8859-1"), "UTF-8"));
        caracteristicas = new String(request.getParameter("car").getBytes("ISO-8859-1"), "UTF-8");
        imagen = new String(request.getParameter("img").getBytes("ISO-8859-1"), "UTF-8");
        estado = Integer.parseInt(new String(request.getParameter("est").getBytes("ISO-8859-1"), "UTF-8"));
        id = Integer.parseInt(new String(request.getParameter("id").getBytes("ISO-8859-1"), "UTF-8"));

        if (ciudad.isEmpty() || direccion.isEmpty() || tamanio == 0 || presupuesto == 0 || caracteristicas.isEmpty()) {
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('No se permiten campos vacios.');");
            out.println("location='propietario.jsp';");
            out.println("</script>");
            //response.sendRedirect("index.jsp"); 
        } else {
            System.out.println("entro");
            viv.setTipo(tipo);
            viv.setCiudad(ciudad);
            viv.setContrato(contrato);
            viv.setDireccion(direccion);
            viv.setTamanio(tamanio);
            viv.setPresupuesto(presupuesto);
            viv.setCaracteristicas(caracteristicas);
            viv.setImagen(imagen);
            viv.setEstado(estado);
            //System.out.println("llave "+select);
            int status = ViviendaDAO.modificar(id, viv);

            System.out.println("entro");

            if (status > 0) {
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Propiedad actualizada');");
                out.println("location='propietario.jsp';");
                out.println("</script>");
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
