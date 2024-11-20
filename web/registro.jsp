<%-- 
    Document   : registro
    Created on : Nov 20, 2024, 1:07:18 AM
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
        <h1>Registro</h1>
        <form id="form1" name="form1" method="post" action="CrearUsuario">
            <table>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" id="cnom" name="cnom"><br></td>
                </tr>
                <tr>
                    <td>Apellido:</td>
                    <td><input type="text" id="cap" name="cap"><br></td>
                </tr>
                <tr>               
                    <td>Genero:</td>
                    <td><input type="radio" id="m" name="cgen" value="M"/>
                        <label for="m">Masculino</label><br>
                        <input type="radio" id="f" name="cgen" value="F"/>
                        <label for="f">Femenino</label><br></td>
                </tr>
                <tr>
                    <td>Fecha de nacimiento:</td>
                    <td><input type="date" id="cfech" name="cfech"><br></td>
                </tr>
                <tr>
                    <td>Correo:</td>
                    <td><input type="text" id="cmail" name="cmail"><br></td>
                </tr>
                <tr>
                    <td>Nombre de usuario:</td>
                    <td><input type="text" id="cuser" name="cuser" ><br></td>
                </tr>
                <tr>
                    <td>Clave:</td>
                    <td><input type="password" id="cclave" name="cclave" ><br></td>
                </tr>
            </table>
            <input type="submit" value="Registrar">
        </form>
    </body>
</html>
