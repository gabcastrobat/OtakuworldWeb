<%@include file="/lib/header.jsp" %>
<!-- Formularios -->

<style>
/* INDEX.JSP  Estilo streaming
   Paleta del proyecto Java:
     bg #254252 | bg-dark #171c2d | orange #e37239
     peach #f9982f | cream #eab56f
*/

/*  Hero Carousel ── */
.hero-carousel { border-radius: 14px; overflow: hidden; margin-bottom: 2.5rem; position: relative; }
.hero-carousel .carousel-item { height: 420px; position: relative; }
.hero-bg {
    position: absolute; inset: 0;
}
.hero-bg .hero-cover {
    position: absolute; inset: 0;
    width: 100%; height: 100%;
    object-fit: cover;
    z-index: 0;
}
.hero-overlay {
    position: absolute; inset: 0;
    background: linear-gradient(90deg, rgba(23,28,45,0.92) 0%, rgba(23,28,45,0.3) 60%, transparent 100%);
    z-index: 1;
}
.hero-content {
    position: absolute; bottom: 0; left: 0; padding: 2.5rem;
    z-index: 2; max-width: 520px;
    pointer-events: auto;
}
.hero-badge {
    display: inline-block;
    background: var(--ow-orange);
    color: var(--ow-bg-dark);
    font-size: 0.7rem; font-weight: 700;
    padding: 2px 10px; border-radius: 12px;
    letter-spacing: 1px; margin-bottom: 0.6rem;
}
.hero-title {
    font-family: 'Rajdhani', sans-serif;
    font-size: 2.4rem; font-weight: 700;
    color: #fff; line-height: 1.1;
    margin-bottom: 0.5rem;
}
.hero-meta { color: var(--ow-cream); font-size: 0.88rem; margin-bottom: 1rem; }
.hero-desc { color: rgba(240,230,211,0.8); font-size: 0.9rem; margin-bottom: 1.2rem; }

.btn-hero-primary {
    background: var(--ow-orange); color: var(--ow-bg-dark);
    border: none; border-radius: 8px; font-weight: 700;
    padding: 0.55rem 1.4rem; font-size: 0.95rem;
    margin-right: 0.6rem; transition: background 0.2s;
}
.btn-hero-primary:hover { background: var(--ow-peach); }
.btn-hero-sec {
    background: rgba(255,255,255,0.12); color: #fff;
    border: 1px solid rgba(255,255,255,0.3); border-radius: 8px;
    font-weight: 600; padding: 0.55rem 1.2rem; font-size: 0.9rem;
    transition: background 0.2s;
}
.btn-hero-sec:hover { background: rgba(255,255,255,0.22); }

.carousel-control-prev-icon,
.carousel-control-next-icon { filter: drop-shadow(0 0 3px rgba(0,0,0,0.8)); }
.hero-carousel .carousel-control-prev,
.hero-carousel .carousel-control-next,
.hero-carousel .carousel-indicators { z-index: 3; }

/* ── Section titles ── */
.section-title {
    font-family: 'Rajdhani', sans-serif;
    font-size: 1.3rem; font-weight: 700;
    color: var(--ow-orange);
    border-left: 3px solid var(--ow-peach);
    padding-left: 0.7rem;
    margin-bottom: 1.2rem;
}
.section-sub { font-size: 0.8rem; color: var(--ow-cream); font-weight: 400; margin-left: 0.5rem; }

