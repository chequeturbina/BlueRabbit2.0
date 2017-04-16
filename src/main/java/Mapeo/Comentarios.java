/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mapeo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Abraham
 */
@Entity
@Table(name="comentarios")
public class Comentarios {

    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="idcomentarios")
    private int idComentarios;

    @Column(name="comentarios")
    private String comentarios;
    
    @Column(name="calificacion")    
    private int calificacion;
    
    @ManyToOne
    @JoinColumn(name = "idPuesto") /*Puesto_idPuesto*/
    private Puesto puesto;
/*
    @ManyToOne /*No estoy segura de que vaya aquí o si sea necesario
    @JoinColumn(name= "comida_id")
    private Comida comida;
  */  
    @ManyToOne
    @JoinColumn(name= "idUsuario")
    private Usuario usuario;
    
    public Comentarios(){}

    public Comentarios(int idComentarios, String comentarios, int calificacion) {
        this.idComentarios = idComentarios;
        this.comentarios = comentarios;
        this.calificacion = calificacion;
    }
    
    /*
    * No sabemos si será requerido de esta forma
    */
    public Comentarios(int idComentarios, String comentarios, int calificacion, Puesto puesto, Usuario Usuario_idUsuario) {
        this.idComentarios = idComentarios;
        this.comentarios = comentarios;
        this.calificacion = calificacion;
        this.puesto = puesto;
        this.usuario = usuario;
    }
    
    
    
    public int getIdComentarios() {
        return idComentarios;
    }

    public void setIdComentarios(int idComentarios) {
        this.idComentarios = idComentarios;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

    public int getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }

    public Puesto getPuesto() {
        return puesto;
    }

    public void setPuesto(Puesto puesto) {
        this.puesto = puesto;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    
}
