<%-- 
    Document   : panel
    Created on : Nov 19, 2024, 6:16:44 PM
    Author     : SEBASTIAN
--%>

<%@page import="modelo.ViviendaDAO"%>
<%@page import="modelo.Vivienda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion_cli = request.getSession(true);
    String UserReg = (String) sesion_cli.getAttribute("UserReg");
    int key = (Integer) sesion_cli.getAttribute("key");
    ArrayList<Usuario> role1 = new ArrayList<>();
    role1 = UsuarioDAO.buscar(" WHERE usuarioID =" + key);
    int role = role1.get(0).getRol();
    System.out.println(role);
    ArrayList<Vivienda> viv = new ArrayList<>();
    String nom = null;
    String ap = null;
    ArrayList<Usuario> user = new ArrayList<>();

    boolean admin = false;
    boolean prop = false;

    if (role == 1) {
        admin = true;
    } else if (role == 2) {
        prop = true;
    }
    user = UsuarioDAO.buscar(" WHERE usuario = '" + UserReg + "'");
    nom = user.get(0).getNombre();
    ap = user.get(0).getApellido();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
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


            #adminbtn {
                background-color: #ffffff;
                color: #007bff;
                cursor: pointer;

                position: absolute;
                top: 50%;
                right: 20px;
                transform: translateY(-50%);
                border: 2px solid #007bff;
                padding: 8px 15px;
                font-size: 16px;
                font-weight: bold;
                border-radius: 5px;
                text-decoration: none;
                transition: background-color 0.3s, color 0.3s;
            }

            #cerrarbtn {
                background-color: #ffffff;
                color: #007bff;
                cursor: pointer;

                position: absolute;
                top: 50px;
                left: 15px;
                width: 140px;
                height: 30px;
                transform: translateY(-50%);
                border: 2px solid #007bff;
                padding: 8px 15px;
                font-size: 16px;
                font-weight: bold;
                border-radius: 5px;
                text-decoration: none;
                transition: background-color 0.3s, color 0.3s;
            }

            #nombreReg {
                position: absolute;
                top: -8px;
                left: 5px;
                font-size: 16px;
                padding: 8px 15px;
                color: white;
            }

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
                position: relative; /* Para posicionar elementos dentro del encabezado */
                text-align: center;
            }

            .admin-btn {
                background-color: #ffffff;
                color: #007bff;
                cursor: pointer;

                position: absolute;
                top: 50%;
                right: 20px;
                transform: translateY(-50%);
                border: 2px solid #007bff;
                padding: 8px 15px;
                font-size: 16px;
                font-weight: bold;
                border-radius: 5px;
                text-decoration: none;
                transition: background-color 0.3s, color 0.3s;
            }

            .admin-btn:hover {
                background-color: #007bff; /* Azul */
                color: white;
            }

            nav {
                display: flex;
                justify-content: center;
                border: 2px solid #007bff;
                border-width: 0 0 2px 0; /* Línea inferior */
                overflow: hidden;

            }

            nav a {
                flex: 1;
                text-decoration: none;
                text-align: center;
                padding: 15px 0;
                font-size: 18px;
                font-weight: bold;
                color: white;
                transition: background-color 0.3s;
            }

            .navform {
                display: flex;
                border:1px;

            }

            .navform button {
                ;
                width: 320px;
                flex: 10;
                border:5px;
                text-decoration: none;
                text-align: center;
                padding: 15px 0;
                font-size: 18px;
                font-weight: bold;
                color: white;
                transition: background-color 0.3s;
                background-color: #0a6cd6;
            }


            nav a:nth-child(odd) {
                background-color: #007bff; /* Azul */
            }

            nav a:nth-child(even) {
                background-color: white;
                color: #007bff;
            }


            navform button:hover {
                filter: brightness(90%);
            }

            main {
                padding: 20px;
                text-align: center;
            }

            .apt {
                display: flex;
                align-items: center; /* Align image and text vertically */
            }
            .apt img {
                width: 300px; /* Set desired width */
                height: 150px; /* Set desired height */
                margin-right: 10px; /* Add spacing between image and text */
            }
        </style>
    </head>
    <body>
        <header>
            Inmobiliaria
            <p id="nombreReg">Bienvenido <%=nom%> <%=ap%></p>
            <form action="CerrarSesion" method="get">
                <button id="cerrarbtn" type="submit">Cerrar Sesion</button>
            </form>
            <div style="<%= admin ? "" : "display:none;"%>">
                <form action="admin.jsp" method="get">
                    <button id="adminbtn" class="admin-btn" type="submit">Admin</button>
                </form>
            </div>
            <div style="<%= prop ? "" : "display:none;"%>">
                    <form action="propietario.jsp" method="get">
                        <button id="adminbtn" type="submit">Gestionar viviendas</button>
                    </form> 
            </div>        
        </header>

        <%            System.out.println("userreg " + UserReg);

        %>
        <nav>
            <form class="navform" action="BusquedaViv" method="get" target="frame">
                <button name="accion" value="Todos" type="submit" id="button">Todos</button>
                <button name="accion" value="En venta" type="submit" id="button1">En venta</button>
                <button name="accion" value="Arriendo" type="submit" id="button2">Arriendo</button>
            </form>
            <form class="navform" action="controlUser.jsp" method="get">
                <button type="submit">Panel de usuario</button>
            </form>
            <form id="buscar" class="navform" action="busqueda.jsp" method="get">
                <button type="submit">Buscar</button>
            </form>
        </nav>
        
        <iframe name="frame" src="todo.jsp" width="100%" height="800">

        </iframe>



    </form>           
</body>
</html>
