
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RolesDAO {
    
    public static Roles nombreRol(String query) {
        Roles lista = new Roles();
        PreparedStatement psnt;
        ResultSet rs;
        Conexion cx = new Conexion();
        Connection con = cx.crearConexion();
        try { 
            psnt = con.prepareStatement("SELECT * FROM roles WHERE rolID="+query);
            System.out.println(psnt);
            rs=psnt.executeQuery();
            while (rs.next()) {
                Roles roles = new Roles(
                rs.getInt("rolID"),
                rs.getString("nombre"),
                rs.getString("descripcion"));
                lista = roles;
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
