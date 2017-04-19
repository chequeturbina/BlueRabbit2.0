/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mapeo;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Abraham
 */
@Entity
@Table(name="puesto")
public class Puesto {

    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="idpuesto")
    private int idPuesto;
    
    @Column(name="nombre")
    private String nombre;

    @Column(name="descripcion")
    private String descripcion;

    @Column(name="calificacion")
    private float calificacion;
    
    @Column(name="menu")
    private String menu;
    
    @OneToMany(mappedBy="puesto")
    private Set<Comentarios> comentarios = new HashSet<>();

    
    public Puesto(){}

    public Puesto(int idPuesto, String nombre, String descripcion, float calificacion, String menu) {
        this.idPuesto = idPuesto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.calificacion = calificacion;
        this.menu = menu;
    }   
    
    public int getIdPuesto() {
        return idPuesto;
    }

    public void setIdPuesto(int idPuesto) {
        this.idPuesto = idPuesto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(float calificacion) {
        this.calificacion = calificacion;
    }

    public Set<Comentarios> getComentarios() {
        return comentarios;
    }

    public void setComentarios(Set<Comentarios> comentarios) {
        this.comentarios = comentarios;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

 
    
}
