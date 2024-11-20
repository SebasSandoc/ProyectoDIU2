<%-- 
    Document   : panel
    Created on : Nov 19, 2024, 6:16:44 PM
    Author     : SEBASTIAN
--%>

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
    //String key = (String) sesion_cli.getAttribute("key");
    String nom = null;
    String ap = null;
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
            System.out.println("userreg "+ UserReg);
            user = UsuarioDAO.buscar(" WHERE usuario = '"+UserReg+"'");
            nom = user.get(0).getNombre();
            ap = user.get(0).getApellido();
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
        
    </body>
</html>
