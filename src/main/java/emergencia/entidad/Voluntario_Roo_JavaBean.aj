// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.entidad;

import java.lang.String;
import java.util.Date;

privileged aspect Voluntario_Roo_JavaBean {
    
    public String Voluntario.getNombre() {
        return this.nombre;
    }
    
    public void Voluntario.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String Voluntario.getCorreo() {
        return this.correo;
    }
    
    public void Voluntario.setCorreo(String correo) {
        this.correo = correo;
    }
    
    public Date Voluntario.getFechaNacimiento() {
        return this.fechaNacimiento;
    }
    
    public void Voluntario.setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    
}