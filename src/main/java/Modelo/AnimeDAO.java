package Modelo;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * DAO en memoria para Animes.
 * Se guarda como atributo del ServletContext para que todos los servlets
 * compartan la misma lista.
 *
 * Operaciones: listar, buscar, agregar, editar, eliminar.
 */
public class AnimeDAO {

    private final List<Anime>    animes   = new ArrayList<>();
    private final AtomicInteger  contador = new AtomicInteger(1);

    /** Carga datos de ejemplo al iniciar la aplicación. */
    public AnimeDAO() {
        animes.add(new Anime(contador.getAndIncrement(),
            "Attack on Titan",
            "La humanidad vive dentro de enormes murallas para protegerse de los Titanes, seres gigantescos que devoran humanos sin razón aparente.",
            "Acción, Drama, Fantasía",
            "https://cdn.myanimelist.net/images/anime/10/47347.jpg",
            2013, 9.0, 87, Anime.Tipo.SERIE, "Finalizado"));

        animes.add(new Anime(contador.getAndIncrement(),
            "Demon Slayer",
            "Tanjiro Kamado busca la cura para su hermana convertida en demonio mientras se convierte en cazador de demonios.",
            "Acción, Aventura, Sobrenatural",
            "https://cdn.myanimelist.net/images/anime/1286/99889.jpg",
            2019, 8.7, 44, Anime.Tipo.SERIE, "En emisión"));

        animes.add(new Anime(contador.getAndIncrement(),
            "Your Name",
            "Dos adolescentes de distintas partes de Japón misteriosamente intercambian cuerpos en sueños.",
            "Romance, Fantasía, Drama",
            "https://cdn.myanimelist.net/images/anime/5/87048.jpg",
            2016, 8.9, 0, Anime.Tipo.PELICULA, "Finalizado"));

        animes.add(new Anime(contador.getAndIncrement(),
            "Naruto Shippuden",
            "Naruto Uzumaki continúa su entrenamiento para convertirse en Hokage y proteger su aldea de amenazas oscuras.",
            "Acción, Aventura, Comedia",
            "https://cdn.myanimelist.net/images/anime/1565/111305.jpg",
            2007, 8.2, 500, Anime.Tipo.SERIE, "Finalizado"));

        animes.add(new Anime(contador.getAndIncrement(),
            "Spirited Away",
            "Chihiro, una niña de 10 años, queda atrapada en un mundo espiritual y debe trabajar para liberar a sus padres.",
            "Aventura, Fantasía, Sobrenatural",
            "https://cdn.myanimelist.net/images/anime/6/79597.jpg",
            2001, 8.8, 0, Anime.Tipo.PELICULA, "Finalizado"));

        animes.add(new Anime(contador.getAndIncrement(),
            "Fullmetal Alchemist: Brotherhood",
            "Dos hermanos alquimistas buscan la Piedra Filosofal para recuperar sus cuerpos perdidos.",
            "Acción, Aventura, Fantasía",
            "https://cdn.myanimelist.net/images/anime/1223/96541.jpg",
            2009, 9.1, 64, Anime.Tipo.SERIE, "Finalizado"));

        animes.add(new Anime(contador.getAndIncrement(),
            "One Piece",
            "Monkey D. Luffy y su tripulación de piratas buscan el legendario tesoro conocido como One Piece.",
            "Acción, Aventura, Comedia",
            "https://cdn.myanimelist.net/images/anime/6/73245.jpg",
            1999, 8.7, 1000, Anime.Tipo.SERIE, "En emisión"));
    }

    // ── CRUD ─────────────────────────────────────────────────────────────────

    public synchronized List<Anime> getTodos() {
        return new ArrayList<>(animes);
    }

    public synchronized List<Anime> getPorTipo(Anime.Tipo tipo) {
        List<Anime> resultado = new ArrayList<>();
        for (Anime a : animes) {
            if (a.getTipo() == tipo) resultado.add(a);
        }
        return resultado;
    }

    public synchronized Optional<Anime> buscarPorId(int id) {
        return animes.stream().filter(a -> a.getId() == id).findFirst();
    }

    /**
     * Agrega un nuevo anime. Asigna ID automático.
     * @return el Anime con su nuevo ID asignado.
     */
    public synchronized Anime agregar(Anime anime) {
        anime.setId(contador.getAndIncrement());
        animes.add(anime);
        return anime;
    }

    /**
     * Edita un anime existente por ID.
     * @return true si encontró y actualizó, false si no existe.
     */
    public synchronized boolean editar(Anime actualizado) {
        for (int i = 0; i < animes.size(); i++) {
            if (animes.get(i).getId() == actualizado.getId()) {
                animes.set(i, actualizado);
                return true;
            }
        }
        return false;
    }

    /**
     * Elimina un anime por ID.
     * @return true si se eliminó, false si no existía.
     */
    public synchronized boolean eliminar(int id) {
        return animes.removeIf(a -> a.getId() == id);
    }

    public synchronized int contarTodos()       { return animes.size(); }
    public synchronized int contarSeries()      { return (int) animes.stream().filter(a -> a.getTipo() == Anime.Tipo.SERIE).count(); }
    public synchronized int contarPeliculas()   { return (int) animes.stream().filter(a -> a.getTipo() == Anime.Tipo.PELICULA).count(); }
}
