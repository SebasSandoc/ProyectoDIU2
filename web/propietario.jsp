
<%@page import="modelo.Usuario_ViviendaDAO"%>
<%@page import="modelo.Usuario_vivienda"%>
<%@page import="modelo.Vivienda"%>
<%@page import="modelo.ViviendaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    HttpSession sesion_cli = request.getSession();
    ArrayList<Vivienda> viv = new ArrayList<>();
    ArrayList<Usuario_vivienda> userviv = new ArrayList<>();
    int key = (Integer) sesion_cli.getAttribute("key");
    userviv = Usuario_ViviendaDAO.buscarUserViv(" WHERE usuarioID = " + key);
    for (int i = 0; i < userviv.size(); i++) {
        ArrayList<Vivienda> tempviv = ViviendaDAO.buscarVivienda("WHERE viviendaID =" + userviv.get(i).getViviendaID());
        viv.add(tempviv.get(0));
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function Accion(actionType) {
                const form = document.getElementById('form2');
                if (actionType === 'editar') {
                    form.action = 'index.jsp';  // URL for the first action
                    console.log("edita");
                } else if (actionType === 'action2') {
                    form.action = 'action2Handler.php';  // URL for the second action
                }
            }
        </script>
        <style>
            .apt {
                display: flex;
                align-items: center; /* Align image and text vertically */
            }
            .apt img {
                width: 300px; /* Set desired width */
                height: 150px; /* Set desired height */
                margin-right: 10px; /* Add spacing between image and text */
            }

            #update {
                display: none;
            }
        </style>
    </head>
    <body>

        <h1>Propiedades registradas</h1>


        <%
            if (viv != null) {
                for (Vivienda vivienda : viv) {
        %>
        <div class="apt">
            <img src="<%=vivienda.getImagen()%>">          

            <p>
                ciudad:<%= vivienda.getCiudad()%><br>
                Tipo: <%= vivienda.getTipo()%><br>
                Direccion:<%= vivienda.getDireccion()%><br>
                Contrato:<%= vivienda.getContrato()%><br>
                tamaño:<%= vivienda.getTamanio()%>m2<br>
                Presupuesto:<%= vivienda.getPresupuesto()%>$<br>
                Caracteristicas<%= vivienda.getCaracteristicas()%><br>
            </p>
            <table>
                <tr>
                    <td>
                        <form action="EnviarEditar" method="post">
                            <button type="submit">Editar</button>
                            <input type="text" id="select" name="select" value="<%=vivienda.getViviendaID()%>" hidden>
                        </form>
                    </td>
                </tr>
                <td>
                    <form action="Eliminar" method="post">
                        <button type="submit">Editar</button>
                        <input type="text" id="delete" name="delete" value="<%=vivienda.getViviendaID()%>" hidden>
                    </form>
                </td>
            </table>
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
<div id="update">
    <h1>Modificar</h1>
    <form id="form1" name="form1" method="post" action="EditarUsuario">
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
                <td><input type="text" id="cid" name="cid" value=""><br></td>
            </tr>
            <tr>
                <td>Direccion:</td>
                <td><input type="date" id="dir" name="dir" value=""><br></td>
            </tr>
            <tr>
                <td>Contrato:</td>
                <td><input type="radio" id="vent" name="cont" value="vent" checked/>
                    <label for="m">Venta</label><br>
                    <input type="radio" id="arri" name="cont" value="arri"/>
                    <label for="f">Arriendo</label><br></td>
            </tr>
            <tr>
                <td>tamaño:</td>
                <td><input type="text" id="tam" name="tam" value=""><br></td>
            </tr>
            <tr>
                <td>presupuesto:</td>
                <td><input type="text" id="pres" name="pres" value=""><br></td>
            </tr>
            <tr>
                <td>Caracteristicas</td>
                <td><input type="text" id="car" name="car" value=""><br></td>
            </tr>
            <tr>
                <td>Imagen</td>
                <td><input type="text" id="img" name="img" value=""><br></td>
            </tr>
            <tr>
                <td>Estado:</td>
                <td><input type="radio" id="disp" name="est" value="1"/>
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
