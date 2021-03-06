// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.entidad;

import emergencia.entidad.Persona;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Persona_Roo_Json {
    
    public String Persona.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Persona Persona.fromJsonToPersona(String json) {
        return new JSONDeserializer<Persona>().use(null, Persona.class).deserialize(json);
    }
    
    public static String Persona.toJsonArray(Collection<Persona> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Persona> Persona.fromJsonArrayToPersonae(String json) {
        return new JSONDeserializer<List<Persona>>().use(null, ArrayList.class).use("values", Persona.class).deserialize(json);
    }
    
}
