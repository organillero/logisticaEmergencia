// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.entidad;

import java.lang.String;

privileged aspect EmergenciaSuministro_Roo_ToString {
    
    public String EmergenciaSuministro.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Emergencia: ").append(getEmergencia()).append(", ");
        sb.append("Suministro: ").append(getSuministro()).append(", ");
        sb.append("Cantidad: ").append(getCantidad()).append(", ");
        sb.append("IdEmerSumi: ").append(getIdEmerSumi());
        return sb.toString();
    }
    
}