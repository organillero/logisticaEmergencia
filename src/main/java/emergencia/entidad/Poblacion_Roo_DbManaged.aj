// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.entidad;

import emergencia.entidad.Emergencia;
import emergencia.entidad.InstEncargada;
import emergencia.entidad.Sci;
import java.lang.Integer;
import java.lang.String;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

privileged aspect Poblacion_Roo_DbManaged {
    
    @OneToMany(mappedBy = "poblacion")
    private Set<Sci> Poblacion.scis;
    
    @ManyToOne
    @JoinColumn(name = "id_emergencia", referencedColumnName = "id_emergencia")
    private Emergencia Poblacion.emergencia;
    
    @ManyToOne
    @JoinColumn(name = "id_instencargada", referencedColumnName = "id_instencargada")
    private InstEncargada Poblacion.instEncargada;
    
    @Column(name = "lugar", length = 100)
    @NotNull
    private String Poblacion.lugar;
    
    @Column(name = "dano", length = 2000)
    @NotNull
    private String Poblacion.dano;
    
    @Column(name = "solucion")
    @NotNull
    private Integer Poblacion.solucion;
    
    @Column(name = "sector_descriptivo", length = 100)
    @NotNull
    private String Poblacion.sectorDescriptivo;
    
    @Column(name = "num_evacuados")
    @NotNull
    private Integer Poblacion.numEvacuados;
    
    @Column(name = "num_refugiados")
    @NotNull
    private Integer Poblacion.numRefugiados;
    
    public Set<Sci> Poblacion.getScis() {
        return this.scis;
    }
    
    public void Poblacion.setScis(Set<Sci> scis) {
        this.scis = scis;
    }
    
    public Emergencia Poblacion.getEmergencia() {
        return this.emergencia;
    }
    
    public void Poblacion.setEmergencia(Emergencia emergencia) {
        this.emergencia = emergencia;
    }
    
    public InstEncargada Poblacion.getInstEncargada() {
        return this.instEncargada;
    }
    
    public void Poblacion.setInstEncargada(InstEncargada instEncargada) {
        this.instEncargada = instEncargada;
    }
    
    public String Poblacion.getLugar() {
        return this.lugar;
    }
    
    public void Poblacion.setLugar(String lugar) {
        this.lugar = lugar;
    }
    
    public String Poblacion.getDano() {
        return this.dano;
    }
    
    public void Poblacion.setDano(String dano) {
        this.dano = dano;
    }
    
    public Integer Poblacion.getSolucion() {
        return this.solucion;
    }
    
    public void Poblacion.setSolucion(Integer solucion) {
        this.solucion = solucion;
    }
    
    public String Poblacion.getSectorDescriptivo() {
        return this.sectorDescriptivo;
    }
    
    public void Poblacion.setSectorDescriptivo(String sectorDescriptivo) {
        this.sectorDescriptivo = sectorDescriptivo;
    }
    
    public Integer Poblacion.getNumEvacuados() {
        return this.numEvacuados;
    }
    
    public void Poblacion.setNumEvacuados(Integer numEvacuados) {
        this.numEvacuados = numEvacuados;
    }
    
    public Integer Poblacion.getNumRefugiados() {
        return this.numRefugiados;
    }
    
    public void Poblacion.setNumRefugiados(Integer numRefugiados) {
        this.numRefugiados = numRefugiados;
    }
    
}
