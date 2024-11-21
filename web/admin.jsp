

<%@page import="modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion_cli = request.getSession(true);
    int key = (Integer) sesion_cli.getAttribute("key");
    ArrayList<Usuario> dao = new  ArrayList<>();
    dao=UsuarioDAO.buscar(" WHERE usuarioID="+key);
    Usuario user = dao.get(0);
    String nom = user.getNombre();
    String ap = user.getApellido();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>   
        <h1>Admin</h1>
        <button onclick="window.location.href='panel.jsp';">Regresar</button>
        <p>
            nombre: <%=nom%><br>
            Apellido: <%=ap%>
        </p>
        <form action="tablaUsuario.jsp" method="post" target="frame">
            <button type="submit">Usuarios</button>
        </form>
        <form action="tablaVivienda.jsp" method="post" target="frame">
            <button type="submit">Inmovibiliarias</button>
        </form>
        <iframe name="frame" src="about:blank" width="600" height="400"></iframe>
    </body>
</html>
