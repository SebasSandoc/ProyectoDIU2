
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ViviendaDAO {
    
    public static int agregarUsuario(Usuario u) {
        Conexion cn = new Conexion();
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        int estatus = 0;

        try {
            con = cn.crearConexion();
            String q = "INSERT INTO vivienda (tipo, ciudad, direccion, contrato, presupuesto, caracteristicas, estado)"
                    + "values (?,?,?,?,?,?,1)";

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
    
    public static int modificar(int clave, Vivienda nuevo) {
        PreparedStatement psnt;
        Conexion cx = new Conexion();
        Connection con = cx.crearConexion();

        try {
            psnt = con.prepareStatement("UPDATE vivienda SET tipo=?, ciudad=?, direccion=?, contrato=?, tamanio=?, "
                    + "presupuesto=?, caracteristicas=?, estado=? WHERE usuarioID = ?");            
            psnt.setString(1, nuevo.getTipo());
            psnt.setString(2, nuevo.getCiudad());
            psnt.setString(3, nuevo.getDireccion());
            psnt.setString(4, nuevo.getContrato());
            psnt.setFloat(5, nuevo.getTamanio());
            psnt.setFloat(6, nuevo.getPresupuesto());
            psnt.setString(7, nuevo.getCaracteristicas());
            psnt.setInt(8, nuevo.getEstado());
            psnt.setInt(9, clave);
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
    
    public static ArrayList<Vivienda> buscarVivienda(String query) {
        ArrayList<Vivienda> lista = new ArrayList<>();
        PreparedStatement psnt;
        ResultSet rs;
        Conexion cx = new Conexion();
        Connection con = cx.crearConexion();
        try { 
            psnt = con.prepareStatement("SELECT * FROM vivienda "+query);
            System.out.println(psnt);
            rs=psnt.executeQuery();
            while (rs.next()) {
                Vivienda viv = new Vivienda(
                rs.getInt("viviendaID"),
                rs.getString("tipo"),
                rs.getString("ciudad"),
                rs.getString("direccion"),
                rs.getString("contrato"),
                rs.getFloat("tamanio"),
                rs.getFloat("presupuesto"),
                rs.getString("caracteristicas"),
                rs.getInt("estado"),
                rs.getString("imagen"));
                lista.add(viv);
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
