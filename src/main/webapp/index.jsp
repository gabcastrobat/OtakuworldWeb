<%@include file="/lib/header.jsp" %>
<!-- Inicio -->

<style>
.hero-carousel { border-radius: 14px; overflow: hidden; margin-bottom: 2.5rem; position: relative; }
.hero-carousel .carousel-item { min-height: 260px; height: clamp(260px, 52vw, 440px); position: relative; }
.hero-bg {
    position: absolute; inset: 0;
}
.hero-bg .hero-cover {
    position: absolute; inset: 0;   
    width: 100%; height: 100%;
    object-fit: cover;
    object-position: center top;
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
    font-family: var(--ow-font-text);
    display: inline-block;
    background: var(--ow-orange);
    color: var(--ow-bg-dark);
    font-size: 0.72rem; font-weight: 700;
    padding: 2px 10px; border-radius: 12px;
    letter-spacing: 1px; margin-bottom: 0.6rem;
}
.hero-title {
    font-family: var(--ow-font-display);
    font-size: 2.4rem; font-weight: 700;
    color: #fff; line-height: 1.1;
    margin-bottom: 0.5rem;
}
.hero-meta { font-family: var(--ow-font-text); color: var(--ow-cream); font-size: 0.9rem; margin-bottom: 1rem; }
.hero-desc { font-family: var(--ow-font-text); color: rgba(240,230,211,0.88); font-size: 0.95rem; line-height: 1.5; margin-bottom: 1.2rem; }

.btn-hero-primary {
    font-family: var(--ow-font-text);
    background: var(--ow-orange); color: var(--ow-bg-dark);
    border: none; border-radius: 8px; font-weight: 700;
    padding: 0.55rem 1.4rem; font-size: 0.95rem;
    margin-right: 0.6rem; transition: background 0.2s;
}
.btn-hero-primary:hover { background: var(--ow-peach); }
.btn-hero-sec {
    font-family: var(--ow-font-text);
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

/* â”€â”€ Section titles â”€â”€ */
.section-title {
    font-family: var(--ow-font-display);
    font-size: 1.3rem; font-weight: 700;
    color: var(--ow-orange);
    border-left: 3px solid var(--ow-peach);
    padding-left: 0.7rem;
    margin-bottom: 1.2rem;
}
.section-sub { font-family: var(--ow-font-text); font-size: 0.85rem; color: var(--ow-cream); font-weight: 500; margin-left: 0.5rem; }

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
    position: relative;
    overflow: hidden;
    aspect-ratio: 2 / 3;
    width: 100%;
    max-height: 320px;
}
.ow-card-img .ow-cover {
    position: absolute; inset: 0;
    width: 100%; height: 100%;
    object-fit: cover;
    object-position: center top;
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
    font-family: var(--ow-font-display);
    font-size: 1rem; font-weight: 700;
    color: var(--ow-cream); margin-bottom: 0.2rem;
    white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
}
.ow-card-meta { font-family: var(--ow-font-text); font-size: 0.8rem; color: rgba(234,181,111,0.65); margin-bottom: 0.5rem; }
.ow-genre-tag {
    font-family: var(--ow-font-text);
    display: inline-block; font-size: 0.7rem;
    background: rgba(227,114,57,0.15);
    border: 1px solid rgba(227,114,57,0.3);
    color: var(--ow-peach);
    border-radius: 8px; padding: 1px 8px; margin: 1px;
}
.ow-card-footer-btn {
    font-family: var(--ow-font-text);
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
    white-space: nowrap;
}
.plan-name { font-family: var(--ow-font-display); font-size: 1.3rem; font-weight: 700; color: var(--ow-cream); margin-bottom: 0.4rem; }
.plan-price { font-size: 1.6rem; font-weight: 700; color: var(--ow-orange); margin-bottom: 0.3rem; }
.plan-price span { font-size: 0.8rem; color: var(--ow-cream); font-weight: 400; }
.plan-desc { font-family: var(--ow-font-text); font-size: 0.85rem; line-height: 1.45; color: rgba(234,181,111,0.75); margin-bottom: 0.4rem; }
.plan-screens { font-family: var(--ow-font-text); font-size: 0.85rem; color: var(--ow-peach); font-weight: 600; margin-bottom: 1rem; }
.btn-plan {
    font-family: var(--ow-font-text);
    display: block; width: 100%;
    background: var(--ow-orange); color: var(--ow-bg-dark);
    border: none; border-radius: 8px; font-weight: 700;
    padding: 0.5rem; font-size: 0.9rem; transition: background 0.2s; cursor: pointer;
}
.btn-plan:hover { background: var(--ow-peach); }
.btn-plan-ghost {
    font-family: var(--ow-font-text);
    display: block; width: 100%;
    background: transparent; color: var(--ow-orange);
    border: 1px solid var(--ow-orange); border-radius: 8px; font-weight: 700;
    padding: 0.5rem; font-size: 0.9rem; transition: all 0.2s; cursor: pointer;
}
.btn-plan-ghost:hover { background: var(--ow-orange); color: var(--ow-bg-dark); }

