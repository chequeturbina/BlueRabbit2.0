/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mapeo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 *
 * @author Abraham
 */
@Entity
@Table(name="comida")
public class Comida {
    
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "idComida")
    private int id;
    
    @Column(name="nombre")
    private String nombre;
    
    @OneToOne(mappedBy="Comida_idComida") /*NEEDED*/
    private Puesto puesto;
    
    public Comida(){}
    
    public Comida(int idComida, String nombre, Puesto puesto) {
        this.id = idComida;
        this.nombre = nombre;
        this.puesto = puesto;
    }
    
    public int getId() {
        return id;
    }

    public void setIdcomida(int idComida) {
        this.id = idComida;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Puesto getPuesto() {
        return puesto;
    }

    public void setPuesto(Puesto puesto) {
        this.puesto = puesto;
    }

    public void setId(int id) {
        this.id = id;
    }

    

}
