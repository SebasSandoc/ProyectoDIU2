
package modelo;


public class Estado {
    
    private int EstadoID;
    private String nombre;

    public Estado() {
    }

    public Estado(int EstadoID, String nombre) {
        this.EstadoID = EstadoID;
        this.nombre = nombre;
    }

    public int getEstadoID() {
        return EstadoID;
    }

    public String getNombre() {
        return nombre;
    }
    
    
}