.search-bar-ow {
    font-family: var(--ow-font-text);
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
    font-family: var(--ow-font-text);
    background: transparent; color: var(--ow-cream);
    border: 1px solid rgba(234,181,111,0.4); border-radius: 10px;
    padding: 0.55rem 1rem; font-size: 0.9rem; transition: all 0.2s;
}
.btn-limpiar-cat:hover { border-color: var(--ow-cream); }

.ow-divider { border: none; border-top: 1px solid rgba(227,114,57,0.15); margin: 2.5rem 0; }

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

<!-- 
      -->
<div id="heroCarousel" class="carousel slide hero-carousel"
     data-bs-ride="carousel" data-bs-interval="5000">

    <div class="carousel-indicators">
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="3"></button>
    </div>

    <div class="carousel-inner">

        <div class="carousel-item active">
            <div class="hero-bg bg-c3"><img class="hero-cover ow-cover" data-mal="16498" alt="" loading="eager"></div>
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <span class="hero-badge"> TENDENCIA</span>
                <div class="hero-title">Shingeki no Kyojin</div>
                <div class="hero-meta">Anime  89 episodios Accion y drama</div>
                <div class="hero-desc">La humanidad lucha por sobrevivir dentro de enormes murallas frente a gigantes devoradores llamados titanes.</div>
                <a href="series.jsp" class="btn-hero-primary"> Mirar Ahora </a>
                <a href="series.jsp" class="btn-hero-primary"> + Mi lista </a>
                
            </div>
        </div>

        <div class="carousel-item">
            <div class="hero-bg bg-c2"><img class="hero-cover ow-cover" data-mal="40748" alt="" loading="lazy"></div>
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <span class="hero-badge">ESTRENO</span>
                <div class="hero-title">Jujutsu Kaisen</div>
                <div class="hero-meta">Anime 47 episodios · Accion y sobrenatural</div>
                <div class="hero-desc">Yuji Itadori ingiere un dedo de un maldito para salvar a sus amigos y queda ligado al espiritu mas poderoso de todos.</div>
                <a href="series.jsp" class="btn-hero-primary">Ver ahora</a>
                <button class="btn-hero-sec">+ Mi lista</button>
            </div>
        </div>

        <div class="carousel-item">
            <div class="hero-bg bg-c5"><img class="hero-cover ow-cover" data-mal="32281" alt="" loading="lazy"></div>
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <span class="hero-badge">peliculas</span>
                <div class="hero-title">your name</div>
                <div class="hero-meta">Pelicula de anime · 2016 · Romance y fantasia</div>
                <div class="hero-desc">Dos jovenes descubren que intercambian cuerpos al dormir y comparten vidas totalmente distintas.</div>
                <a href="peliculas.jsp" class="btn-hero-primary"> Ver ahora</a>
                <button class="btn-hero-sec">+ Mi lista</button>
            </div>
        </div>

        <div class="carousel-item">
            <div class="hero-bg bg-c7"><img class="hero-cover ow-cover" data-mal="1535" alt="" loading="lazy"></div>
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <span class="hero-badge">CLASICO</span>
                <div class="hero-title">Death Note</div>
                <div class="hero-meta">Anime  37 episodios Thriller y psicologico</div>
                <div class="hero-desc">Light Yagami encuentra un cuaderno sobrenatural con el que puede quitarle la vida a quien escriba . Empieza un duelo intelectual sin precedentes.</div>
                <a href="series.jsp" class="btn-hero-primary">Ver ahora</a>
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

      
<div class="section-title">
    Series <span class="section-sub"> Destacadas del catalogo</span>
</div>

