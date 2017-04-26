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
@Table(name="usuario")
public class Usuario {
    
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "idusuario")
    private int idUsuario;
    
    @Column
    private String nombre;

    @Column
    private String correo;

    @Column
    private String contrasena;

    @Column
    private String foto;
    
    @Column
    private int edad;
    
    @Column
    private String carrera;
    

    @OneToMany(mappedBy="usuario")
    private Set<Comentarios> comentarios = new HashSet<>();

    
    public Usuario(int idUsuario, String nombre, String correo, String contrasena, String foto, int edad, String carrera) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.correo = correo;
        this.contrasena = contrasena;
        this.foto = foto;
        this.edad = edad;
        this.carrera = carrera;
    }

    public Usuario(){}

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public Set<Comentarios> getComentarios() {
        return comentarios;
    }

    public void setComentarios(Set<Comentarios> comentarios) {
        this.comentarios = comentarios;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }
    
 
    
}
