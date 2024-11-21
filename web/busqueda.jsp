
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <button onclick="window.location.href='panel.jsp';">Regresar</button>
        <h1>Busqueda</h1>
        <form action="Busqueda" method="post" target="frame">
            <input type="text" id="ent" name="ent">
            <select name="tipo" id="tipo">
                <option value="tipo">Tipo</option>
                <option value="ciudad">Ciudad</option>
                <option value="direccion">Direccion</option>
                <option value="contrato">Contrato</option>
                <option value="tamanio">Tamaño</option>
                <option value="presupuesto">Presupuesto</option>
                <option value="caracteristicas">Caracteristicas</option>               
            </select>
            <button type="submit">Buscar</button>
        </form>
        <iframe name="frame" src="about:blank" width="600" height="400"></iframe>
    </body>
</html>
