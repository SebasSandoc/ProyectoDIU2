<%-- 
    Document   : eliminar
    Created on : Nov 20, 2024, 1:58:56 AM
    Author     : SEBASTIAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Eliminar</h1>
        <form action="EliminarUsuario" method="post">
            <button type="submit">ELIMINAR</button>
        </form>
        <form action="controlUser.jsp" method="get">
            <button type="submit">cancelar</button>
        </form>
    </body>
</html>
