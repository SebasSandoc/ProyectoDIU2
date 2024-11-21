<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inmoviliaria</title>
    </head>
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
    <body>
        <header>
            Inmobiliria
        </header>
        <main>
            <div class="form-container">
                <form id="form1" name="form1" method="post" action="ControlLogin">
                    <label for="user">usuario:</label><br>
                    <input type="text" name="user" id="user" /><br>
                    <label for="clave">contraseña:</label><br>
                    <input type="password" name="clave" id="clave" /><br>
                    <input name="accion" value="Iniciar Sesion" type="submit" id="button">
                </form>
                <br>
                <form action="registro.jsp" method="get">
                    <button type="submit">Registrar</button>
                </form>
            </div>


        </main>

    </body>
</html>
