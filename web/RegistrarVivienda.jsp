<%-- 
    Document   : RegistrarVivienda
    Created on : Nov 20, 2024, 7:29:06 PM
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
        <h1>Registrar</h1>
        <form id="form1" name="form1" method="post" action="RegistrarVivienda">
        <table>
            <tr>
                <td>Tipo:</td>
                <td><input type="radio" id="dept" name="tipo" value="Apartamento"/>
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
                <td><input type="text" id="dir" name="dir" value=""><br></td>
            </tr>
            <tr>
                <td>Contrato:</td>
                <td><input type="radio" id="vent" name="cont" value="Venta"/>
                    <label for="m">Venta</label><br>
                    <input type="radio" id="arri" name="cont" value="Arriendo"/>
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
        </table>
        <input type="submit" value="Actualizar">
    </form>
    </body>
</html>
