<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Anime"%>
<%@page import="java.util.List"%>
<%
    /* ── Seguridad: solo admin ───────────────────────── */
    Object usuarioSesion = session.getAttribute("usuarioActivo");
    boolean esAdmin = false;
    if (usuarioSesion instanceof Modelo.Usuario) {
        esAdmin = "admin".equalsIgnoreCase(((Modelo.Usuario) usuarioSesion).getNombre());
    } else if (usuarioSesion instanceof String) {
        esAdmin = "admin".equalsIgnoreCase((String) usuarioSesion);
    }
    if (!esAdmin) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }

    /* ── Datos del request ──────────────────────────── */
    String modo            = (String)  request.getAttribute("modo");           // lista | nuevo | editar
    Anime  animeEditar     = (Anime)   request.getAttribute("animeEditar");
    List<Anime> animes     = (List<Anime>) request.getAttribute("animes");
    int totalAnimes        = request.getAttribute("totalAnimes")    != null ? (int) request.getAttribute("totalAnimes")    : 0;
    int totalSeries        = request.getAttribute("totalSeries")    != null ? (int) request.getAttribute("totalSeries")    : 0;
    int totalPeliculas     = request.getAttribute("totalPeliculas") != null ? (int) request.getAttribute("totalPeliculas") : 0;

    /* ── Mensaje flash ──────────────────────────────── */
    String adminMsg = (String) session.getAttribute("adminMsg");
    if (adminMsg != null) session.removeAttribute("adminMsg");

    if (modo == null) modo = "lista";
%>
<%@include file="lib/header.jsp"%>

<style>
/* ── Admin Panel Styles ─────────────────────────────── */
.admin-wrap {
    display: flex;
    gap: 0;
    min-height: calc(100vh - 120px);
    margin: -1.5rem -1rem 0;
}

