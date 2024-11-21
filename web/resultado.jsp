<%-- 
    Document   : resultado
    Created on : Nov 20, 2024, 8:49:57 PM
    Author     : SEBASTIAN
--%>

<%@page import="modelo.ViviendaDAO"%>
<%@page import="modelo.Vivienda"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Vivienda> viv = new ArrayList<>();
    String tipo = (String) request.getAttribute("tipo");
    String ent = (String) request.getAttribute("ent");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            viv = ViviendaDAO.buscarVivienda("WHERE " + tipo + "='" + ent+"'");
        %>
        <h1>Resultado</h1>
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
    <p>No hay viviendas registradas</p>
</tr>
<%
    }
%>

</body>
</html>