/* ── Cards — Opción #2 "Card con badge" ── */
.ow-card {
    background: var(--ow-bg);
    border: 1px solid rgba(227,114,57,0.2);
    border-radius: 12px;
    overflow: hidden;
    transition: transform 0.25s, box-shadow 0.25s, border-color 0.25s;
    cursor: pointer;
    height: 100%;
}
.ow-card:hover {
    transform: translateY(-6px) scale(1.02);
    box-shadow: 0 12px 30px rgba(0,0,0,0.5);
    border-color: var(--ow-orange);
}
.ow-card-img {
    height: 160px;
    position: relative;
    overflow: hidden;
}
.ow-card-img .ow-cover {
    position: absolute; inset: 0;
    width: 100%; height: 100%;
    object-fit: cover;
    z-index: 0;
}
.ow-card-badge {
    position: absolute; top: 8px; left: 8px;
    font-size: 0.65rem; font-weight: 700; letter-spacing: 0.5px;
    padding: 2px 8px; border-radius: 10px;
    z-index: 1;
}
.badge-nuevo { background: var(--ow-orange); color: var(--ow-bg-dark); }
.badge-popular { background: #c0392b; color: #fff; }
.badge-clasico { background: #2c3e50; color: var(--ow-cream); border: 1px solid var(--ow-cream); }

.ow-card-body { padding: 0.8rem 0.9rem 1rem; }
.ow-card-title {
    font-family: 'Rajdhani', sans-serif;
    font-size: 1rem; font-weight: 700;
    color: var(--ow-cream); margin-bottom: 0.2rem;
    white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
}
.ow-card-meta { font-size: 0.78rem; color: rgba(234,181,111,0.6); margin-bottom: 0.5rem; }
.ow-genre-tag {
    display: inline-block; font-size: 0.68rem;
    background: rgba(227,114,57,0.15);
    border: 1px solid rgba(227,114,57,0.3);
    color: var(--ow-peach);
    border-radius: 8px; padding: 1px 8px; margin: 1px;
}
.ow-card-footer-btn {
    display: block; margin-top: 0.7rem;
    background: transparent;
    border: 1px solid var(--ow-orange);
    color: var(--ow-orange);
    border-radius: 6px; font-size: 0.82rem; font-weight: 600;
    padding: 0.3rem 0; text-align: center;
    transition: all 0.2s; text-decoration: none;
}
.ow-card-footer-btn:hover {
    background: var(--ow-orange);
    color: var(--ow-bg-dark);
}

/* ── Planes — estilo streaming ── */
.planes-row { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1rem; }
.plan-card {
    background: var(--ow-bg);
    border: 1px solid rgba(227,114,57,0.25);
    border-radius: 14px; padding: 1.5rem 1.2rem;
    text-align: center; transition: all 0.25s;
    position: relative; overflow: hidden;
}
.plan-card:hover { transform: translateY(-4px); border-color: var(--ow-orange); box-shadow: 0 8px 24px rgba(0,0,0,0.4); }
.plan-card.featured { border: 2px solid var(--ow-orange); }
.plan-recommended {
    position: absolute; top: 12px; right: -22px;
    background: var(--ow-orange); color: var(--ow-bg-dark);
    font-size: 0.65rem; font-weight: 700; padding: 2px 30px;
    transform: rotate(35deg); letter-spacing: 0.5px;
}
.plan-name { font-family: 'Rajdhani', sans-serif; font-size: 1.3rem; font-weight: 700; color: var(--ow-cream); margin-bottom: 0.4rem; }
.plan-price { font-size: 1.6rem; font-weight: 700; color: var(--ow-orange); margin-bottom: 0.3rem; }
.plan-price span { font-size: 0.8rem; color: var(--ow-cream); font-weight: 400; }
.plan-desc { font-size: 0.82rem; color: rgba(234,181,111,0.7); margin-bottom: 0.4rem; }
.plan-screens { font-size: 0.8rem; color: var(--ow-peach); font-weight: 600; margin-bottom: 1rem; }
.btn-plan {
    display: block; width: 100%;
    background: var(--ow-orange); color: var(--ow-bg-dark);
    border: none; border-radius: 8px; font-weight: 700;
    padding: 0.5rem; font-size: 0.9rem; transition: background 0.2s; cursor: pointer;
}
.btn-plan:hover { background: var(--ow-peach); }
.btn-plan-ghost {
    display: block; width: 100%;
    background: transparent; color: var(--ow-orange);
    border: 1px solid var(--ow-orange); border-radius: 8px; font-weight: 700;
    padding: 0.5rem; font-size: 0.9rem; transition: all 0.2s; cursor: pointer;
}
.btn-plan-ghost:hover { background: var(--ow-orange); color: var(--ow-bg-dark); }

/* ── Barra de búsqueda catálogo ── */
.search-bar-ow {
    background: var(--ow-bg-dark); border: 1px solid var(--ow-peach);
    color: var(--ow-cream); border-radius: 10px;
    padding: 0.55rem 1rem; font-size: 0.9rem; width: 100%;
}
.search-bar-ow::placeholder { color: rgba(234,181,111,0.4); }
.search-bar-ow:focus { border-color: var(--ow-orange); outline: none; box-shadow: 0 0 0 3px rgba(227,114,57,0.15); }
.btn-buscar-cat {
    background: var(--ow-orange); color: var(--ow-bg-dark);
    border: none; border-radius: 10px; font-weight: 700;
    padding: 0.55rem 1.2rem; font-size: 0.9rem; transition: background 0.2s;
}
.btn-buscar-cat:hover { background: var(--ow-peach); }
.btn-limpiar-cat {
    background: transparent; color: var(--ow-cream);
    border: 1px solid rgba(234,181,111,0.4); border-radius: 10px;
    padding: 0.55rem 1rem; font-size: 0.9rem; transition: all 0.2s;
}
.btn-limpiar-cat:hover { border-color: var(--ow-cream); }

/* ── Separador ── */
.ow-divider { border: none; border-top: 1px solid rgba(227,114,57,0.15); margin: 2.5rem 0; }

/* ── Colores de fondo por card ── */
.bg-c1 { background: linear-gradient(135deg,#1a3a4a,#254252); }
.bg-c2 { background: linear-gradient(135deg,#2a1a3a,#1a1040); }
.bg-c3 { background: linear-gradient(135deg,#3a1a1a,#2a1010); }
.bg-c4 { background: linear-gradient(135deg,#1a2a3a,#0d1f2d); }
.bg-c5 { background: linear-gradient(135deg,#2a3a1a,#162010); }
.bg-c6 { background: linear-gradient(135deg,#3a2a1a,#201408); }
.bg-c7 { background: linear-gradient(135deg,#1a1a3a,#0d0d20); }
.bg-c8 { background: linear-gradient(135deg,#3a1a2a,#201018); }
.bg-c9 { background: linear-gradient(135deg,#1a3a3a,#0d2020); }
.bg-c10{ background: linear-gradient(135deg,#2a2a1a,#181800); }
</style>

<!-- ══════════════════════════════════════════════════════
     HERO CAROUSEL — portadas destacadas
     ══════════════════════════════════════════════════════ -->
<div id="heroCarousel" class="carousel slide hero-carousel"
     data-bs-ride="carousel" data-bs-interval="5000">

    <div class="carousel-indicators">
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="3"></button>
    </div>

    <div class="carousel-inner">

        <!-- Slide 1 -->
        <div class="carousel-item active">
            <div class="hero-bg bg-c3"><img class="hero-cover ow-cover" data-mal="16498" alt="" loading="eager"></div>
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <span class="hero-badge">🔥 TENDENCIA</span>
                <div class="hero-title">Attack on Titan</div>
                <div class="hero-meta">Anime · 89 episodios · Acción, Drama</div>
                <div class="hero-desc">La humanidad lucha por sobrevivir dentro de enormes murallas frente a gigantes devoradores llamados Titanes.</div>
                <a href="catalogo.jsp" class="btn-hero-primary">▶ Ver ahora</a>
                <button class="btn-hero-sec">+ Mi lista</button>
            </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item">
            <div class="hero-bg bg-c2"><img class="hero-cover ow-cover" data-mal="40748" alt="" loading="lazy"></div>
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <span class="hero-badge">✨ ESTRENO</span>
                <div class="hero-title">Jujutsu Kaisen</div>
                <div class="hero-meta">Anime · 47 episodios · Acción, Sobrenatural</div>
                <div class="hero-desc">Yuji Itadori ingiere un dedo de un maldito para salvar a sus amigos y es absorbido por el más poderoso de todos.</div>
                <a href="catalogo.jsp" class="btn-hero-primary">▶ Ver ahora</a>
                <button class="btn-hero-sec">+ Mi lista</button>
            </div>
        </div>

        <!-- Slide 3 (Película) -->
        <div class="carousel-item">
            <div class="hero-bg bg-c5"><img class="hero-cover ow-cover" data-mal="32281" alt="" loading="lazy"></div>
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <span class="hero-badge">🎬 PELÍCULA</span>
                <div class="hero-title">Your Name</div>
                <div class="hero-meta">Anime · 2016 · Romance, Fantasía</div>
                <div class="hero-desc">Dos jóvenes se dan cuenta de que están intercambiando cuerpos mientras duermen, compartiendo vidas completamente distintas.</div>
                <a href="catalogo.jsp" class="btn-hero-primary">▶ Ver ahora</a>
                <button class="btn-hero-sec">+ Mi lista</button>
            </div>
        </div>

        <!-- Slide 4 -->
        <div class="carousel-item">
            <div class="hero-bg bg-c7"><img class="hero-cover ow-cover" data-mal="1535" alt="" loading="lazy"></div>
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <span class="hero-badge">🏆 CLÁSICO</span>
                <div class="hero-title">Death Note</div>
                <div class="hero-meta">Anime · 37 episodios · Thriller, Psicológico</div>
                <div class="hero-desc">Light Yagami encuentra un cuaderno sobrenatural que le permite matar a cualquier persona. Comienza un duelo intelectual sin precedentes.</div>
                <a href="catalogo.jsp" class="btn-hero-primary">▶ Ver ahora</a>
                <button class="btn-hero-sec">+ Mi lista</button>
            </div>
        </div>

    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

<!-- ══════════════════════════════════════════════════════
     SERIES DESTACADAS — datos de Pantalla.java (datosSeries)
     ══════════════════════════════════════════════════════ -->
<div class="section-title">
    📺 Series <span class="section-sub">— del catálogo original</span>
</div>

<!-- Búsqueda series (equivalente al jTextField2 + jButton2 de Pantalla.java) -->
<div class="d-flex gap-2 mb-3">
    <input class="search-bar-ow" type="text" id="busqSeries"
           placeholder="Buscar serie..." oninput="filtrarSeries()">
    <button class="btn-limpiar-cat" onclick="limpiarSeries()">Limpiar</button>
</div>

<div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-3 mb-2" id="gridSeries">

    <div class="col serie-item" data-titulo="One Piece" data-genero="Aventura, Acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c1">
                <img class="ow-cover" data-mal="21" alt="One Piece" loading="lazy">
                <span class="ow-card-badge badge-popular">POPULAR</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">One Piece</div>
                <div class="ow-card-meta">Anime · 1000+ eps</div>
                <span class="ow-genre-tag">Aventura</span>
                <span class="ow-genre-tag">Acción</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Naruto Shippuden" data-genero="Acción, Ninja">
        <div class="ow-card">
            <div class="ow-card-img bg-c4">
                <img class="ow-cover" data-mal="1735" alt="Naruto Shippuden" loading="lazy">
                <span class="ow-card-badge badge-clasico">CLÁSICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Naruto Shippuden</div>
                <div class="ow-card-meta">Anime · 500 eps</div>
                <span class="ow-genre-tag">Acción</span>
                <span class="ow-genre-tag">Ninja</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Attack on Titan" data-genero="Acción, Drama">
        <div class="ow-card">
            <div class="ow-card-img bg-c3">
                <img class="ow-cover" data-mal="16498" alt="Attack on Titan" loading="lazy">
                <span class="ow-card-badge badge-popular">POPULAR</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Attack on Titan</div>
                <div class="ow-card-meta">Anime · 89 eps</div>
                <span class="ow-genre-tag">Acción</span>
                <span class="ow-genre-tag">Drama</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Demon Slayer" data-genero="Acción, Fantasía">
        <div class="ow-card">
            <div class="ow-card-img bg-c6">
                <img class="ow-cover" data-mal="38000" alt="Demon Slayer" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Demon Slayer</div>
                <div class="ow-card-meta">Anime · 55 eps</div>
                <span class="ow-genre-tag">Acción</span>
                <span class="ow-genre-tag">Fantasía</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="My Hero Academia" data-genero="Superhéroes, Acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c8">
                <img class="ow-cover" data-mal="31964" alt="My Hero Academia" loading="lazy">
                <span class="ow-card-badge badge-popular">POPULAR</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">My Hero Academia</div>
                <div class="ow-card-meta">Anime · 138 eps</div>
                <span class="ow-genre-tag">Superhéroes</span>
                <span class="ow-genre-tag">Acción</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Jujutsu Kaisen" data-genero="Acción, Sobrenatural">
        <div class="ow-card">
            <div class="ow-card-img bg-c2">
                <img class="ow-cover" data-mal="40748" alt="Jujutsu Kaisen" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Jujutsu Kaisen</div>
                <div class="ow-card-meta">Anime · 47 eps</div>
                <span class="ow-genre-tag">Acción</span>
                <span class="ow-genre-tag">Sobrenatural</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Death Note" data-genero="Thriller, Psicológico">
        <div class="ow-card">
            <div class="ow-card-img bg-c7">
                <img class="ow-cover" data-mal="1535" alt="Death Note" loading="lazy">
                <span class="ow-card-badge badge-clasico">CLÁSICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Death Note</div>
                <div class="ow-card-meta">Anime · 37 eps</div>
                <span class="ow-genre-tag">Thriller</span>
                <span class="ow-genre-tag">Psicológico</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Fullmetal Alchemist: Brotherhood" data-genero="Aventura, Fantasía">
        <div class="ow-card">
            <div class="ow-card-img bg-c9">
                <img class="ow-cover" data-mal="5114" alt="Fullmetal Alchemist Brotherhood" loading="lazy">
                <span class="ow-card-badge badge-clasico">CLÁSICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">FMA Brotherhood</div>
                <div class="ow-card-meta">Anime · 64 eps</div>
                <span class="ow-genre-tag">Aventura</span>
                <span class="ow-genre-tag">Fantasía</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Chainsaw Man" data-genero="Acción, Horror">
        <div class="ow-card">
            <div class="ow-card-img bg-c10">
                <img class="ow-cover" data-mal="44511" alt="Chainsaw Man" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Chainsaw Man</div>
                <div class="ow-card-meta">Anime · 12 eps</div>
                <span class="ow-genre-tag">Acción</span>
                <span class="ow-genre-tag">Horror</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Spy x Family" data-genero="Comedia, Acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c5">
                <img class="ow-cover" data-mal="50265" alt="Spy x Family" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Spy x Family</div>
                <div class="ow-card-meta">Anime · 37 eps</div>
                <span class="ow-genre-tag">Comedia</span>
                <span class="ow-genre-tag">Acción</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

</div>

<div id="sinResultadosSeries" style="display:none; color:var(--ow-cream); text-align:center; padding:2rem 0; opacity:0.6;">
    Sin resultados para tu búsqueda.
</div>

<hr class="ow-divider">

<!-- ══════════════════════════════════════════════════════
     PELÍCULAS — datos de Pantalla.java (datosPeliculas)
     ══════════════════════════════════════════════════════ -->
<div class="section-title">
    🎬 Películas <span class="section-sub">— del catálogo original</span>
</div>

<div class="d-flex gap-2 mb-3">
    <input class="search-bar-ow" type="text" id="busqPelis"
           placeholder="Buscar película..." oninput="filtrarPelis()">
    <button class="btn-limpiar-cat" onclick="limpiarPelis()">Limpiar</button>
</div>

<div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-3 mb-2" id="gridPelis">

    <div class="col peli-item" data-titulo="Your Name" data-genero="Romance, Fantasía">
        <div class="ow-card">
            <div class="ow-card-img bg-c5">
                <img class="ow-cover" data-mal="32281" alt="Your Name" loading="lazy">
                <span class="ow-card-badge badge-popular">POPULAR</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Your Name</div>
                <div class="ow-card-meta">Anime · 2016</div>
                <span class="ow-genre-tag">Romance</span>
                <span class="ow-genre-tag">Fantasía</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="Akira" data-genero="Ciencia ficción, Acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c7">
                <img class="ow-cover" data-mal="572" alt="Akira" loading="lazy">
                <span class="ow-card-badge badge-clasico">CLÁSICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Akira</div>
                <div class="ow-card-meta">Anime · 1988</div>
                <span class="ow-genre-tag">Sci-Fi</span>
                <span class="ow-genre-tag">Acción</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="El viaje de Chihiro" data-genero="Fantasía, Aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c9">
                <img class="ow-cover" data-mal="199" alt="El viaje de Chihiro" loading="lazy">
                <span class="ow-card-badge badge-clasico">CLÁSICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">El viaje de Chihiro</div>
                <div class="ow-card-meta">Anime · 2001</div>
                <span class="ow-genre-tag">Fantasía</span>
                <span class="ow-genre-tag">Aventura</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="Demon Slayer: Mugen Train" data-genero="Acción, Fantasía">
        <div class="ow-card">
            <div class="ow-card-img bg-c3">
                <img class="ow-cover" data-mal="40456" alt="Demon Slayer Mugen Train" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">DS: Mugen Train</div>
                <div class="ow-card-meta">Anime · 2020</div>
                <span class="ow-genre-tag">Acción</span>
                <span class="ow-genre-tag">Fantasía</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="One Piece Film Red" data-genero="Aventura, Acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c6">
                <img class="ow-cover" data-mal="49365" alt="One Piece Film Red" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">One Piece Film Red</div>
                <div class="ow-card-meta">Anime · 2022</div>
                <span class="ow-genre-tag">Aventura</span>
                <span class="ow-genre-tag">Acción</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="Suzume" data-genero="Aventura, Romance">
        <div class="ow-card">
            <div class="ow-card-img bg-c4">
                <img class="ow-cover" data-mal="51721" alt="Suzume" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Suzume</div>
                <div class="ow-card-meta">Anime · 2022</div>
                <span class="ow-genre-tag">Aventura</span>
                <span class="ow-genre-tag">Romance</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="Princess Mononoke" data-genero="Fantasía, Aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c5">
                <img class="ow-cover" data-mal="164" alt="Princess Mononoke" loading="lazy">
                <span class="ow-card-badge badge-clasico">CLÁSICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Princess Mononoke</div>
                <div class="ow-card-meta">Anime · 1997</div>
                <span class="ow-genre-tag">Fantasía</span>
                <span class="ow-genre-tag">Aventura</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="Jujutsu Kaisen 0" data-genero="Acción, Sobrenatural">
        <div class="ow-card">
            <div class="ow-card-img bg-c2">
                <img class="ow-cover" data-mal="48561" alt="Jujutsu Kaisen 0" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Jujutsu Kaisen 0</div>
                <div class="ow-card-meta">Anime · 2021</div>
                <span class="ow-genre-tag">Acción</span>
                <span class="ow-genre-tag">Sobrenatural</span>
                <a href="catalogo.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

</div>

<div id="sinResultadosPelis" style="display:none; color:var(--ow-cream); text-align:center; padding:2rem 0; opacity:0.6;">
    Sin resultados para tu búsqueda.
</div>

<hr class="ow-divider">

<!-- ══════════════════════════════════════════════════════
     PLANES — datos de Pantalla.java (modeloPlanes / PESTAÑA INICIO)
     ══════════════════════════════════════════════════════ -->
<div class="section-title">
    💎 Planes mensuales <span class="section-sub">— elige el tuyo</span>
</div>

<div class="planes-row mb-4">

    <!-- Básico -->
    <div class="plan-card">
        <div class="plan-name">Básico</div>
        <div class="plan-price">$19.900 <span>/mes</span></div>
        <div class="plan-desc">Películas y series estándar</div>
        <div class="plan-screens">📺 1 pantalla</div>
        <button class="btn-plan-ghost" onclick="elegirPlan('Básico')">Elegir plan</button>
    </div>

    <!-- Estándar -->
    <div class="plan-card">
        <div class="plan-name">Estándar</div>
        <div class="plan-price">$29.900 <span>/mes</span></div>
        <div class="plan-desc">Todo Básico + HD</div>
        <div class="plan-screens">📺📺 2 pantallas</div>
        <button class="btn-plan-ghost" onclick="elegirPlan('Estándar')">Elegir plan</button>
    </div>

    <!-- Premium — destacado -->
    <div class="plan-card featured">
        <div class="plan-recommended">MEJOR</div>
        <div class="plan-name">Premium</div>
        <div class="plan-price">$39.900 <span>/mes</span></div>
        <div class="plan-desc">Todo Estándar + 4K</div>
        <div class="plan-screens">📺📺📺📺 4 pantallas</div>
        <button class="btn-plan" onclick="elegirPlan('Premium')">Elegir plan</button>
    </div>

    <!-- Familia -->
    <div class="plan-card">
        <div class="plan-name">Familia</div>
        <div class="plan-price">$49.900 <span>/mes</span></div>
        <div class="plan-desc">Todo Premium + contenido infantil</div>
        <div class="plan-screens">📺×6 6 pantallas</div>
        <button class="btn-plan-ghost" onclick="elegirPlan('Familia')">Elegir plan</button>
    </div>

</div>

<!-- ══════════════════════════════════════════════════════
     JAVASCRIPT — búsqueda fiel a jButton1/jButton2 de Pantalla.java
     ══════════════════════════════════════════════════════ -->
<script>
    function filtrarSeries() {
        const q = document.getElementById('busqSeries').value.toLowerCase();
        let hay = false;
        document.querySelectorAll('.serie-item').forEach(el => {
            const match = el.dataset.titulo.toLowerCase().includes(q)
                       || el.dataset.genero.toLowerCase().includes(q);
            el.style.display = match ? '' : 'none';
            if (match) hay = true;
        });
        document.getElementById('sinResultadosSeries').style.display = hay ? 'none' : 'block';
    }

    function limpiarSeries() {
        document.getElementById('busqSeries').value = '';
        document.querySelectorAll('.serie-item').forEach(el => el.style.display = '');
        document.getElementById('sinResultadosSeries').style.display = 'none';
    }

    function filtrarPelis() {
        const q = document.getElementById('busqPelis').value.toLowerCase();
        let hay = false;
        document.querySelectorAll('.peli-item').forEach(el => {
            const match = el.dataset.titulo.toLowerCase().includes(q)
                       || el.dataset.genero.toLowerCase().includes(q);
            el.style.display = match ? '' : 'none';
            if (match) hay = true;
        });
        document.getElementById('sinResultadosPelis').style.display = hay ? 'none' : 'block';
    }

    function limpiarPelis() {
        document.getElementById('busqPelis').value = '';
        document.querySelectorAll('.peli-item').forEach(el => el.style.display = '');
        document.getElementById('sinResultadosPelis').style.display = 'none';
    }

    function elegirPlan(nombre) {
        const usuario = sessionStorage.getItem('ow_usuario_activo');
        if (usuario) {
            alert('Plan ' + nombre + ' seleccionado para ' + usuario + '. ¡Gracias!');
        } else {
            if (confirm('Para elegir un plan necesitas iniciar sesión. ¿Ir al login?')) {
                window.location.href = 'login.jsp';
            }
        }
    }
</script>

<%@include file="/lib/footer.jsp" %>
