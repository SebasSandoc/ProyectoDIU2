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
import modelo.Usuario;
import modelo.UsuarioDAO;

public class EditarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int key = (Integer) session.getAttribute("key");
        System.out.println(key);
        response.setContentType("text/html;charset=UTF-8");
        int userID;
        String nombre;
        String correo;
        String apellido;
        String strFecn;
        String genero;
        Usuario user = new Usuario();

        nombre = new String(request.getParameter("cnom").getBytes("ISO-8859-1"), "UTF-8");
        correo = new String(request.getParameter("cmail").getBytes("ISO-8859-1"), "UTF-8");
        apellido = new String(request.getParameter("cap").getBytes("ISO-8859-1"), "UTF-8");
        genero = new String(request.getParameter("cgen").getBytes("ISO-8859-1"), "UTF-8");
        strFecn = new String(request.getParameter("cfech").getBytes("ISO-8859-1"), "UTF-8");

        Date fecn = null;

        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = format.parse(strFecn);
            fecn = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace(); 
        }

        System.out.println("entro");
        user.setApellido(apellido);
        user.setNombre(nombre);
        user.setCorreo(correo);
        user.setFecha_nacimiento(fecn);
        user.setGenero(genero);
        System.out.println("llave "+key);
        int status = UsuarioDAO.modificar(key, user);

        System.out.println("entro");

        if (status > 0) {
            System.out.println("registrado");
            response.sendRedirect("mensaje.jsp");
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
