
package modelo;


public class Usuario_vivienda {
    
    private int user_viviendaID;
    private int viviendaID;
    private int usuarioID;

    public Usuario_vivienda(int user_viviendaID, int viviendaID, int usuarioID) {
        this.user_viviendaID = user_viviendaID;
        this.viviendaID = viviendaID;
        this.usuarioID = usuarioID;
    }
    
    

    public Usuario_vivienda() {
    }

    public int getUser_viviendaID() {
        return user_viviendaID;
    }

    public void setUser_viviendaID(int user_viviendaID) {
        this.user_viviendaID = user_viviendaID;
    }

    public int getViviendaID() {
        return viviendaID;
    }

    public void setViviendaID(int viviendaID) {
        this.viviendaID = viviendaID;
    }

    public int getUsuarioID() {
        return usuarioID;
    }

    public void setUsuarioID(int usuarioID) {
        this.usuarioID = usuarioID;
    }

    @Override
    public String toString() {
        return "Usuario_vivienda{" + "user_viviendaID=" + user_viviendaID + ", viviendaID=" + viviendaID + ", usuarioID=" + usuarioID + '}';
    }
    
    
}
