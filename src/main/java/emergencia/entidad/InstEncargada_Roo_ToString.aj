// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.entidad;

import java.lang.String;

privileged aspect InstEncargada_Roo_ToString {
    
    public String InstEncargada.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Poblacions: ").append(getPoblacions() == null ? "null" : getPoblacions().size()).append(", ");
        sb.append("Nombre: ").append(getNombre()).append(", ");
        sb.append("IdResponsable: ").append(getIdResponsable()).append(", ");
        sb.append("Funciones: ").append(getFunciones()).append(", ");
        sb.append("IdInstencargada: ").append(getIdInstencargada());
        return sb.toString();
    }
    
}
