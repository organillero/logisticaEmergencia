// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.entidad;

import java.lang.String;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;

privileged aspect Suministro_Roo_DbManaged {
    
    @Column(name = "nombre", length = 100)
    @NotNull
    private String Suministro.nombre;
    
    public String Suministro.getNombre() {
        return this.nombre;
    }
    
    public void Suministro.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
