

<%@page import="modelo.ViviendaDAO"%>
<%@page import="modelo.Vivienda"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion_cli = request.getSession();
    ArrayList<Vivienda> viv = new ArrayList<>();
    int id = Integer.parseInt(request.getParameter("select"));
    viv = ViviendaDAO.buscarVivienda(" WHERE viviendaID ="+id);
    Vivienda vivienda = viv.get(0);
%>
<!DOCTYPE html>
<html>
    <head>
        <%System.out.println(request.getParameter("select"));%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Editar</h1>
        <p>id: ${select}</p>
        <div id="update">
            <h1>Modificar</h1>
            <form id="form1" name="form1" method="post" action="EditarVivienda">
                <input type="text" id="id" name="id" value="<%=id%>" hidden>
                <table>
                    <tr>
                        <td>Tipo:</td>
                        <td><input type="radio" id="dept" name="tipo" value="Apartamento" checked/>
                            <label for="m">Apartamento</label><br>
                            <input type="radio" id="casa" name="tipo" value="Casa"/>
                            <label for="f">Casa</label><br></td>
                    </tr>
                    <tr>
                        <td>Ciudad:</td>
                        <td><input type="text" id="cid" name="cid" value="<%=vivienda.getCiudad()%>"><br></td>
                    </tr>
                    <tr>
                        <td>Direccion:</td>
                        <td><input type="text" id="dir" name="dir" value="<%=vivienda.getDireccion()%>"><br></td>
                    </tr>
                    <tr>
                        <td>Contrato:</td>
                        <td><input type="radio" id="vent" name="cont" value="Venta" checked/>
                            <label for="m">Venta</label><br>
                            <input type="radio" id="arri" name="cont" value="Arriendo"/>
                            <label for="f">Arriendo</label><br></td>
                    </tr>
                    <tr>
                        <td>tamaño:</td>
                        <td><input type="text" id="tam" name="tam" value="<%=vivienda.getTamanio()%>"><br></td>
                    </tr>
                    <tr>
                        <td>presupuesto:</td>
                        <td><input type="text" id="pres" name="pres" value="<%=vivienda.getPresupuesto()%>"><br></td>
                    </tr>
                    <tr>
                        <td>Caracteristicas</td>
                        <td><input type="text" id="car" name="car" value="<%=vivienda.getCaracteristicas()%>"><br></td>
                    </tr>
                    <tr>
                        <td>Imagen</td>
                        <td><input type="text" id="img" name="img" value="<%=vivienda.getImagen()%>"><br></td>
                    </tr>
                    <tr>
                        <td>Estado:</td>
                        <td><input type="radio" id="disp" name="est" value="1" checked/>
                            <label for="m">Disponible</label><br>
                            <input type="radio" id="tbd" name="est" value="2"/>
                            <label for="f">Pendiente</label><br>
                            <input type="radio" id="nodisp" name="est" value="3"/>
                            <label for="f">No disponible</label><br></td>
                    </tr>
                </table>
                <input type="submit" value="Actualizar">
            </form>
        </div>
    </body>
</html>
