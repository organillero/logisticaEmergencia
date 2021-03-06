// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.entidad;

import emergencia.entidad.Sci;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Sci_Roo_Json {
    
    public String Sci.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Sci Sci.fromJsonToSci(String json) {
        return new JSONDeserializer<Sci>().use(null, Sci.class).deserialize(json);
    }
    
    public static String Sci.toJsonArray(Collection<Sci> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Sci> Sci.fromJsonArrayToScis(String json) {
        return new JSONDeserializer<List<Sci>>().use(null, ArrayList.class).use("values", Sci.class).deserialize(json);
    }
    
}
