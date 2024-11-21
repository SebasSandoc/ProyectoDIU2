<%-- 
    Document   : controlUser
    Created on : Nov 19, 2024, 8:44:50 PM
    Author     : SEBASTIAN
--%>

<%@page import="modelo.UsuarioDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion_cli = request.getSession(true);
    String UserReg = (String) sesion_cli.getAttribute("UserReg");
    int key = (Integer) sesion_cli.getAttribute("key");
    String nom = null;
    String ap = null;
    String usu = null;
    String gen = null;
    Date fech = null;
    String mail = null;
    String cla = null;
    ArrayList<Usuario> user = new ArrayList<>();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            #update {
                display: none;
            }

            #updateLogin {
                display: none;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            user = UsuarioDAO.buscar(" WHERE usuario = '" + UserReg + "'");
            nom = user.get(0).getNombre();
            ap = user.get(0).getApellido();
            usu = user.get(0).getUsuario();
            gen = user.get(0).getGenero();
            fech = user.get(0).getFecha_nacimiento();
            mail = user.get(0).getCorreo();
            cla = user.get(0).getClave();
        %>
        <h1>Panel usuario</h1>
        <table>
            <tr>
                <td>Nombre:</td>
                <td><%=nom%></td>
            </tr>
            <tr>
                <td>Apellido:</td>
                <td><%=ap%></td>
            </tr>
            <tr>
                <td>Nombre de usuario:</td>
                <td><%=usu%></td>
            </tr>
            <tr>               
                <td>Genero:</td>
                <td><%=gen%></td>
            </tr>
            <tr>
                <td>Fecha de nacimiento:</td>
                <td><%=fech%></td>
            </tr>
            <tr>
                <td>Correo:</td>
                <td><%=mail%></td>
            </tr>
        </table>
        <form action="panel.jsp" method="get">
            <button type="submit">Regresar</button>
        </form>
        <button type="button" onclick="actualizar()">modificar datos</button>
        <button type="button" onclick="actuaLogin()">Cambiar contraseña</button>
        <form action="eliminar.jsp" method="get">
            <button type="submit">Eliminar usuario</button>
        </form>
        <div id="update">
            <h1>datos</h1>
            <form id="form1" name="form1" method="post" action="EditarUsuario">
                <table>
                    <tr>
                        <td>Nombre:</td>
                        <td><input type="text" id="cnom" name="cnom" value="<%=nom%>"><br></td>
                    </tr>
                    <tr>
                        <td>Apellido:</td>
                        <td><input type="text" id="cap" name="cap" value="<%=ap%>"><br></td>
                    </tr>
                    <tr>               
                        <td>Genero:</td>
                        <td><input type="radio" id="m" name="cgen" value="M" checked/>
                            <label for="m">Masculino</label><br>
                            <input type="radio" id="f" name="cgen" value="F"/>
                            <label for="f">Femenino</label><br></td>
                    </tr>
                    <tr>
                        <td>Fecha de nacimiento:</td>
                        <td><input type="date" id="cfech" name="cfech" value="<%=fech%>"><br></td>
                    </tr>
                    <tr>
                        <td>Correo:</td>
                        <td><input type="text" id="cmail" name="cmail" value="<%=mail%>"><br></td>
                    </tr>
                </table>
                <input type="submit" value="Actualizar">
            </form>
        </div>

        <div id="updateLogin">
            <h1>datos</h1>
            <form id="form1" name="form1" method="post" action="EditarClave">
                <table>
                    <tr>
                        <td>Clave vieja:</td>
                        <td><input type="password" id="cold" name="cold" value=""><br></td>
                    </tr>
                    <tr>
                        <td>Nueva clave:</td>
                        <td><input type="password" id="cnew" name="cnew" value=""><br></td>
                    </tr>                   
                </table>
                <input type="submit" value="Actualizar">
            </form>
        </div>
    </body>

    <script type="text/javascript">
        function actualizar() {
            var hiddenDiv = document.getElementById('update');
            if (hiddenDiv.style.display === 'none'|| hiddenDiv.style.display === '') {
                hiddenDiv.style.display = 'block';
            } else {
                hiddenDiv.style.display = 'none';
            }
        }

        function actuaLogin() {
            var hiddenDiv = document.getElementById('updateLogin');

            if (hiddenDiv.style.display === 'none' || hiddenDiv.style.display === '') {
                hiddenDiv.style.display = 'block';
            } else {
                hiddenDiv.style.display = 'none';
            }
        }
    </script>
</html>
