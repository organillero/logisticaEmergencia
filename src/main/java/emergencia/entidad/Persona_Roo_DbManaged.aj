// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.entidad;

import java.lang.Integer;
import java.lang.String;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;

privileged aspect Persona_Roo_DbManaged {
    
    @Column(name = "locacion", length = 20)
    @NotNull
    private String Persona.locacion;
    
    @Column(name = "correo", length = 10)
    @NotNull
    private String Persona.correo;
    
    @Column(name = "perfil", length = 30)
    @NotNull
    private String Persona.perfil;
    
    @Column(name = "celular")
    @NotNull
    private Integer Persona.celular;
    
    @Column(name = "direccion", length = 500)
    @NotNull
    private String Persona.direccion;
    
    @Column(name = "nombre", length = 100)
    @NotNull
    private String Persona.nombre;
    
    public String Persona.getLocacion() {
        return this.locacion;
    }
    
    public void Persona.setLocacion(String locacion) {
        this.locacion = locacion;
    }
    
    public String Persona.getCorreo() {
        return this.correo;
    }
    
    public void Persona.setCorreo(String correo) {
        this.correo = correo;
    }
    
    public String Persona.getPerfil() {
        return this.perfil;
    }
    
    public void Persona.setPerfil(String perfil) {
        this.perfil = perfil;
    }
    
    public Integer Persona.getCelular() {
        return this.celular;
    }
    
    public void Persona.setCelular(Integer celular) {
        this.celular = celular;
    }
    
    public String Persona.getDireccion() {
        return this.direccion;
    }
    
    public void Persona.setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public String Persona.getNombre() {
        return this.nombre;
    }
    
    public void Persona.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
