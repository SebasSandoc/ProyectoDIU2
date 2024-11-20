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
import javax.servlet.http.HttpSession;
import modelo.Usuario;
import modelo.UsuarioDAO;

public class EditarCl extends HttpServlet {

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

        user = UsuarioDAO.buscar(" WHERE usuario = " + key);
        if (user.get(0).getClave().equals(cold)) {
            int status = UsuarioDAO.modificarClave(key, cnew);

            System.out.println("entro");

            if (status > 0) {
                System.out.println("registrado");
                response.sendRedirect("mensaje.jsp");
            }
        }else{
            
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
