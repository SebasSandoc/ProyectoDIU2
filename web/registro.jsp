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
        <title>Registro de usuario</title>
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
            }

            header {
                background-color: #007bff; /* Azul */
                color: white;
                padding: 20px;
                font-size: 24px;
                font-weight: bold;
                text-align: center;
            }

            main {
                padding: 20px;
                max-width: 350px;
                margin: 0 auto;
            }

            h1, h2 {
                color: #007bff; /* Azul */
                font-weight: bold;
                text-align: left;
            }

            .user-info, .form-container {
                margin-bottom: 30px;
                padding: 15px;
                border: 2px solid #007bff;
                border-radius: 8px;
                background-color: #f9f9f9; /* Fondo claro */
            }

            .user-info p, .form-container label {
                font-size: 16px;
                margin: 10px 0;
            }

            input[type="text"], input[type="password"], input[type="date"] {
                width: 100%;
                padding: 8px;
                margin: 5px 0 15px;
                border: 1px solid #007bff;
                border-radius: 5px;
                font-size: 14px;
                max-width: 300px;
            }

            .form-container input[type="radio"] {
                margin-right: 5px;
            }

            button {
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
                width: 300px;
            }

            input[type=button], input[type=submit] {
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
                width: 300px;
            }

            button:hover {
                background-color: #0056b3; /* Azul más oscuro */
            }
        </style>
    </head>
    <body>
        <header>
            Inmobiliria
        </header>
        <main>
            <div class="form-container">
                <h2>Registro</h2>
                <form id="form1" name="form1" method="post" action="CrearUsuario">
                    <label for="cnom">Nombre:</label><br>
                    <input type="text" id="cnom" name="cnom"><br>
                    <label for="cap">Apellido:</label><br>
                    <input type="text" id="cap" name="cap"><br>
                    <label for="m">Genero</label><br>
                    <input type="radio" id="m" name="cgen" value="M"/>
                    <label for="m">Masculino</label>
                    <input type="radio" id="f" name="cgen" value="F"/>
                    <label for="f">Femenino</label><br>
                    <label for="cfech">Fecha de nacimiento:</label><br>
                    <input type="date" id="cfech" name="cfech"><br>
                    <label for="cmail">Correo:</label><br>
                    <input type="text" id="cmail" name="cmail"><br>
                    <label for="cuser">Nombre de usuario:</label><br>
                    <input type="text" id="cuser" name="cuser" ><br>
                    <label for="cclave">Contraseña:</label><br>
                    <input type="password" id="cclave" name="cclave" ><br>               
                    <input type="submit" value="Registrar">
                </form>
                <br>
                <form action="index.jsp" method="get">
                    <button type="submit">Regresar</button>
                </form>
            </div>

        </main>

    </body>
</html>
