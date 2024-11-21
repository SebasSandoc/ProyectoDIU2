
<%@page import="modelo.EstadoDAO"%>
<%@page import="modelo.Estado"%>
<%@page import="modelo.ViviendaDAO"%>
<%@page import="modelo.Vivienda"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Vivienda> dao = new ArrayList<>();
    dao = ViviendaDAO.buscarVivienda("");
    Estado est = new Estado();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Viviendas</h1>
        <form action="EnviarEliminarAdmin" id="admin1" method="post">
            <table>
                <tr>
                    <td>seleccionar</td>
                    <td>ID</td>
                    <td>Tipo</td>
                    <td>Ciudad</td>
                    <td>Direccion</td>
                    <td>Contrato</td>
                    <td>tamaño</td>
                    <td>Presupuesto</td>
                    <td>Caracteristicas</td>
                    <td>Estado</td>
                </tr>
                <%
                    for (int i = 0; i < dao.size(); i++) {
                        est = EstadoDAO.nombreEstado(String.valueOf(dao.get(i).getEstado()));
                %>
                <tr>
                    <td><input type="radio" id="<%=dao.get(i).getViviendaID()%>" name="delete" value="<%=dao.get(i).getViviendaID()%>"></td>
                    <td><%=dao.get(i).getViviendaID()%></td>
                    <td><%=dao.get(i).getTipo()%></td>
                    <td><%=dao.get(i).getCiudad()%></td>
                    <td><%=dao.get(i).getDireccion()%></td>
                    <td><%=dao.get(i).getContrato()%></td>
                    <td><%=dao.get(i).getTamanio()%></td>
                    <td><%=dao.get(i).getPresupuesto()%></td>
                    <td><%=dao.get(i).getCaracteristicas()%></td>
                    <td><%=est.getNombre()%></td>
                </tr>
                <%
                    }
                %>
            </table>
            <input type="submit" value="Borrar">
        </form>
    </body>
</html>
