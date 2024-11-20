package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.LoginDAO;
import modelo.Usuario;


public class ControlLogin extends HttpServlet {
    
    LoginDAO logindao = new LoginDAO();
    Usuario datos = new Usuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession(true);
        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("Ingresar")) {
            String usu = request.getParameter("user");
            String cla = request.getParameter("clave");

            datos = logindao.login(usu, cla);

            if (datos.getUsuario() != null) {
                request.setAttribute("datos", datos);

                HttpSession sesion_cli = request.getSession(true);
                sesion_cli.setAttribute("nUsuario", request.getParameter("user"));

                request.getRequestDispatcher("panel.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
