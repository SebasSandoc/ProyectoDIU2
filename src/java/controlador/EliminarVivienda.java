
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
import modelo.Usuario_ViviendaDAO;
import modelo.Usuario_vivienda;
import modelo.ViviendaDAO;


public class EliminarVivienda extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        response.setContentType("text/html;charset=UTF-8");        
        HttpSession session = request.getSession();
        int key = (Integer) session.getAttribute("key");

        //num_docu = new String(request.getParameter("cnumdocu").getBytes("ISO-8859-1"), "UTF-8");
        System.out.println("entro");
        int id;

        id = Integer.parseInt(new String(request.getParameter("id").getBytes("ISO-8859-1"), "UTF-8"));

        ArrayList<Usuario_vivienda> uv = Usuario_ViviendaDAO.buscarR(id, key);
        Usuario_vivienda userviv = uv.get(0);
        int uvStatus = Usuario_ViviendaDAO.eliminar(userviv.getUser_viviendaID());
        int vStatus = ViviendaDAO.eliminar(id);
        
        System.out.println("entro");

        if (uvStatus > 0 && vStatus > 0) {
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Viviendad eliminada del sistema');");
            out.println("location='propietario.jsp';");
            out.println("</script>");
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