/* Sidebar */
.admin-sidebar {
    width: 220px;
    min-width: 220px;
    background: #0d1117;
    border-right: 2px solid rgba(227,114,57,0.25);
    padding: 1.5rem 0;
    flex-shrink: 0;
}
.admin-sidebar-title {
    font-family: var(--ow-font-display);
    font-size: 0.72rem;
    font-weight: 800;
    letter-spacing: 0.12em;
    color: rgba(200,200,208,0.4);
    text-transform: uppercase;
    padding: 0 1.2rem 0.6rem;
}
.admin-nav-link {
    display: flex;
    align-items: center;
    gap: 0.65rem;
    padding: 0.6rem 1.2rem;
    color: #c8c8d0;
    font-size: 0.9rem;
    font-weight: 600;
    text-decoration: none;
    transition: background 0.15s, color 0.15s;
    border-left: 3px solid transparent;
}
.admin-nav-link:hover { background: rgba(227,114,57,0.08); color: #fff; }
.admin-nav-link.active { background: rgba(227,114,57,0.12); color: var(--ow-orange); border-left-color: var(--ow-orange); }
.admin-nav-link .icon { font-size: 1rem; width: 20px; text-align: center; }
.admin-sidebar-divider { border: none; border-top: 1px solid rgba(227,114,57,0.15); margin: 0.6rem 1rem; }

/* Main content */
.admin-content {
    flex: 1;
    padding: 1.8rem 2rem;
    overflow-x: hidden;
}
.admin-page-title {
    font-family: var(--ow-font-display);
    font-size: 1.6rem;
    font-weight: 800;
    color: #fff;
    margin-bottom: 0.25rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}
.admin-breadcrumb {
    font-size: 0.82rem;
    color: rgba(200,200,208,0.5);
    margin-bottom: 1.5rem;
}
.admin-breadcrumb a { color: var(--ow-orange); text-decoration: none; }
.admin-breadcrumb a:hover { text-decoration: underline; }

/* Stats cards */
.stats-row {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1rem;
    margin-bottom: 1.8rem;
}
.stat-card {
    background: linear-gradient(135deg, #1a1f2e 0%, #141824 100%);
    border: 1px solid rgba(227,114,57,0.2);
    border-radius: 12px;
    padding: 1.2rem 1.4rem;
    display: flex;
    align-items: center;
    gap: 1rem;
    transition: border-color 0.2s, transform 0.2s;
}
.stat-card:hover { border-color: var(--ow-orange); transform: translateY(-2px); }
.stat-icon {
    width: 48px; height: 48px;
    border-radius: 10px;
    display: flex; align-items: center; justify-content: center;
    font-size: 1.4rem;
    flex-shrink: 0;
}
.stat-icon.orange { background: rgba(227,114,57,0.18); }
.stat-icon.teal   { background: rgba(20,184,166,0.18); }
.stat-icon.purple { background: rgba(139,92,246,0.18); }
.stat-info {}
.stat-num {
    font-family: var(--ow-font-display);
    font-size: 1.8rem;
    font-weight: 800;
    color: #fff;
    line-height: 1;
}
.stat-label {
    font-size: 0.78rem;
    color: rgba(200,200,208,0.55);
    font-weight: 600;
    margin-top: 2px;
}

/* Table card */
.admin-card {
    background: #141824;
    border: 1px solid rgba(227,114,57,0.18);
    border-radius: 14px;
    overflow: hidden;
}
.admin-card-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 1.1rem 1.4rem;
    border-bottom: 1px solid rgba(227,114,57,0.15);
    background: rgba(0,0,0,0.2);
}
.admin-card-title {
    font-family: var(--ow-font-display);
    font-size: 1rem;
    font-weight: 700;
    color: #fff;
}
.btn-ow-add {
    background: var(--ow-orange);
    color: #0d1117;
    border: none;
    border-radius: 8px;
    font-weight: 700;
    font-size: 0.875rem;
    padding: 0.4rem 1rem;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 0.4rem;
    transition: background 0.18s;
    cursor: pointer;
}
.btn-ow-add:hover { background: var(--ow-peach); color: #0d1117; }

/* Anime table */
.anime-table { width: 100%; border-collapse: collapse; }
.anime-table th {
    font-size: 0.72rem;
    font-weight: 800;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    color: rgba(200,200,208,0.45);
    padding: 0.75rem 1.2rem;
    text-align: left;
    background: rgba(0,0,0,0.15);
    border-bottom: 1px solid rgba(255,255,255,0.05);
}
.anime-table td {
    padding: 0.85rem 1.2rem;
    border-bottom: 1px solid rgba(255,255,255,0.04);
    color: #c8c8d0;
    font-size: 0.88rem;
    vertical-align: middle;
}
.anime-table tr:last-child td { border-bottom: none; }
.anime-table tr:hover td { background: rgba(227,114,57,0.04); }
.anime-thumb {
    width: 44px;
    height: 60px;
    object-fit: cover;
    border-radius: 6px;
    border: 1px solid rgba(255,255,255,0.1);
}
.anime-thumb-placeholder {
    width: 44px;
    height: 60px;
    border-radius: 6px;
    background: rgba(255,255,255,0.07);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
}
.anime-title-cell { font-weight: 700; color: #fff; font-size: 0.92rem; }
.anime-title-cell small { display:block; color: rgba(200,200,208,0.5); font-weight:400; font-size:0.78rem; margin-top:1px; }
.badge-tipo {
    display: inline-block;
    font-size: 0.68rem;
    font-weight: 800;
    letter-spacing: 0.06em;
    text-transform: uppercase;
    padding: 2px 8px;
    border-radius: 20px;
}
.badge-serie    { background: rgba(20,184,166,0.2); color: #14b8a6; border: 1px solid rgba(20,184,166,0.4); }
.badge-pelicula { background: rgba(139,92,246,0.2); color: #a78bfa; border: 1px solid rgba(139,92,246,0.4); }
.badge-estado {
    display: inline-block;
    font-size: 0.68rem;
    font-weight: 700;
    padding: 2px 8px;
    border-radius: 20px;
}
.badge-emision  { background: rgba(34,197,94,0.15); color: #4ade80; border: 1px solid rgba(34,197,94,0.35); }
.badge-finalizado { background: rgba(100,116,139,0.2); color: #94a3b8; border: 1px solid rgba(100,116,139,0.3); }
.score-badge {
    display: inline-flex; align-items: center; gap: 3px;
    color: var(--ow-peach); font-weight: 700; font-size: 0.85rem;
}
.action-btns { display: flex; gap: 0.4rem; flex-wrap: nowrap; }
.btn-edit {
    background: rgba(227,114,57,0.15);
    color: var(--ow-orange);
    border: 1px solid rgba(227,114,57,0.35);
    border-radius: 6px;
    font-size: 0.78rem;
    font-weight: 700;
    padding: 0.28rem 0.7rem;
    text-decoration: none;
    transition: background 0.15s;
    white-space: nowrap;
}
.btn-edit:hover { background: rgba(227,114,57,0.28); color: #fff; }
.btn-delete {
    background: rgba(239,68,68,0.12);
    color: #f87171;
    border: 1px solid rgba(239,68,68,0.3);
    border-radius: 6px;
    font-size: 0.78rem;
    font-weight: 700;
    padding: 0.28rem 0.7rem;
    cursor: pointer;
    transition: background 0.15s;
    white-space: nowrap;
}
.btn-delete:hover { background: rgba(239,68,68,0.25); color: #fff; }

/* Form panel */
.form-card {
    background: #141824;
    border: 1px solid rgba(227,114,57,0.25);
    border-top: 3px solid var(--ow-orange);
    border-radius: 14px;
    padding: 1.8rem 2rem;
    max-width: 720px;
}
.form-card .form-label { color: #e2e8f0; font-weight: 600; font-size: 0.875rem; margin-bottom: 0.35rem; }
.form-card .form-control,
.form-card .form-select {
    background: #0d1117;
    border: 1px solid rgba(227,114,57,0.3);
    color: #e2e8f0;
    border-radius: 8px;
    font-size: 0.9rem;
    transition: border-color 0.18s, box-shadow 0.18s;
}
.form-card .form-control::placeholder { color: rgba(200,200,208,0.3); }
.form-card .form-control:focus,
.form-card .form-select:focus {
    border-color: var(--ow-orange);
    box-shadow: 0 0 0 3px rgba(227,114,57,0.18);
    background: #0d1117;
    color: #fff;
}
.form-card .form-select option { background: #1a1f2e; }
.form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; }
.form-grid .full { grid-column: 1 / -1; }
.form-section-title {
    font-family: var(--ow-font-display);
    font-size: 0.75rem;
    font-weight: 800;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    color: var(--ow-orange);
    margin: 1.4rem 0 0.8rem;
    padding-bottom: 0.4rem;
    border-bottom: 1px solid rgba(227,114,57,0.2);
}
.btn-cancel {
    background: transparent;
    color: #c8c8d0;
    border: 1px solid rgba(200,200,208,0.25);
    border-radius: 8px;
    font-weight: 600;
    font-size: 0.9rem;
    padding: 0.45rem 1.1rem;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 0.4rem;
    transition: border-color 0.18s, color 0.18s;
}
.btn-cancel:hover { border-color: #fff; color: #fff; }

/* Flash message */
.admin-flash {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    background: rgba(34,197,94,0.1);
    border: 1px solid rgba(34,197,94,0.35);
    color: #86efac;
    border-radius: 10px;
    padding: 0.7rem 1.1rem;
    font-size: 0.9rem;
    font-weight: 600;
    margin-bottom: 1.4rem;
    animation: fadeIn 0.35s ease;
}
@keyframes fadeIn { from { opacity:0; transform:translateY(-6px); } to { opacity:1; transform:none; } }

/* Empty state */
.empty-state { text-align:center; padding: 3rem 1rem; color: rgba(200,200,208,0.45); }
.empty-state .empty-icon { font-size: 3rem; margin-bottom: 0.75rem; }
.empty-state p { font-size: 0.95rem; }

/* Image preview */
#imgPreview {
    width: 80px; height: 110px;
    object-fit: cover;
    border-radius: 8px;
    border: 2px solid rgba(227,114,57,0.4);
    display: none;
    margin-top: 0.5rem;
}

/* Search filter */
.search-filter {
    display: flex; align-items: center; gap: 0.6rem;
}
.search-filter input {
    background: rgba(255,255,255,0.06);
    border: 1px solid rgba(255,255,255,0.12);
    color: #fff;
    border-radius: 8px;
    padding: 0.35rem 0.8rem;
    font-size: 0.875rem;
    outline: none;
    width: 200px;
    transition: border-color 0.18s;
}
.search-filter input:focus { border-color: var(--ow-orange); }
.filter-btn {
    background: rgba(255,255,255,0.06);
    border: 1px solid rgba(255,255,255,0.12);
    color: #c8c8d0;
    border-radius: 8px;
    padding: 0.35rem 0.75rem;
    font-size: 0.8rem;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.15s, color 0.15s, border-color 0.15s;
}
.filter-btn:hover, .filter-btn.active { background: rgba(227,114,57,0.15); border-color: var(--ow-orange); color: var(--ow-orange); }
</style>

<div class="admin-wrap">

    <!-- ── Sidebar ─────────────────────────────────── -->
    <aside class="admin-sidebar">
        <div class="admin-sidebar-title">Panel Admin</div>
        <a class="admin-nav-link active" href="AdminAnimes">
            <span class="icon">🎌</span> Animes
        </a>
        <hr class="admin-sidebar-divider">
        <div class="admin-sidebar-title" style="margin-top:0.5rem;">Estadísticas</div>
        <a class="admin-nav-link" href="AdminAnimes">
            <span class="icon">📊</span> Resumen
        </a>
        <hr class="admin-sidebar-divider">
        <a class="admin-nav-link" href="index.jsp">
            <span class="icon">🏠</span> Volver al Sitio
        </a>
    </aside>

    <!-- ── Main Content ────────────────────────────── -->
    <main class="admin-content">

        <%-- Flash message --%>
        <% if (adminMsg != null && !adminMsg.isEmpty()) { %>
        <div class="admin-flash">
            <span>✅</span>
            <%= adminMsg %>
        </div>
        <% } %>

        <%-- ═══ MODO LISTA ═══ --%>
        <% if ("lista".equals(modo)) { %>

        <div class="admin-page-title">🎌 Gestión de Animes</div>
        <div class="admin-breadcrumb">
            <a href="index.jsp">OtakuWorld</a> › Panel Admin › Animes
        </div>

        <!-- Estadísticas rápidas -->
        <div class="stats-row">
            <div class="stat-card">
                <div class="stat-icon orange">🎌</div>
                <div class="stat-info">
                    <div class="stat-num"><%= totalAnimes %></div>
                    <div class="stat-label">Total Animes</div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon teal">📺</div>
                <div class="stat-info">
                    <div class="stat-num"><%= totalSeries %></div>
                    <div class="stat-label">Series</div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon purple">🎬</div>
                <div class="stat-info">
                    <div class="stat-num"><%= totalPeliculas %></div>
                    <div class="stat-label">Películas</div>
                </div>
            </div>
        </div>

        <!-- Tabla de animes -->
        <div class="admin-card">
            <div class="admin-card-header">
                <div>
                    <div class="admin-card-title">📋 Catálogo de Animes</div>
                </div>
                <div style="display:flex;align-items:center;gap:0.75rem;">
                    <div class="search-filter">
                        <input type="text" id="searchInput" placeholder="🔍 Buscar anime…" oninput="filtrarTabla()">
                        <button class="filter-btn active" onclick="filtrarPor('todos', this)">Todos</button>
                        <button class="filter-btn" onclick="filtrarPor('SERIE', this)">Series</button>
                        <button class="filter-btn" onclick="filtrarPor('PELICULA', this)">Películas</button>
                    </div>
                    <a href="AdminAnimes?accion=nuevo" class="btn-ow-add">+ Agregar Anime</a>
                </div>
            </div>

            <% if (animes == null || animes.isEmpty()) { %>
            <div class="empty-state">
                <div class="empty-icon">🎌</div>
                <p>No hay animes en el catálogo aún.</p>
                <a href="AdminAnimes?accion=nuevo" class="btn-ow-add" style="margin-top:0.75rem;display:inline-flex;">+ Agregar el primero</a>
            </div>
            <% } else { %>
            <table class="anime-table" id="animeTable">
                <thead>
                    <tr>
                        <th>Portada</th>
                        <th>Título</th>
                        <th>Tipo</th>
                        <th>Género</th>
                        <th>Año</th>
                        <th>⭐ Score</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <% for (Anime a : animes) { %>
                <tr data-tipo="<%= a.getTipo().name() %>" data-titulo="<%= a.getTitulo().toLowerCase() %>">
                    <td>
                        <% if (a.getImagen() != null && !a.getImagen().isEmpty()) { %>
                        <img src="<%= a.getImagen() %>" alt="<%= a.getTitulo() %>" class="anime-thumb"
                             onerror="this.style.display='none';this.nextElementSibling.style.display='flex'">
                        <div class="anime-thumb-placeholder" style="display:none;">🎌</div>
                        <% } else { %>
                        <div class="anime-thumb-placeholder">🎌</div>
                        <% } %>
                    </td>
                    <td>
                        <div class="anime-title-cell">
                            <%= a.getTitulo() %>
                            <small><%= a.getEpisodios() > 0 ? a.getEpisodios() + " eps" : "Película" %></small>
                        </div>
                    </td>
                    <td>
                        <% if (a.getTipo() == Anime.Tipo.SERIE) { %>
                        <span class="badge-tipo badge-serie">Serie</span>
                        <% } else { %>
                        <span class="badge-tipo badge-pelicula">Película</span>
                        <% } %>
                    </td>
                    <td><%= a.getGenero() != null ? a.getGenero() : "—" %></td>
                    <td><%= a.getAnio() > 0 ? a.getAnio() : "—" %></td>
                    <td>
                        <span class="score-badge">⭐ <%= String.format("%.1f", a.getPuntuacion()) %></span>
                    </td>
                    <td>
                        <% if ("En emisión".equalsIgnoreCase(a.getEstado())) { %>
                        <span class="badge-estado badge-emision">En emisión</span>
                        <% } else { %>
                        <span class="badge-estado badge-finalizado"><%= a.getEstado() != null ? a.getEstado() : "—" %></span>
                        <% } %>
                    </td>
                    <td>
                        <div class="action-btns">
                            <a href="AdminAnimes?accion=editar&id=<%= a.getId() %>" class="btn-edit">✏️ Editar</a>
                            <form method="post" action="AdminAnimes" style="display:inline;" onsubmit="return confirm('¿Eliminar \"<%= a.getTitulo().replace("'","\'") %>\"? Esta acción no se puede deshacer.')">
                                <input type="hidden" name="accion" value="eliminar">
                                <input type="hidden" name="id" value="<%= a.getId() %>">
                                <button type="submit" class="btn-delete">🗑️ Eliminar</button>
                            </form>
                        </div>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <% } %>
        </div>

        <%-- ═══ MODO NUEVO ═══ --%>
        <% } else if ("nuevo".equals(modo)) { %>

        <div class="admin-page-title">➕ Agregar Anime</div>
        <div class="admin-breadcrumb">
            <a href="index.jsp">OtakuWorld</a> › <a href="AdminAnimes">Panel Admin</a> › Agregar Anime
        </div>

        <div class="form-card">
            <form method="post" action="AdminAnimes">
                <input type="hidden" name="accion" value="agregar">

                <div class="form-section-title">Información Principal</div>
                <div class="form-grid">
                    <div class="full">
                        <label class="form-label">Título *</label>
                        <input type="text" name="titulo" class="form-control" placeholder="Ej: Attack on Titan" required>
                    </div>
                    <div class="full">
                        <label class="form-label">Descripción</label>
                        <textarea name="descripcion" class="form-control" rows="3"
                                  placeholder="Sinopsis del anime…"></textarea>
                    </div>
                    <div>
                        <label class="form-label">Tipo *</label>
                        <select name="tipo" class="form-select" required>
                            <option value="SERIE">📺 Serie</option>
                            <option value="PELICULA">🎬 Película</option>
                        </select>
                    </div>
                    <div>
                        <label class="form-label">Estado</label>
                        <select name="estado" class="form-select">
                            <option value="En emisión">🟢 En emisión</option>
                            <option value="Finalizado">⚫ Finalizado</option>
                            <option value="Anunciado">🔵 Anunciado</option>
                            <option value="Pausado">🟡 Pausado</option>
                        </select>
                    </div>
                    <div>
                        <label class="form-label">Género</label>
                        <input type="text" name="genero" class="form-control" placeholder="Acción, Drama, Fantasía…">
                    </div>
                    <div>
                        <label class="form-label">Año de lanzamiento</label>
                        <input type="number" name="anio" class="form-control" placeholder="2024" min="1960" max="2030">
                    </div>
                    <div>
                        <label class="form-label">Puntuación (0–10)</label>
                        <input type="number" name="puntuacion" class="form-control" placeholder="8.5" min="0" max="10" step="0.1">
                    </div>
                    <div>
                        <label class="form-label">Episodios <small style="opacity:.55">(0 si es película)</small></label>
                        <input type="number" name="episodios" class="form-control" placeholder="24" min="0">
                    </div>
                </div>

                <div class="form-section-title">Imagen de Portada</div>
                <div>
                    <label class="form-label">URL de imagen</label>
                    <input type="url" name="imagen" id="imgUrlInput" class="form-control"
                           placeholder="https://ejemplo.com/portada.jpg"
                           oninput="previewImg(this.value)">
                    <img id="imgPreview" src="" alt="Vista previa">
                </div>

                <div style="display:flex;gap:0.75rem;margin-top:1.8rem;align-items:center;">
                    <button type="submit" class="btn-ow-add" style="padding:0.5rem 1.4rem;font-size:0.95rem;">
                        ✅ Guardar Anime
                    </button>
                    <a href="AdminAnimes" class="btn-cancel">✕ Cancelar</a>
                </div>
            </form>
        </div>

        <%-- ═══ MODO EDITAR ═══ --%>
        <% } else if ("editar".equals(modo)) { %>

        <div class="admin-page-title">✏️ Editar Anime</div>
        <div class="admin-breadcrumb">
            <a href="index.jsp">OtakuWorld</a> › <a href="AdminAnimes">Panel Admin</a> › Editar Anime
        </div>

        <% if (animeEditar == null) { %>
        <div class="admin-flash" style="background:rgba(239,68,68,0.12);border-color:rgba(239,68,68,0.4);color:#f87171;">
            ⚠️ No se encontró el anime solicitado.
        </div>
        <a href="AdminAnimes" class="btn-cancel">← Volver a la lista</a>
        <% } else { %>
        <div class="form-card">
            <form method="post" action="AdminAnimes">
                <input type="hidden" name="accion" value="editar">
                <input type="hidden" name="id" value="<%= animeEditar.getId() %>">

                <div class="form-section-title">Información Principal</div>
                <div class="form-grid">
                    <div class="full">
                        <label class="form-label">Título *</label>
                        <input type="text" name="titulo" class="form-control"
                               value="<%= animeEditar.getTitulo() %>" required>
                    </div>
                    <div class="full">
                        <label class="form-label">Descripción</label>
                        <textarea name="descripcion" class="form-control" rows="3"><%= animeEditar.getDescripcion() != null ? animeEditar.getDescripcion() : "" %></textarea>
                    </div>
                    <div>
                        <label class="form-label">Tipo *</label>
                        <select name="tipo" class="form-select" required>
                            <option value="SERIE"    <%= animeEditar.getTipo() == Anime.Tipo.SERIE ? "selected" : "" %>>📺 Serie</option>
                            <option value="PELICULA" <%= animeEditar.getTipo() == Anime.Tipo.PELICULA ? "selected" : "" %>>🎬 Película</option>
                        </select>
                    </div>
                    <div>
                        <label class="form-label">Estado</label>
                        <select name="estado" class="form-select">
                            <option value="En emisión"  <%= "En emisión".equals(animeEditar.getEstado()) ? "selected" : "" %>>🟢 En emisión</option>
                            <option value="Finalizado"  <%= "Finalizado".equals(animeEditar.getEstado()) ? "selected" : "" %>>⚫ Finalizado</option>
                            <option value="Anunciado"   <%= "Anunciado".equals(animeEditar.getEstado()) ? "selected" : "" %>>🔵 Anunciado</option>
                            <option value="Pausado"     <%= "Pausado".equals(animeEditar.getEstado()) ? "selected" : "" %>>🟡 Pausado</option>
                        </select>
                    </div>
                    <div>
                        <label class="form-label">Género</label>
                        <input type="text" name="genero" class="form-control"
                               value="<%= animeEditar.getGenero() != null ? animeEditar.getGenero() : "" %>">
                    </div>
                    <div>
                        <label class="form-label">Año de lanzamiento</label>
                        <input type="number" name="anio" class="form-control"
                               value="<%= animeEditar.getAnio() %>" min="1960" max="2030">
                    </div>
                    <div>
                        <label class="form-label">Puntuación (0–10)</label>
                        <input type="number" name="puntuacion" class="form-control"
                               value="<%= animeEditar.getPuntuacion() %>" min="0" max="10" step="0.1">
                    </div>
                    <div>
                        <label class="form-label">Episodios <small style="opacity:.55">(0 si es película)</small></label>
                        <input type="number" name="episodios" class="form-control"
                               value="<%= animeEditar.getEpisodios() %>" min="0">
                    </div>
                </div>

                <div class="form-section-title">Imagen de Portada</div>
                <div>
                    <label class="form-label">URL de imagen</label>
                    <input type="url" name="imagen" id="imgUrlInput" class="form-control"
                           value="<%= animeEditar.getImagen() != null ? animeEditar.getImagen() : "" %>"
                           oninput="previewImg(this.value)">
                    <img id="imgPreview"
                         src="<%= animeEditar.getImagen() != null ? animeEditar.getImagen() : "" %>"
                         alt="Vista previa"
                         style="<%= animeEditar.getImagen() != null && !animeEditar.getImagen().isEmpty() ? "display:block;" : "" %>">
                </div>

                <div style="display:flex;gap:0.75rem;margin-top:1.8rem;align-items:center;">
                    <button type="submit" class="btn-ow-add" style="padding:0.5rem 1.4rem;font-size:0.95rem;">
                        💾 Guardar Cambios
                    </button>
                    <a href="AdminAnimes" class="btn-cancel">✕ Cancelar</a>
                </div>
            </form>
        </div>
        <% } %>

        <% } %>
    </main>
</div>

<script>
/* ── Image preview ───────────────────────────────── */
function previewImg(url) {
    const img = document.getElementById('imgPreview');
    if (url && url.trim()) {
        img.src = url.trim();
        img.style.display = 'block';
        img.onerror = () => { img.style.display = 'none'; };
    } else {
        img.style.display = 'none';
    }
}

/* ── Table filter ────────────────────────────────── */
let filtroActivo = 'todos';

function filtrarTabla() {
    const q = document.getElementById('searchInput')?.value.toLowerCase() || '';
    const rows = document.querySelectorAll('#animeTable tbody tr');
    rows.forEach(row => {
        const titulo = row.dataset.titulo || '';
        const tipo   = row.dataset.tipo   || '';
        const matchQ = titulo.includes(q);
        const matchT = filtroActivo === 'todos' || tipo === filtroActivo;
        row.style.display = matchQ && matchT ? '' : 'none';
    });
}

function filtrarPor(tipo, btn) {
    filtroActivo = tipo;
    document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    filtrarTabla();
}
</script>

</div><%-- cierra container-xl ow-main --%>
<%@include file="lib/footer.jsp"%>
