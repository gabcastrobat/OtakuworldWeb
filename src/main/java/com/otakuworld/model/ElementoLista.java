package com.otakuworld.model;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import java.time.LocalDateTime;

/**
 * Entidad ElementoLista mapeada a tabla en base de datos.
 * Representa un elemento (serie o película) guardado en "Mi Lista" por un usuario.
 * 
 * @author OtakuWorld Team
 * @version 2.0
 */
@Entity
@Table(name = "mi_lista", indexes = {
    @Index(name = "idx_usuario_id", columnList = "usuario_id"),
    @Index(name = "idx_tipo", columnList = "tipo")
})
public class ElementoLista {
    
    public enum Tipo {
        SERIE, PELICULA
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;
    
    @Column(name = "titulo", nullable = false, length = 255)
    private String titulo;
    
    @Column(name = "imagen", length = 500, columnDefinition = "LONGTEXT")
    private String imagen;
    
    @Column(name = "genero", length = 100)
    private String genero;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "tipo", nullable = false, length = 20)
    private Tipo tipo;
    
    @Column(name = "mal_id", unique = true)
    private Integer malId;  // ID de MyAnimeList si aplica
    
    @CreationTimestamp
    @Column(name = "added_at", nullable = false, updatable = false)
    private LocalDateTime addedAt;
    
    @Column(name = "posicion")
    private Integer posicion;  // Orden en la lista
    
    // ==================== CONSTRUCTORES ====================
    
    public ElementoLista() {}
    
    public ElementoLista(Usuario usuario, String titulo, String imagen, String genero, Tipo tipo) {
        this.usuario = usuario;
        this.titulo = titulo;
        this.imagen = imagen;
        this.genero = genero;
        this.tipo = tipo;
    }
    
    // ==================== GETTERS Y SETTERS ====================
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    public Usuario getUsuario() {
        return usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public String getTitulo() {
        return titulo;
    }
    
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
    public String getImagen() {
        return imagen;
    }
    
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    public String getGenero() {
        return genero;
    }
    
    public void setGenero(String genero) {
        this.genero = genero;
    }
    
    public Tipo getTipo() {
        return tipo;
    }
    
    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }
    
    public Integer getMalId() {
        return malId;
    }
    
    public void setMalId(Integer malId) {
        this.malId = malId;
    }
    
    public LocalDateTime getAddedAt() {
        return addedAt;
    }
    
    public void setAddedAt(LocalDateTime addedAt) {
        this.addedAt = addedAt;
    }
    
    public Integer getPosicion() {
        return posicion;
    }
    
    public void setPosicion(Integer posicion) {
        this.posicion = posicion;
    }
    
    @Override
    public String toString() {
        return "ElementoLista{" +
                "id=" + id +
                ", titulo='" + titulo + '\'' +
                ", tipo=" + tipo +
                ", addedAt=" + addedAt +
                '}';
    }
}
