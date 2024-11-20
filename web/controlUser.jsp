<%-- 
    Document   : controlUser
    Created on : Nov 19, 2024, 8:44:50 PM
    Author     : SEBASTIAN
--%>

<%@page import="modelo.UsuarioDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion_cli = request.getSession(true);
    String UserReg = (String) sesion_cli.getAttribute("UserReg");
    String nom = null;
    String ap = null;
    String usu = null;
    String gen = null;
    Date fech = null;
    String mail = null;
    ArrayList<Usuario> user = new ArrayList<>();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            user = UsuarioDAO.buscar(" WHERE usuario = '"+UserReg+"'");
            nom = user.get(0).getNombre();
            ap = user.get(0).getApellido();
            usu = user.get(0).getUsuario();
            gen = user.get(0).getGenero();
            fech = user.get(0).getFecha_nacimiento();
            mail = user.get(0).getCorreo();
        %>
        <h1>Panel usuario</h1>
        <table>
            <tr>
                <td>Nombre:</td>
                <td><%=nom%></td>
            </tr>
            <tr>
                <td>Apellido:</td>
                <td><%=ap%></td>
            </tr>
            <tr>
                <td>Nombre de usuario:</td>
                <td><%=usu%></td>
            </tr>
            <tr>               
                <td>Genero:</td>
                <td><%=gen%></td>
            </tr>
            <tr>
                <td>Fecha de nacimiento:</td>
                <td><%=fech%></td>
            </tr>
            <tr>
                <td>Correo:</td>
                <td><%=mail%></td>
            </tr>
        </table>
    </body>
</html>
