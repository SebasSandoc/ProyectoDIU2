
package modelo;

public class Vivienda {
    
    private int viviendaID;
    private String tipo;
    private String ciudad;
    private String direccion;
    private String contrato;
    private float tamanio;
    private float presupuesto;
    private String caracteristicas;
    private int estado;
    private String imagen;

    public Vivienda(int viviendaID, String tipo, String ciudad, String direccion, String contrato, float tamanio, float presupuesto, String caracteristicas, int estado, String imagen) {
        this.viviendaID = viviendaID;
        this.tipo = tipo;
        this.ciudad = ciudad;
        this.direccion = direccion;
        this.contrato = contrato;
        this.tamanio = tamanio;
        this.presupuesto = presupuesto;
        this.caracteristicas = caracteristicas;
        this.estado = estado;
        this.imagen = imagen;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }


    public Vivienda() {
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }


    public int getViviendaID() {
        return viviendaID;
    }

    public void setViviendaID(int viviendaID) {
        this.viviendaID = viviendaID;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getContrato() {
        return contrato;
    }

    public void setContrato(String contrato) {
        this.contrato = contrato;
    }

    public float getTamanio() {
        return tamanio;
    }

    public void setTamanio(float tamanio) {
        this.tamanio = tamanio;
    }

    public float getPresupuesto() {
        return presupuesto;
    }

    public void setPresupuesto(float presupuesto) {
        this.presupuesto = presupuesto;
    }

    public String getCaracteristicas() {
        return caracteristicas;
    }

    public void setCaracteristicas(String caracteristicas) {
        this.caracteristicas = caracteristicas;
    }
    
    
}
