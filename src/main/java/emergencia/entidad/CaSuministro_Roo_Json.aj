// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.entidad;

import emergencia.entidad.CaSuministro;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect CaSuministro_Roo_Json {
    
    public String CaSuministro.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static CaSuministro CaSuministro.fromJsonToCaSuministro(String json) {
        return new JSONDeserializer<CaSuministro>().use(null, CaSuministro.class).deserialize(json);
    }
    
    public static String CaSuministro.toJsonArray(Collection<CaSuministro> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<CaSuministro> CaSuministro.fromJsonArrayToCaSuministroes(String json) {
        return new JSONDeserializer<List<CaSuministro>>().use(null, ArrayList.class).use("values", CaSuministro.class).deserialize(json);
    }
    
}
