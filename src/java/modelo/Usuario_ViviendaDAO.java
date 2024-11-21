
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Usuario_ViviendaDAO {
    
    public static int registrarUserViv(int user, int viv){
        Conexion cn = new Conexion();
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        int estatus = 0;

        try {
            con = cn.crearConexion();
            String q = "INSERT INTO usuario_vivienda (viviendaID,UsuarioID)"
                    + "values (?,?)";

            ps = con.prepareStatement(q);

            ps.setInt(1, viv);
            ps.setInt(2, user);

            estatus = ps.executeUpdate();
            con.close();

            System.out.print("REGISTRO GUARDADO DE FORMA EXITOSA...");

        } catch (SQLException ex) {
            System.out.print("ERROR AL REGISTRAR LA ACTIVIDAD...");
            System.out.print(ex.getMessage());
        }
        return estatus;
    }
    
    public static ArrayList<Usuario_vivienda> buscarUserViv(String query) {
        ArrayList<Usuario_vivienda> lista = new ArrayList<>();
        PreparedStatement psnt;
        ResultSet rs;
        Conexion cx = new Conexion();
        Connection con = cx.crearConexion();
        try { 
            psnt = con.prepareStatement("SELECT * FROM usuario_vivienda "+query);
            System.out.println(psnt);
            rs=psnt.executeQuery();
            while (rs.next()) {
                Usuario_vivienda userviv = new Usuario_vivienda(
                rs.getInt("user_viviendaID"),
                rs.getInt("viviendaID"),
                rs.getInt("usuarioID"));
                lista.add(userviv);
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
    
     public static ArrayList<Usuario_vivienda> buscarR(int viv, int user) {
        ArrayList<Usuario_vivienda> lista = new ArrayList<>();
        PreparedStatement psnt;
        ResultSet rs;
        Conexion cx = new Conexion();
        Connection con = cx.crearConexion();
        try { 
            psnt = con.prepareStatement("SELECT * FROM usuario_vivienda where usuarioID="+user+" AND viviendaID="+viv);
            System.out.println(psnt);
            rs=psnt.executeQuery();
            while (rs.next()) {
                Usuario_vivienda userviv = new Usuario_vivienda(
                rs.getInt("user_viviendaID"),
                rs.getInt("viviendaID"),
                rs.getInt("usuarioID"));
                lista.add(userviv);
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
     
     public static int eliminar(int clave) {
        System.out.println("entra");
        System.out.println(clave);
        PreparedStatement psnt;
        Conexion cx = new Conexion();
        Connection con = cx.crearConexion();
        try {
            psnt = con.prepareStatement("DELETE FROM usuario_vivienda WHERE user_viviendaID = ?");
            psnt.setInt(1, clave);
            int rd = psnt.executeUpdate();
            if (rd > 0) {
                System.out.println("borrado correctamente");
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
     
      public static int eliminarAdmin(int clave) {
        System.out.println("entra");
        System.out.println(clave);
        PreparedStatement psnt;
        Conexion cx = new Conexion();
        Connection con = cx.crearConexion();
        try {
            psnt = con.prepareStatement("DELETE FROM usuario_vivienda WHERE viviendaID = ?");
            psnt.setInt(1, clave);
            int rd = psnt.executeUpdate();
            if (rd > 0) {
                System.out.println("borrado correctamente");
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
