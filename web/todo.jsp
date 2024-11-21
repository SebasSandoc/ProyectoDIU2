<%-- 
    Document   : todo
    Created on : Nov 21, 2024, 11:57:55 AM
    Author     : SEBASTIAN
--%>

<%@page import="modelo.ViviendaDAO"%>
<%@page import="modelo.Vivienda"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Vivienda> viv = new ArrayList<>();
    String query = (String) request.getAttribute("query");
    if(query==null){
        viv = ViviendaDAO.buscarVivienda("");
    }else{
        viv = ViviendaDAO.buscarVivienda(query);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p><%=query%></p>
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
