<%-- 
    Document   : eliminarVivienda
    Created on : Nov 20, 2024, 4:59:35 PM
    Author     : SEBASTIAN
--%>

<%@page import="modelo.ViviendaDAO"%>
<%@page import="modelo.Vivienda"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion_cli = request.getSession();
    ArrayList<Vivienda> viv = new ArrayList<>();
    int id = Integer.parseInt(request.getParameter("delete"));
    viv = ViviendaDAO.buscarVivienda(" WHERE viviendaID ="+id);
    Vivienda vivienda = viv.get(0);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%System.out.println(request.getParameter("delete"));%>
        <h1>Hello World!</h1>
        <form action="EliminarVivienda" method="post">
            <button name="borrar" id="borrar" type="summit">Borrar</button>
            <input type="text" name="id" id="id" value="<%=id%>" hidden>
        </form>
    </body>
</html>
