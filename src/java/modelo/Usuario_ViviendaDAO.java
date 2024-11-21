
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Usuario_ViviendaDAO {
    
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
    
    
}
