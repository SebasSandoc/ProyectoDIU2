
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
    
    
}