<div class="d-flex gap-2 mb-3">
    <input class="search-bar-ow" type="text" id="busqSeries"
           placeholder="Buscar serie" lang="es-419" oninput="filtrarSeries()">
    <button class="btn-limpiar-cat" onclick="limpiarSeries()">Limpiar</button>
</div>

<div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-3 mb-2" id="gridSeries">

    <div class="col serie-item" data-titulo="One Piece" data-genero="Aventura, Accion">
        <div class="ow-card">
            <div class="ow-card-img bg-c1">
                <img class="ow-cover" data-mal="21" alt="One Piece" loading="lazy">
                <span class="ow-card-badge badge-popular">POPULAR</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">One Piece</div>
                <div class="ow-card-meta">Anime · mas de 1000 episodios</div>
                <span class="ow-genre-tag">Aventura</span>
                <span class="ow-genre-tag">Accion</span>
                <a href="series.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Naruto Shippuden" data-genero="Acccion, ninja">
        <div class="ow-card">
            <div class="ow-card-img bg-c4">
                <img class="ow-cover" data-mal="1735" alt="Naruto Shippuden" loading="lazy">
                <span class="ow-card-badge badge-clasico">CLASICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Naruto Shippuden</div>
                <div class="ow-card-meta">Anime · 500 episodios</div>
                <span class="ow-genre-tag">Accion</span>
                <span class="ow-genre-tag">Ninja</span>
                <a href="series.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Attack on Titan" data-genero="Accion, Drama">
        <div class="ow-card">
            <div class="ow-card-img bg-c3">
                <img class="ow-cover" data-mal="16498" alt="Attack on Titan" loading="lazy">
                <span class="ow-card-badge badge-popular">POPULAR</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Attack on Titan</div>
                <div class="ow-card-meta">Anime 89 episodios</div>
                <span class="ow-genre-tag">Accion</span>
                <span class="ow-genre-tag">Drama</span>
                <a href="series.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Kimetsu no Yaiba Demon Slayer" data-genero="Accion, Fantasia">
        <div class="ow-card">
            <div class="ow-card-img bg-c6">
                <img class="ow-cover" data-mal="38000" alt="Kimetsu no Yaiba" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Kimetsu no Yaiba</div>
                <div class="ow-card-meta">Anime 55 episodios</div>
                <span class="ow-genre-tag">Accion</span>
                <span class="ow-genre-tag">Fantasia</span>
                <a href="series.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="My Hero Academia" data-genero="SuperhÃ©roes, Accion">
        <div class="ow-card">
            <div class="ow-card-img bg-c8">
                <img class="ow-cover" data-mal="31964" alt="My Hero Academia" loading="lazy">
                <span class="ow-card-badge badge-popular">POPULAR</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">My Hero Academia</div>
                <div class="ow-card-meta">Anime 138 episodios</div>
                <span class="ow-genre-tag">Superheroes</span>
                <span class="ow-genre-tag">Accion</span>
                <a href="series.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Jujutsu Kaisen" data-genero="Accion, Sobrenatural">
        <a href="index.jsp"></a>
        <div class="ow-card">
            <div class="ow-card-img bg-c2">
                <img class="ow-cover" data-mal="40748" alt="Jujutsu Kaisen" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Jujutsu Kaisen</div>
                <div class="ow-card-meta">Anime· 47 episodios</div>
                <span class="ow-genre-tag">Accion</span>
                <span class="ow-genre-tag">Sobrenatural</span>
                <a href="series.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Death Note" data-genero="Thriller, PsicolÃ³gico">
        <div class="ow-card">
            <div class="ow-card-img bg-c7">
                <img class="ow-cover" data-mal="1535" alt="Death Note" loading="lazy">
                <span class="ow-card-badge badge-clasico">CLASICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Death Note</div>
                <div class="ow-card-meta">Anime· 37 episodios</div>
                <span class="ow-genre-tag">Thriller</span>
                <span class="ow-genre-tag">Psicologico</span>
                <a href="series.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Fullmetal Alchemist: Brotherhood" data-genero="Aventura, Fantadis">
        <div class="ow-card">
            <div class="ow-card-img bg-c9">
                <img class="ow-cover" data-mal="5114" alt="Fullmetal Alchemist Brotherhood" loading="lazy">
                <span class="ow-card-badge badge-clasico">CLASICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">FMA Brotherhood</div>
                <div class="ow-card-meta">Anime · 64 episodios</div>
                <span class="ow-genre-tag">Aventura</span>
                <span class="ow-genre-tag">Fantasia</span>
                <a href="series.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Chainsaw Man" data-genero="Accion, Horror">
        <div class="ow-card">
            <div class="ow-card-img bg-c10">
                <img class="ow-cover" data-mal="44511" alt="Chainsaw Man" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Chainsaw Man</div>
                <div class="ow-card-meta">Anime· 12 episodios</div>
                <span class="ow-genre-tag">Accion</span>
                <span class="ow-genre-tag">Horror</span>
                <a href="series.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="Spy x Family" data-genero="Comedia, Accion">
        <div class="ow-card">
            <div class="ow-card-img bg-c5">
                <img class="ow-cover" data-mal="50265" alt="Spy x Family" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Spy x Family</div>
                <div class="ow-card-meta">Anime  37 episodios</div>
                <span class="ow-genre-tag">Comedia</span>
                <span class="ow-genre-tag">Accion</span>
                <a href="series.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

