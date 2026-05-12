package Servlets;

import Modelo.Anime;
import Modelo.AnimeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet de administración de Animes.
 *
 * GET  /AdminAnimes              → muestra adminAnimes.jsp (lista completa)
 * GET  /AdminAnimes?accion=nuevo → muestra formulario vacío para agregar
 * GET  /AdminAnimes?accion=editar&id=X → muestra formulario cargado para editar
 * POST /AdminAnimes  (accion=agregar)  → crea un nuevo anime
 * POST /AdminAnimes  (accion=editar)   → actualiza anime existente
 * POST /AdminAnimes  (accion=eliminar) → elimina anime por id
 *
 * Solo accesible si el usuario en sesión es "admin".
 */
@WebServlet(name = "AnimeServlet", urlPatterns = {"/AdminAnimes"})
public class AnimeServlet extends HttpServlet {

    private static final String DAO_KEY = "animeDAO";

    // ── Inicialización: registrar el DAO en el contexto ───────────────────────
    @Override
    public void init() throws ServletException {
        if (getServletContext().getAttribute(DAO_KEY) == null) {
            getServletContext().setAttribute(DAO_KEY, new AnimeDAO());
        }
    }

    // ── GET ───────────────────────────────────────────────────────────────────
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!esAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        AnimeDAO dao = getDao();
        String accion = request.getParameter("accion");

        if ("editar".equalsIgnoreCase(accion)) {
            // Cargar anime para edición
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.buscarPorId(id).ifPresent(a -> request.setAttribute("animeEditar", a));
            } catch (NumberFormatException ignored) {}
            request.setAttribute("modo", "editar");
        } else if ("nuevo".equalsIgnoreCase(accion)) {
            request.setAttribute("modo", "nuevo");
        } else {
            request.setAttribute("modo", "lista");
        }

        request.setAttribute("animes", dao.getTodos());
        request.setAttribute("totalAnimes", dao.contarTodos());
        request.setAttribute("totalSeries", dao.contarSeries());
        request.setAttribute("totalPeliculas", dao.contarPeliculas());

        request.getRequestDispatcher("/adminAnimes.jsp").forward(request, response);
    }

    // ── POST ──────────────────────────────────────────────────────────────────
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!esAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        request.setCharacterEncoding("UTF-8");
        AnimeDAO dao = getDao();
        String accion = request.getParameter("accion");

        if ("agregar".equalsIgnoreCase(accion)) {
            Anime nuevo = parsearFormulario(request, 0);
            dao.agregar(nuevo);
            request.getSession().setAttribute("adminMsg", "✅ Anime \"" + nuevo.getTitulo() + "\" agregado correctamente.");

        } else if ("editar".equalsIgnoreCase(accion)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Anime actualizado = parsearFormulario(request, id);
                dao.editar(actualizado);
                request.getSession().setAttribute("adminMsg", "✏️ Anime \"" + actualizado.getTitulo() + "\" actualizado.");
            } catch (NumberFormatException ignored) {}

        } else if ("eliminar".equalsIgnoreCase(accion)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.buscarPorId(id).ifPresent(a ->
                    request.getSession().setAttribute("adminMsg", "🗑️ Anime \"" + a.getTitulo() + "\" eliminado.")
                );
                dao.eliminar(id);
            } catch (NumberFormatException ignored) {}
        }

        response.sendRedirect(request.getContextPath() + "/AdminAnimes");
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    private AnimeDAO getDao() {
        AnimeDAO dao = (AnimeDAO) getServletContext().getAttribute(DAO_KEY);
        if (dao == null) {
            dao = new AnimeDAO();
            getServletContext().setAttribute(DAO_KEY, dao);
        }
        return dao;
    }

    private boolean esAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return false;
        Object usuario = session.getAttribute("usuarioActivo");
        if (usuario instanceof Modelo.Usuario) {
            return "admin".equalsIgnoreCase(((Modelo.Usuario) usuario).getNombre());
        }
        // compatibilidad si se guarda como String
        return "admin".equalsIgnoreCase(String.valueOf(usuario));
    }

    private Anime parsearFormulario(HttpServletRequest req, int id) {
        String titulo      = trim(req.getParameter("titulo"));
        String descripcion = trim(req.getParameter("descripcion"));
        String genero      = trim(req.getParameter("genero"));
        String imagen      = trim(req.getParameter("imagen"));
        String estado      = trim(req.getParameter("estado"));
        String tipoStr     = trim(req.getParameter("tipo"));
        int anio           = parseIntSafe(req.getParameter("anio"), 2024);
        double puntuacion  = parseDoubleSafe(req.getParameter("puntuacion"), 0.0);
        int episodios      = parseIntSafe(req.getParameter("episodios"), 0);
        Anime.Tipo tipo    = "PELICULA".equalsIgnoreCase(tipoStr) ? Anime.Tipo.PELICULA : Anime.Tipo.SERIE;

        return new Anime(id, titulo, descripcion, genero, imagen, anio, puntuacion, episodios, tipo, estado);
    }

    private String trim(String s) { return s == null ? "" : s.trim(); }
    private int    parseIntSafe(String s, int def) {
        try { return Integer.parseInt(s.trim()); } catch (Exception e) { return def; }
    }
    private double parseDoubleSafe(String s, double def) {
        try { return Double.parseDouble(s.trim()); } catch (Exception e) { return def; }
    }
}
