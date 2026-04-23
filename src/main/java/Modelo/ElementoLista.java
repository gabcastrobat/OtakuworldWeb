package Modelo;

/**
 * Representa un elemento guardado en "Mi Lista" por el usuario.
 * Puede ser una Serie o una Pelicula.
 */
public class ElementoLista {

    public enum Tipo {
        SERIE, PELICULA
    }

    private int    id;
    private String titulo;
    private String imagen;   // URL o ruta de la portada
    private String genero;
    private Tipo   tipo;     // SERIE o PELICULA

    // Constructor vacio
    public ElementoLista() {}

    // Constructor completo
    public ElementoLista(int id, String titulo, String imagen, String genero, Tipo tipo) {
        this.id     = id;
        this.titulo = titulo;
        this.imagen = imagen;
        this.genero = genero;
        this.tipo   = tipo;
    }

    // Getters y Setters
    public int getId()                { return id; }
    public void setId(int id)         { this.id = id; }

    public String getTitulo()                  { return titulo; }
    public void setTitulo(String titulo)       { this.titulo = titulo; }

    public String getImagen()                  { return imagen; }
    public void setImagen(String imagen)       { this.imagen = imagen; }

    public String getGenero()                  { return genero; }
    public void setGenero(String genero)       { this.genero = genero; }

    public Tipo getTipo()              { return tipo; }
    public void setTipo(Tipo tipo)     { this.tipo = tipo; }

    @Override
    public String toString() {
        return "ElementoLista{id=" + id + ", titulo='" + titulo + "', tipo=" + tipo + "}";
    }
}
