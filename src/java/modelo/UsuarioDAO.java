package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsuarioDAO {

    public static int agregarUsuario(Usuario u) {
        Conexion cn = new Conexion();
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        int estatus = 0;

        try {
            con = cn.crearConexion();
            String q = "INSERT INTO usuario ( nombre, apellido, correo, usuario, clave, fecha_nacimiento, genero,rolID)"
                    + "values (?,?,?,?,?,?,?,3)";

            ps = con.prepareStatement(q);

            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApellido());
            ps.setString(3, u.getCorreo());
            ps.setString(4, u.getUsuario());
            ps.setString(5, u.getClave());
            ps.setDate(6, u.getFecha_nacimiento());
            ps.setString(7, u.getGenero());

            estatus = ps.executeUpdate();
            con.close();

            System.out.print("REGISTRO GUARDADO DE FORMA EXITOSA...");

        } catch (SQLException ex) {
            System.out.print("ERROR AL REGISTRAR LA ACTIVIDAD...");
            System.out.print(ex.getMessage());
        }
        return estatus;
    }
    
    public static ArrayList<Usuario> buscar(String query) {
        ArrayList<Usuario> lista = new ArrayList<>();
        PreparedStatement psnt;
        ResultSet rs;
        Conexion cx = new Conexion();
        Connection con = cx.crearConexion();
        try { 
            psnt = con.prepareStatement("SELECT * FROM usuario "+query);
            System.out.println(psnt);
            rs=psnt.executeQuery();
            while (rs.next()) {
                Usuario user = new Usuario(
                rs.getInt("usuarioID"),
                rs.getString("Nombre"),
                rs.getString("Correo"),
                rs.getString("Apellido"),
                rs.getString("usuario"),
                rs.getString("clave"),
                rs.getDate("fecha_nacimiento"),
                rs.getString("genero"),
                rs.getInt("rolID"));
                lista.add(user);
            }
            
        } catch (Exception ex) {
            System.out.println("error al consultar " + ex.getMessage());
        }
        try {
            con.close();
        } catch (SQLException ex) {
            System.out.println("error al consultar " + ex.getMessage());
        }
        return lista;
    }
    
    public static int modificar(int clave, Usuario nuevo) {
        PreparedStatement psnt;
        Conexion cx = new Conexion();
        Connection con = cx.crearConexion();

        try {
            psnt = con.prepareStatement("UPDATE usuario SET nombre=?, correo=?, apellido=?, fecha_nacimiento=?, genero=?"
                    + " WHERE usuarioID = ?");            
            psnt.setString(1, nuevo.getNombre());
            psnt.setString(2, nuevo.getCorreo());
            psnt.setString(3, nuevo.getApellido());
            psnt.setDate(4, nuevo.getFecha_nacimiento());
            psnt.setString(5, nuevo.getGenero());
            psnt.setInt(6, clave);
            System.out.println(psnt);

            int ru = psnt.executeUpdate();
            if (ru > 0) {
                System.out.println("dato actualizado");
                return ru;
            }

        } catch (SQLException ex) {
            System.out.println("Error de modificacion " + ex.getMessage());
        }
        return 0;
    }
    
    public static int modificarRol(int clave, Usuario nuevo) {
        PreparedStatement psnt;
        Conexion cx = new Conexion();
        Connection con = cx.crearConexion();

        try {
            psnt = con.prepareStatement("UPDATE usuario SET rolID=?"
                    + " WHERE usuarioID = ?");            
            psnt.setInt(1, nuevo.getRol());
            psnt.setInt(2, clave);
            System.out.println(psnt);

            int ru = psnt.executeUpdate();
            if (ru > 0) {
                System.out.println("dato actualizado");
                return ru;
            }

        } catch (SQLException ex) {
            System.out.println("Error de modificacion " + ex.getMessage());
        }
        return 0;
    }
    
    public static int modificarClave(int clave, String nuevo) {
        PreparedStatement psnt;
        Conexion cx = new Conexion();
        Connection con = cx.crearConexion();

        try {
            psnt = con.prepareStatement("UPDATE usuario SET clave=? WHERE usuarioID = ?");            
            psnt.setString(1, nuevo);
            psnt.setInt(2, clave);
            System.out.println(psnt);

            int ru = psnt.executeUpdate();
            if (ru > 0) {
                System.out.println("dato actualizado");
                return ru;
            }

        } catch (SQLException ex) {
            System.out.println("Error de modificacion " + ex.getMessage());
        }
        return 0;
    }
    
    public static int eliminar(int clave) {
        System.out.println("entra");
        System.out.println(clave);
        PreparedStatement psnt;
        Conexion cx = new Conexion();
        Connection con = cx.crearConexion();
        try {
            psnt = con.prepareStatement("DELETE FROM usuario WHERE usuarioID = ?");
            psnt.setInt(1, clave);
            int rd = psnt.executeUpdate();
            if (rd > 0) {
                System.out.println("Usuario borrado correctamente");
                return rd;
            } else {
                System.out.println("no borrado");
                 return rd;
            }
        } catch (SQLException ex) {
            System.out.println("Error al borrar" + ex.getMessage());
        }
        return 0;
    }
}