</div>

<div id="sinResultadosSeries" style="display:none; color:var(--ow-cream); text-align:center; padding:2rem 0; opacity:0.6;">
    No hay resultados para tu busquedad.
</div>

<hr class="ow-divider">


<div class="section-title">
    Peliculas<span class="section-sub">destacadas del catalogo</span>
</div>

<div class="d-flex gap-2 mb-3">
    <input class="search-bar-ow" type="text" id="busqPelis"
           placeholder="Buscar peliculas" lang="es-419" oninput="filtrarPelis()">
    <button class="btn-limpiar-cat" onclick="limpiarPelis()">Limpiar</button>
</div>

<div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-3 mb-2" id="gridPelis">

    <div class="col peli-item" data-titulo="El viaje de Chihiro" data-genero="Fantasia, Aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c9">
             <img src="https://th.bing.com/th/id/R.17dc82c18e7a844e7d0606e29319c5eb?rik=0TCteZrftp2Dnw&pid=ImgRaw&r=0" alt="Tumba">

                <span class="ow-card-badge badge-clasico">CLASICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">La tumba de las lucienagas</div>
                <div class="ow-card-meta">Pelicula . 2001</div>
                <span class="ow-genre-tag">Fantasia</span>
                <span class="ow-genre-tag">Aventura</span>
                <a href="peliculas.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="Akira" data-genero="Ciencia ficciÃ³n, Accion">
        <div class="ow-card">
            <div class="ow-card-img bg-c7">
                <img class="ow-cover" data-mal="572" alt="Akira" loading="lazy">
                <span class="ow-card-badge badge-clasico">CLASICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Akira</div>
                <div class="ow-card-meta">Pelicula· 1988</div>
                <span class="ow-genre-tag">Ciencia ficcion</span>
                <span class="ow-genre-tag">AcciON</span>
                <a href="peliculas.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="El viaje de Chihiro" data-genero="Fantasia, Aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c9">
                <img class="ow-cover" data-mal="199" alt="El viaje de Chihiro" loading="lazy">
                <span class="ow-card-badge badge-clasico">CLASICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">El viaje de Chihiro</div>
                <div class="ow-card-meta">Peliculas . 2001</div>
                <span class="ow-genre-tag">Fantasia</span>
                <span class="ow-genre-tag">Aventura</span>
                <a href="peliculas.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="Kimetsu no Yaiba Mugen Train" data-genero="Accion, Fantasia">
        <div class="ow-card">
            <div class="ow-card-img bg-c3">
                <img class="ow-cover" data-mal="40456" alt="Kimetsu no Yaiba: Tren infinito" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Kimetsu no Yaiba 1</div>
                <div class="ow-card-meta">Peliculas2020</div>
                <span class="ow-genre-tag">Accion</span>
                <span class="ow-genre-tag">Fantasia</span>
                <a href="peliculas.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>
    
    <div class="col peli-item" data-titulo="Kimetsu no Yaiba Mugen Train" data-genero="Accion, Fantasia">
        <div class="ow-card">
            <div class="ow-card-img bg-c3">
                <img class="ow-cover" data-mal="40456" alt="Kimetsu no Yaiba: Tren infinito" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Kimetsu no Yaiba 2</div>
                <div class="ow-card-meta">Peliculas2020</div>
                <span class="ow-genre-tag">Accion</span>
                <span class="ow-genre-tag">Fantasia</span>
                <a href="peliculas.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

   
        <div class="col peli-item" data-titulo="La princesa Mononoke" data-genero="Fantasia, Aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c5">
                <img class="ow-cover" data-mal="164" alt="La princesa Mononoke" loading="lazy">
                <span class="ow-card-badge badge-clasico">CLASICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">La princesa Mononoke</div>
                <div class="ow-card-meta">Pelicula  1997</div>
                <span class="ow-genre-tag">Fantasia</span>
                <span class="ow-genre-tag">Aventura</span>
                <a href="peliculas.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>


    <div class="col peli-item" data-titulo="La princesa Mononoke" data-genero="Fantasia, Aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c5">
              <img src="https://voicefilm.com/wp-content/uploads/2022/02/Every-Super-Saiyan-Level-Ranked-11.jpg" alt="Tractor agrícola">

                <span class="ow-card-badge badge-clasico">CLASICO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">La luz del olimpo</div>
                <div class="ow-card-meta">Pelicula  1997</div>
                <span class="ow-genre-tag">Accion</span>
                <span class="ow-genre-tag">Aventura</span>
                <a href="peliculas.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="Jujutsu Kaisen 0" data-genero="Accion, Sobrenatural">
        <div class="ow-card">
            <div class="ow-card-img bg-c2">
                <img class="ow-cover" data-mal="48561" alt="Jujutsu Kaisen 0" loading="lazy">
                <span class="ow-card-badge badge-nuevo">NUEVO</span>
            </div>
            <div class="ow-card-body">
                <div class="ow-card-title">Jujutsu Kaisen 0</div>
                <div class="ow-card-meta">CLASICO2021</div>
                <span class="ow-genre-tag">Accion</span>
                <span class="ow-genre-tag">Sobrenatural</span>
                <a href="peliculas.jsp" class="ow-card-footer-btn">Ver ahora</a>
            </div>
        </div>
    </div>

