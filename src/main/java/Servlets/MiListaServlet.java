package Servlets;

import Modelo.ElementoLista;
import Modelo.ElementoLista.Tipo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet que gestiona "Mi Lista".
 *
 * Acciones disponibles (parametro "accion"):
 *   agregar  - agrega un elemento a la lista de la sesion
 *   eliminar - elimina un elemento por su id
 *   ver      - redirige a milista.jsp (default al hacer GET)
 */
@WebServlet(name = "MiListaServlet", urlPatterns = {"/MiLista"})
public class MiListaServlet extends HttpServlet {

    // Nombre del atributo que se guarda en sesion
    private static final String ATTR_LISTA = "miLista";

    // ── GET: mostrar la pagina ────────────────────────────────────────────────
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        inicializarLista(session);

        String tab = request.getParameter("tab");
        if (tab != null) request.setAttribute("activeTab", tab);

        request.getRequestDispatcher("/milista.jsp").forward(request, response);
    }

    // ── POST: agregar o eliminar ──────────────────────────────────────────────
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(true);
        inicializarLista(session);

        String accion = request.getParameter("accion");

        if ("agregar".equalsIgnoreCase(accion)) {
            String tipo = request.getParameter("tipo");
            agregarElemento(request, session);
            // Redirige a Mi Lista y abre la pestaña correcta
            String tab = "PELICULA".equalsIgnoreCase(tipo) ? "peliculas" : "series";
            response.sendRedirect(request.getContextPath() + "/MiLista?tab=" + tab);
            return;
        } else if ("eliminar".equalsIgnoreCase(accion)) {
            eliminarElemento(request, session);
        }

        // Redirige de vuelta a Mi Lista
        response.sendRedirect(request.getContextPath() + "/MiLista");
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    @SuppressWarnings("unchecked")
    private void inicializarLista(HttpSession session) {
        if (session.getAttribute(ATTR_LISTA) == null) {
            session.setAttribute(ATTR_LISTA, new ArrayList<ElementoLista>());
        }
    }

    @SuppressWarnings("unchecked")
    private void agregarElemento(HttpServletRequest request, HttpSession session) {
        try {
            int    id     = Integer.parseInt(request.getParameter("id"));
            String titulo = request.getParameter("titulo");
            String imagen = request.getParameter("imagen");
            String genero = request.getParameter("genero");
            Tipo   tipo   = "PELICULA".equalsIgnoreCase(request.getParameter("tipo"))
                            ? Tipo.PELICULA : Tipo.SERIE;

            List<ElementoLista> lista =
                (List<ElementoLista>) session.getAttribute(ATTR_LISTA);

            // Evitar duplicados
            boolean yaExiste = lista.stream().anyMatch(e -> e.getId() == id);
            if (!yaExiste) {
                lista.add(new ElementoLista(id, titulo, imagen, genero, tipo));
            }

        } catch (NumberFormatException e) {
            // Id invalido, ignorar
        }
    }

    @SuppressWarnings("unchecked")
    private void eliminarElemento(HttpServletRequest request, HttpSession session) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            List<ElementoLista> lista =
                (List<ElementoLista>) session.getAttribute(ATTR_LISTA);
            lista.removeIf(e -> e.getId() == id);
        } catch (NumberFormatException e) {
            // Id invalido, ignorar
        }
    }
}
