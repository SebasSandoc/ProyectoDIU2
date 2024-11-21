
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
        <h1>Admin borrar</h1>
        <form action="EliminarVivAdmin" method="post">
            <button name="borrar" id="borrar" type="summit">Borrar</button>
            <input type="text" name="id" id="id" value="<%=id%>" hidden>
        </form>
    </body>
</html>
