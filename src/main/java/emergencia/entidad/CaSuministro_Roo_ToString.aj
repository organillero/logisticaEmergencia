// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.entidad;

import java.lang.String;

privileged aspect CaSuministro_Roo_ToString {
    
    public String CaSuministro.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("CentroAcopio: ").append(getCentroAcopio()).append(", ");
        sb.append("Suministro: ").append(getSuministro()).append(", ");
        sb.append("IdCaSuministro: ").append(getIdCaSuministro());
        return sb.toString();
    }
    
}
