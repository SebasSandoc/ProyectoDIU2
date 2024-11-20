
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginDAO {
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs;

    public LoginDAO() {
    }

    public Usuario login(String usuario, String clave) {
        Usuario datos = null;

        try {
            Conexion cn = new Conexion();
            conn = cn.crearConexion();

            stmt = (PreparedStatement) conn.prepareStatement(
                    "SELECT * FROM usuario WHERE usuario =  ? AND  clave =  ?");

            stmt.setString(1, usuario);
            stmt.setString(2, clave);

            rs = stmt.executeQuery();

            if (rs.next()) {
                datos = new Usuario();
                datos.setUsuario(rs.getString("usuario"));
                datos.setClave(rs.getString("clave"));
                datos.setUsuarioID(rs.getInt("usuarioID"));
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
        }
        return datos;
    }
}
