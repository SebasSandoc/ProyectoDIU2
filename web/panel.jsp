<%-- 
    Document   : panel
    Created on : Nov 19, 2024, 6:16:44 PM
    Author     : SEBASTIAN
--%>

<%@page import="modelo.ViviendaDAO"%>
<%@page import="modelo.Vivienda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion_cli = request.getSession(true);
    String UserReg = (String) sesion_cli.getAttribute("UserReg");
    int key = (Integer) sesion_cli.getAttribute("key");
    ArrayList<Vivienda> viv = new ArrayList<>();
    String nom = null;
    String ap = null;
    ArrayList<Usuario> user = new ArrayList<>();

    boolean admin = false;
    boolean prop = false;

    if (key == 1) {
        admin = true;
    } else if (key == 2) {
        prop = true;
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .apt {
                display: flex;
                align-items: center; /* Align image and text vertically */
            }
            .apt img {
                width: 300px; /* Set desired width */
                height: 150px; /* Set desired height */
                margin-right: 10px; /* Add spacing between image and text */
            }
        </style>
    </head>
    <body>      

        <%            System.out.println("userreg " + UserReg);
            user = UsuarioDAO.buscar(" WHERE usuario = '" + UserReg + "'");
            nom = user.get(0).getNombre();
            ap = user.get(0).getApellido();
            viv = ViviendaDAO.buscarVivienda("");
        %>
        <h1>Panel</h1>
        <p><%=nom%> <%=ap%></p>
        <p><%=key%></p>
        <form action="controlUser.jsp" method="get">
            <button type="submit">Panel de usuario</button>
        </form>
        <form action="CerrarSesion" method="get">
            <button type="submit">Cerrar Sesion</button>
        </form>
        <div style="<%= admin ? "" : "display:none;"%>">
            <form action="admin.jsp" method="get">
                <button type="submit">Admin</button>
            </form>   
        </div>
        <div style="<%= prop ? "" : "display:none;"%>">
            <form action="propietario.jsp" method="get">
                <button type="submit">Gestionar viviendas</button>
            </form>   
        </div>

        <%
            if (viv != null) {
                for (Vivienda vivienda : viv) {
        %>
        <div class="apt">
            <img src="<%=vivienda.getImagen()%>">
            <p>ciudad:<%= vivienda.getCiudad()%><br>
                Tipo: <%= vivienda.getTipo()%><br>
                Direccion:<%= vivienda.getDireccion()%><br>
                Contrato:<%= vivienda.getContrato()%><br>
                tamaño:<%= vivienda.getTamanio()%>m2<br>
                Presupuesto:<%= vivienda.getPresupuesto()%>$<br>
                Caracteristicas<%= vivienda.getCaracteristicas()%></p>
        </div>
        <%
            }
        } else {
        %>
    <tr>
        <td colspan="5">No hay usuarios registrados</td>
    </tr>
    <%
        }
    %>

</form>           
</body>
</html>
