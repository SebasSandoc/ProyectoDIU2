
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EstadoDAO {
    
    public static Estado nombreEstado(String query) {
        Estado lista = new Estado();
        PreparedStatement psnt;
        ResultSet rs;
        Conexion cx = new Conexion();
        Connection con = cx.crearConexion();
        try { 
            psnt = con.prepareStatement("SELECT * FROM estados WHERE estadoID="+query);
            System.out.println(psnt);
            rs=psnt.executeQuery();
            while (rs.next()) {
                Estado est = new Estado(
                rs.getInt("estadoID"),
                rs.getString("nombre"));
                lista = est;
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
}
