// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.entidad;

import emergencia.entidad.CentroAcopio;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect CentroAcopio_Roo_Json {
    
    public String CentroAcopio.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static CentroAcopio CentroAcopio.fromJsonToCentroAcopio(String json) {
        return new JSONDeserializer<CentroAcopio>().use(null, CentroAcopio.class).deserialize(json);
    }
    
    public static String CentroAcopio.toJsonArray(Collection<CentroAcopio> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<CentroAcopio> CentroAcopio.fromJsonArrayToCentroAcopios(String json) {
        return new JSONDeserializer<List<CentroAcopio>>().use(null, ArrayList.class).use("values", CentroAcopio.class).deserialize(json);
    }
    
}
