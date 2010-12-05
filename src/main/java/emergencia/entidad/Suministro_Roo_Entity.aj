// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.entidad;

import emergencia.entidad.Suministro;
import java.lang.Integer;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Suministro_Roo_Entity {
    
    declare @type: Suministro: @Entity;
    
    declare @type: Suministro: @Table(name = "suministro", schema = "public");
    
    @PersistenceContext
    transient EntityManager Suministro.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_suministro")
    private Integer Suministro.idSuministro;
    
    public Integer Suministro.getIdSuministro() {
        return this.idSuministro;
    }
    
    public void Suministro.setIdSuministro(Integer id) {
        this.idSuministro = id;
    }
    
    @Transactional
    public void Suministro.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Suministro.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Suministro attached = this.entityManager.find(this.getClass(), this.idSuministro);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Suministro.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Suministro Suministro.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Suministro merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Suministro.entityManager() {
        EntityManager em = new Suministro().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Suministro.countSuministroes() {
        return entityManager().createQuery("select count(o) from Suministro o", Long.class).getSingleResult();
    }
    
    public static List<Suministro> Suministro.findAllSuministroes() {
        return entityManager().createQuery("select o from Suministro o", Suministro.class).getResultList();
    }
    
    public static Suministro Suministro.findSuministro(Integer id) {
        if (id == null) return null;
        return entityManager().find(Suministro.class, id);
    }
    
    public static List<Suministro> Suministro.findSuministroEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Suministro o", Suministro.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
