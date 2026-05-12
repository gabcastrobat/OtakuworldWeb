package Modelo;

/**
 * Representa un anime (serie o película) en OtakuWorld.
 * Se almacena en el AnimeDAO compartido en el contexto de la aplicación.
 */
public class Anime {

    public enum Tipo {
        SERIE, PELICULA
    }

    private int    id;
    private String titulo;
    private String descripcion;
    private String genero;
    private String imagen;       // URL de portada
    private int    anio;         // Año de lanzamiento
    private double puntuacion;   // 0.0 – 10.0
    private int    episodios;    // 0 si es película
    private Tipo   tipo;
    private String estado;       // "En emisión", "Finalizado", etc.

    // Constructor vacío
    public Anime() {}

    // Constructor completo
    public Anime(int id, String titulo, String descripcion, String genero,
                 String imagen, int anio, double puntuacion, int episodios,
                 Tipo tipo, String estado) {
        this.id          = id;
        this.titulo      = titulo;
        this.descripcion = descripcion;
        this.genero      = genero;
        this.imagen      = imagen;
        this.anio        = anio;
        this.puntuacion  = puntuacion;
        this.episodios   = episodios;
        this.tipo        = tipo;
        this.estado      = estado;
    }

    // ── Getters y Setters ────────────────────────────────────────────────────

    public int getId()                         { return id; }
    public void setId(int id)                  { this.id = id; }

    public String getTitulo()                  { return titulo; }
    public void setTitulo(String titulo)       { this.titulo = titulo; }

    public String getDescripcion()             { return descripcion; }
    public void setDescripcion(String d)       { this.descripcion = d; }

    public String getGenero()                  { return genero; }
    public void setGenero(String genero)       { this.genero = genero; }

    public String getImagen()                  { return imagen; }
    public void setImagen(String imagen)       { this.imagen = imagen; }

    public int getAnio()                       { return anio; }
    public void setAnio(int anio)              { this.anio = anio; }

    public double getPuntuacion()              { return puntuacion; }
    public void setPuntuacion(double p)        { this.puntuacion = p; }

    public int getEpisodios()                  { return episodios; }
    public void setEpisodios(int e)            { this.episodios = e; }

    public Tipo getTipo()                      { return tipo; }
    public void setTipo(Tipo tipo)             { this.tipo = tipo; }

    public String getEstado()                  { return estado; }
    public void setEstado(String estado)       { this.estado = estado; }

    @Override
    public String toString() {
        return "Anime{id=" + id + ", titulo='" + titulo + "', tipo=" + tipo + "}";
    }
}
