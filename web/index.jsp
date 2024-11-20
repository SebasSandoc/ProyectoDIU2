<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inmoviliaria</title>
    </head>
    <body>
        <form id="form1" name="form1" method="post" action="ControlLogin">
            <table width="421" height="102" border="1">
                <tr>
                    <td width="157">Usuario</td>
                    <td width="248"><label for="user"></label>
                        <input type="text" name="user" id="user" /></td>
                </tr>
                <tr>
                    <td>Contraseña</td>
                    <td><label for="clave"></label>
                        <input type="password" name="clave" id="clave" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><input name="accion" value="Ingresar" type="submit" id="button" /></td>
                </tr>
            </table>
        </form>
        <form action="registro.jsp" method="get">
            <button type="submit">Registrar</button>
        </form>
    </body>
</html>