</div>

<div id="sinResultadosPelis" style="display:none; color:var(--ow-cream); text-align:center; padding:2rem 0; opacity:0.6;">
    No hay resultados para tu bÃºsqueda.
</div>

<hr class="ow-divider">


<div class="section-title">
  Planes mensuales <span class="section-sub"> No te quedes sin tu plan</span>
</div>

<div class="planes-row mb-4">

    <div class="plan-card">
        <div class="plan-recommended">COMUN</div>
        <div class="plan-name">Basico</div>
        <div class="plan-price">$19.900 <span>/mes</span></div>
        <div class="plan-desc">CLASICOy series estandar</div>
        <div class="plan-screens">1 pantalla</div>
        <button class="btn-plan-ghost" onclick="elegirPlan('Basico')">Elegir plan</button>
    </div>

    <div class="plan-card">
        <div class="plan-name">Estandar</div>
        <div class="plan-price">$29.900 <span>/mes</span></div>
        <div class="plan-desc">Todo Basico + HD</div>
        <div class="plan-screens"> 2 pantallas</div>
        <button class="btn-plan-ghost" onclick="elegirPlan('Estandar')">Elegir plan</button>
    </div>

    <div class="plan-card featured">
        <div class="plan-recommended">RECOMENDADO</div>
        <div class="plan-name">Premium</div>
        <div class="plan-price">$39.900 <span>/mes</span></div>
        <div class="plan-desc">Todo Estandar + 4K</div>
        <div class="plan-screens">4 pantallas</div>
        <button class="btn-plan" onclick="elegirPlan('Premium')">Elegir plan</button>
    </div>

    <div class="plan-card">
        <div class="plan-recommended">RECOMENDADO</div>
        <div class="plan-name">Familia</div>
        <div class="plan-price">$49.900 <span>/mes</span></div>
        <div class="plan-desc">Todo Premium + contenido infantil</div>
        <div class="plan-screens"> 6 pantallas</div>
        <button class="btn-plan" onclick="elegirPlan('Premium')">Elegir plan</button>
    </div>

</div>

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
            alert('Plan ' + nombre + ' seleccionado para ' + usuario + '. Â¡Gracias por elegirnos!');
        } else {
            if (confirm('Para elegir un plan tenemos que iniciar sesion. ¿Quieres ir al inicio de sesion?')) {
                window.location.href = 'login.jsp';
            }
        }
    }
</script>

<%@include file="/lib/footer.jsp" %>
