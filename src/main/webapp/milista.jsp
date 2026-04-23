<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.ElementoLista"%>
<%@page import="Modelo.ElementoLista.Tipo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
    // Recuperar la lista de la sesion
    List<ElementoLista> lista =
        (List<ElementoLista>) session.getAttribute("miLista");
    if (lista == null) lista = new ArrayList<>();

    List<ElementoLista> series    = new ArrayList<>();
    List<ElementoLista> peliculas = new ArrayList<>();
    for (ElementoLista e : lista) {
        if (e.getTipo() == Tipo.SERIE)    series.add(e);
        else                              peliculas.add(e);
    }

    // Determinar qué pestaña abrir (viene del servlet al agregar)
    String activeTab = (String) request.getAttribute("activeTab");
    boolean openPeliculas = "peliculas".equals(activeTab);
%>
<jsp:include page="lib/header.jsp" />

<style>
    /* ââ Mi Lista ââ */
    .milista-hero {
        background: linear-gradient(135deg, var(--ow-bg) 0%, var(--ow-bg-dark) 100%);
        border-bottom: 3px solid var(--ow-orange);
        padding: 2.5rem 0 1.5rem;
        margin-bottom: 2rem;
    }
    .milista-hero h1 {
        font-family: var(--ow-font-display);
        font-size: 2rem;
        font-weight: 800;
        color: var(--ow-orange);
    }
    .milista-hero p { color: var(--ow-cream); margin-bottom: 0; }

    .milista-tabs .nav-link {
        color: #c8c8d0;
        font-weight: 600;
        border-radius: 8px 8px 0 0;
        padding: 0.55rem 1.3rem;
        border: 1px solid transparent;
        font-family: var(--ow-font-text);
    }
    .milista-tabs .nav-link.active {
        background: var(--ow-bg);
        color: var(--ow-orange);
        border-color: rgba(227,114,57,0.4) rgba(227,114,57,0.4) var(--ow-bg);
    }
    .milista-tabs .nav-link:hover:not(.active) {
        color: #fff;
        background: rgba(255,255,255,0.05);
    }
    .milista-panel {
        background: var(--ow-bg);
        border: 1px solid rgba(227,114,57,0.25);
        border-top: 3px solid var(--ow-orange);
        border-radius: 0 8px 8px 8px;
        padding: 1.5rem;
        min-height: 200px;
    }
    .milista-badge {
        background: var(--ow-orange);
        color: #0d1117;
        font-size: 0.7rem;
        font-weight: 800;
        border-radius: 20px;
        padding: 1px 8px;
        margin-left: 6px;
        vertical-align: middle;
    }
    .card-item {
        background: #1a1f2e;
        border: 1px solid rgba(255,255,255,0.08);
        border-radius: 10px;
        overflow: hidden;
        transition: transform 0.2s, border-color 0.2s;
        height: 100%;
    }
    .card-item:hover {
        transform: translateY(-4px);
        border-color: rgba(227,114,57,0.5);
    }
    .card-item img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        display: block;
    }
    .card-item .card-body {
        padding: 0.75rem 0.9rem;
    }
    .card-item .card-title {
        font-family: var(--ow-font-display);
        font-size: 0.95rem;
        font-weight: 700;
        color: var(--ow-text);
        margin-bottom: 0.2rem;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .card-item .card-genero {
        font-size: 0.78rem;
        color: var(--ow-cream);
        margin-bottom: 0.6rem;
    }
    .btn-quitar {
        width: 100%;
        background: transparent;
        border: 1px solid rgba(227,114,57,0.4);
        color: var(--ow-orange);
        border-radius: 6px;
        font-size: 0.8rem;
        font-weight: 600;
        padding: 0.3rem 0;
        transition: background 0.15s, color 0.15s;
        font-family: var(--ow-font-text);
        cursor: pointer;
    }
    .btn-quitar:hover {
        background: var(--ow-orange);
        color: #0d1117;
    }
    .lista-vacia {
        text-align: center;
        padding: 3rem 1rem;
        color: rgba(240,230,211,0.4);
    }
    .lista-vacia span {
        font-size: 3rem;
        display: block;
        margin-bottom: 0.75rem;
    }
    .lista-vacia p {
        font-size: 0.95rem;
        margin-bottom: 1rem;
    }
    .lista-vacia a {
        color: var(--ow-orange);
        font-weight: 600;
        text-decoration: none;
    }
    .lista-vacia a:hover { text-decoration: underline; }
</style>

<!-- Hero -->
<div class="milista-hero">
    <div class="container-xl px-3">
        <h1>📋 Mi Lista</h1>
        <p>Todo lo que guardaste en un solo lugar.</p>
    </div>
</div>

<div class="container-xl px-3 pb-5">

    <!-- Tabs: Series / Peliculas -->
    <ul class="nav milista-tabs mb-0" id="miListaTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class='nav-link <%= openPeliculas ? "" : "active" %>' id="tab-series-btn"
                    data-bs-toggle="tab" data-bs-target="#tab-series"
                    type="button" role="tab">
                📺 Series
                <span class="milista-badge"><%= series.size() %></span>
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class='nav-link <%= openPeliculas ? "active" : "" %>' id="tab-peliculas-btn"
                    data-bs-toggle="tab" data-bs-target="#tab-peliculas"
                    type="button" role="tab">
                🎬 Películas
                <span class="milista-badge"><%= peliculas.size() %></span>
            </button>
        </li>
    </ul>

    <div class="tab-content">

        <!-- ââ Panel Series ââ -->
        <div class='tab-pane fade <%= openPeliculas ? "" : "show active" %> milista-panel' id="tab-series" role="tabpanel">
            <% if (series.isEmpty()) { %>
                <div class="lista-vacia">
                    <span>📺</span>
                    <p>No tienes series guardadas todavia.</p>
                    <a href="series.jsp">Explorar series</a>
                </div>
            <% } else { %>
                <div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 g-3">
                    <% for (ElementoLista e : series) { %>
                    <div class="col">
                        <div class="card-item">
                            <img src="<%= e.getImagen() != null ? e.getImagen() : "images/logo.jpg" %>"
                                 alt="<%= e.getTitulo() %>">
                            <div class="card-body">
                                <div class="card-title"><%= e.getTitulo() %></div>
                                <div class="card-genero"><%= e.getGenero() != null ? e.getGenero() : "" %></div>
                                <form method="post" action="MiLista">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <input type="hidden" name="id"     value="<%= e.getId() %>">
                                    <button type="submit" class="btn-quitar">â Quitar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            <% } %>
        </div>

        <!-- ââ Panel Peliculas ââ -->
        <div class='tab-pane fade <%= openPeliculas ? "show active" : "" %> milista-panel' id="tab-peliculas" role="tabpanel">
            <% if (peliculas.isEmpty()) { %>
                <div class="lista-vacia">
                    <span>🎬</span>
                    <p>No tienes peliculas guardadas todavia.</p>
                    <a href="peliculas.jsp">Explorar peliculas</a>
                </div>
            <% } else { %>
                <div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 g-3">
                    <% for (ElementoLista e : peliculas) { %>
                    <div class="col">
                        <div class="card-item">
                            <img src="<%= e.getImagen() != null ? e.getImagen() : "images/logo.jpg" %>"
                                 alt="<%= e.getTitulo() %>">
                            <div class="card-body">
                                <div class="card-title"><%= e.getTitulo() %></div>
                                <div class="card-genero"><%= e.getGenero() != null ? e.getGenero() : "" %></div>
                                <form method="post" action="MiLista">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <input type="hidden" name="id"     value="<%= e.getId() %>">
                                    <button type="submit" class="btn-quitar">â Quitar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            <% } %>
        </div>

    </div><!-- /tab-content -->
</div>

<jsp:include page="lib/footer.jsp" />
