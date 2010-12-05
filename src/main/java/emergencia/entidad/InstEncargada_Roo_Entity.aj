// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.entidad;

import emergencia.entidad.InstEncargada;
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

privileged aspect InstEncargada_Roo_Entity {
    
    declare @type: InstEncargada: @Entity;
    
    declare @type: InstEncargada: @Table(name = "inst_encargada", schema = "public");
    
    @PersistenceContext
    transient EntityManager InstEncargada.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_instencargada")
    private Integer InstEncargada.idInstencargada;
    
    public Integer InstEncargada.getIdInstencargada() {
        return this.idInstencargada;
    }
    
    public void InstEncargada.setIdInstencargada(Integer id) {
        this.idInstencargada = id;
    }
    
    @Transactional
    public void InstEncargada.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void InstEncargada.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            InstEncargada attached = this.entityManager.find(this.getClass(), this.idInstencargada);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void InstEncargada.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public InstEncargada InstEncargada.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        InstEncargada merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager InstEncargada.entityManager() {
        EntityManager em = new InstEncargada().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long InstEncargada.countInstEncargadas() {
        return entityManager().createQuery("select count(o) from InstEncargada o", Long.class).getSingleResult();
    }
    
    public static List<InstEncargada> InstEncargada.findAllInstEncargadas() {
        return entityManager().createQuery("select o from InstEncargada o", InstEncargada.class).getResultList();
    }
    
    public static InstEncargada InstEncargada.findInstEncargada(Integer id) {
        if (id == null) return null;
        return entityManager().find(InstEncargada.class, id);
    }
    
    public static List<InstEncargada> InstEncargada.findInstEncargadaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from InstEncargada o", InstEncargada.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}