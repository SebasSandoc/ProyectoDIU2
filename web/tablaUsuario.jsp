
<%@page import="modelo.RolesDAO"%>
<%@page import="modelo.Roles"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Usuario> dao = new ArrayList<>();
    dao = UsuarioDAO.buscar("");
    Roles roles = new Roles();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Usuarios</h1>
        <form action="CambiarRol" id="admin1" method="post">
            <table>
                <tr>
                    <td>seleccionar</td>
                    <td>ID</td>
                    <td>Nombre</td>
                    <td>Apellido</td>
                    <td>Correo</td>
                    <td>Fecha de nacimiento</td>
                    <td>genero</td>
                    <td>Usuario</td>
                    <td>rol</td>
                </tr>
                <%
                    for (int i = 0; i < dao.size(); i++) {
                        roles = RolesDAO.nombreRol(String.valueOf(dao.get(i).getRol()));
                %>
                <tr>
                    <td><input type="radio" id="<%=dao.get(i).getUsuarioID()%>" name="seleccion" value="<%=dao.get(i).getUsuarioID()%>"></td>
                    <td><%=dao.get(i).getUsuarioID()%></td>
                    <td><%=dao.get(i).getNombre()%></td>
                    <td><%=dao.get(i).getApellido()%></td>
                    <td><%=dao.get(i).getCorreo()%></td>
                    <td><%=dao.get(i).getFecha_nacimiento()%></td>
                    <td><%=dao.get(i).getGenero()%></td>
                    <td><%=dao.get(i).getUsuario()%></td>
                    <td><%=roles.getNombre()%></td>
                </tr>
                <%
                    }
                %>
            </table>
            <select name="op" id="op">
                <option value="1">Cambiar rol a administrador</option>
                <option value="2">Cambiar rol a propietario</option>
                <option value="3">cambiar rol a usuario</option>
                <option value="4">Eliminar Usuario</option>
            </select>
            <input type="submit" value="Ejecutar">
        </form>
    </body>
</html>
