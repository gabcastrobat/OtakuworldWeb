<%@include file="/lib/header.jsp" %>
<link rel="stylesheet" href="styles/otaku.css">

<style>
.page-hero {
    background: linear-gradient(135deg,#2a1a1a 0%,#0d1117 60%);
    border-radius: 12px; padding: 2rem 2rem 1.5rem;
    margin-bottom: 2rem; border-left: 4px solid var(--ow-orange);
}
.page-hero h1 { font-family:var(--ow-font-display); font-size:2rem; font-weight:700; color:#fff; margin-bottom:0.3rem; letter-spacing:0.02em; }
.page-hero p  { font-family:var(--ow-font-text); color:var(--ow-muted); font-size:0.95rem; line-height:1.55; margin:0; }
.count-badge  { background:rgba(227,114,57,0.18); color:var(--ow-orange); border:1px solid rgba(227,114,57,0.4); border-radius:20px; padding:2px 12px; font-size:0.8rem; font-weight:700; display:inline-block; margin-top:0.5rem; }
</style>

<div class="page-hero">
    <h1>Peliculas de Anime</h1>
    <p>Las mejores peliculas de animacion japonesa: desde clasicos de Studio Ghibli hasta los ultimos estrenos.</p>
    <span class="count-badge" id="contadorPelis">9 peliculas</span>
</div>

<div class="d-flex flex-wrap gap-2 mb-3">
    <input class="ow-search-bar" style="max-width:340px" type="text" id="busqPelis"
           placeholder="Buscar pellicula por titulo o genero" lang="es-419" oninput="filtrarPelis()">
    <button class="btn-ow-clear" onclick="limpiarPelis()">Limpiar</button>
</div>

<div class="ow-filter-tabs">
    <button class="ow-filter-tab active" onclick="filtroGenero(this,'')">Todas</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Accion')">Accion</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Aventura')">Aventura</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Romance')">Romance</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Fantasia')">Fantasia</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Ciencia ficcion')">Ciencia ficcion</button>
</div>

<div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 g-3" id="gridPelis">

    <div class="col peli-item" data-titulo="tu nombre your name kimi no na wa" data-genero="romance fantas√≠a">
        <div class="ow-card">
            <div class="ow-card-img bg-c5"><img class="ow-cover" data-mal="32281" alt="Tu nombre" loading="lazy"><span class="ow-card-badge badge-popular">POPULAR</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Tu nombre</div>
                <div class="ow-card-meta">Pelicula∑ 2016</div>
                <span class="ow-genre-tag">Romance</span><span class="ow-genre-tag">Fantasia</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="32281">
                    <input type="hidden" name="titulo" value="Tu nombre">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/32281/cover.jpg">
                    <input type="hidden" name="genero" value="Romance, Fantasia">
                    <input type="hidden" name="tipo" value="PELICULA">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="akira" data-genero="ciencia ficci√≥n acci√≥n">
        <div class="ow-card">
            <div class="ow-card-img bg-c7"><img class="ow-cover" data-mal="572" alt="Akira" loading="lazy"><span class="ow-card-badge badge-clasico">Clasico</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Akira</div>
                <div class="ow-card-meta">Pel√≠cula ∑ 1988</div>
                <span class="ow-genre-tag">Ciencia ficcion</span><span class="ow-genre-tag">Accion</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="572">
                    <input type="hidden" name="titulo" value="Akira">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/572/cover.jpg">
                    <input type="hidden" name="genero" value="Ciencia ficcion, Accion">
                    <input type="hidden" name="tipo" value="PELICULA">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="el viaje de chihiro" data-genero="fantas√≠a aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c9"><img class="ow-cover" data-mal="199" alt="El viaje de Chihiro" loading="lazy"><span class="ow-card-badge badge-clasico">Clasico</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">El viaje de Chihiro</div>
                <div class="ow-card-meta">Pelicula∑ 2001</div>
                <span class="ow-genre-tag">Fantasia</span><span class="ow-genre-tag">Aventura</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="199">
                    <input type="hidden" name="titulo" value="El viaje de Chihiro">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/199/cover.jpg">
                    <input type="hidden" name="genero" value="Fantasia, Aventura">
                    <input type="hidden" name="tipo" value="PELICULA">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="kimetsu no yaiba tren infinito mugen train" data-genero="acci√≥n fantas√≠a">
        <div class="ow-card">
            <div class="ow-card-img bg-c3"><img class="ow-cover" data-mal="40456" alt="Kimetsu no Yaiba: Tren infinito" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Kimetsu no Yaiba: Tren infinito</div>
                <div class="ow-card-meta">Pelicula∑ 2020</div>
                <span class="ow-genre-tag">Accion</span><span class="ow-genre-tag">Fantasia</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="40456">
                    <input type="hidden" name="titulo" value="Kimetsu no Yaiba: Tren infinito">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/40456/cover.jpg">
                    <input type="hidden" name="genero" value="Accion, Fantasia">
                    <input type="hidden" name="tipo" value="PELICULA">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="one piece film red" data-genero="aventura acci√≥n">
        <div class="ow-card">
            <div class="ow-card-img bg-c6"><img class="ow-cover" data-mal="49365" alt="One Piece Film Red" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">One Piece Film: Red</div>
                <div class="ow-card-meta">Pelicula∑ 2022</div>
                <span class="ow-genre-tag">Aventura</span><span class="ow-genre-tag">Accion</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="49365">
                    <input type="hidden" name="titulo" value="One Piece Film: Red">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/49365/cover.jpg">
                    <input type="hidden" name="genero" value="Aventura, Accion">
                    <input type="hidden" name="tipo" value="PELICULA">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="jujutsu kaisen 0" data-genero="acci√≥n sobrenatural">
        <div class="ow-card">
            <div class="ow-card-img bg-c2"><img class="ow-cover" data-mal="48561" alt="Jujutsu Kaisen 0" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Jujutsu Kaisen 0</div>
                <div class="ow-card-meta">Pelicula∑ 2021</div>
                <span class="ow-genre-tag">Accion</span><span class="ow-genre-tag">Sobrenatural</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="48561">
                    <input type="hidden" name="titulo" value="Jujutsu Kaisen 0">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/48561/cover.jpg">
                    <input type="hidden" name="genero" value="Accion, Sobrenatural">
                    <input type="hidden" name="tipo" value="PELICULA">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="suzume" data-genero="aventura romance">
        <div class="ow-card">
            <div class="ow-card-img bg-c4"><img class="ow-cover" data-mal="51721" alt="Suzume" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Suzume</div>
                <div class="ow-card-meta">Pelicula 2022</div>
                <span class="ow-genre-tag">Aventura</span><span class="ow-genre-tag">Romance</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="51721">
                    <input type="hidden" name="titulo" value="Suzume">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/51721/cover.jpg">
                    <input type="hidden" name="genero" value="Aventura, Romance">
                    <input type="hidden" name="tipo" value="PELICULA">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="la princesa mononoke princess mononoke" data-genero="fantas√≠a aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c5"><img class="ow-cover" data-mal="164" alt="La princesa Mononoke" loading="lazy"><span class="ow-card-badge badge-clasico">Clasico</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">La princesa Mononoke</div>
                <div class="ow-card-meta">Pelicula∑ 1997</div>
                <span class="ow-genre-tag">Fantasia</span><span class="ow-genre-tag">Aventura</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="164">
                    <input type="hidden" name="titulo" value="La princesa Mononoke">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/164/cover.jpg">
                    <input type="hidden" name="genero" value="Fantasia, Aventura">
                    <input type="hidden" name="tipo" value="PELICULA">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="nusaqui del valle del viento" data-genero="ciencia ficci√≥n aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c10"><img class="ow-cover" data-mal="81" alt="Nausica√§ del valle del viento" loading="lazy"><span class="ow-card-badge badge-clasico">Clasico</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Nausaqui del valle del viento</div>
                <div class="ow-card-meta">Pelicula 1984</div>
                <span class="ow-genre-tag">Ciencia ficcion</span><span class="ow-genre-tag">Aventura</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="81">
                    <input type="hidden" name="titulo" value="Nausicaa del valle del viento">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/81/cover.jpg">
                    <input type="hidden" name="genero" value="Ciencia ficcion, Aventura">
                    <input type="hidden" name="tipo" value="PELICULA">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

</div>

<div class="ow-no-results" id="sinResultadosPelis">No hay peliculas que coincidan con tu busqueda.</div>

<script>
    let generoActivo = '';

    function filtrarPelis() {
        const q = document.getElementById('busqPelis').value.toLowerCase();
        aplicarFiltros(q, generoActivo);
    }

    function filtroGenero(btn, genero) {
        document.querySelectorAll('.ow-filter-tab').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        generoActivo = genero.toLowerCase();
        const q = document.getElementById('busqPelis').value.toLowerCase();
        aplicarFiltros(q, generoActivo);
    }

    function aplicarFiltros(q, genero) {
        let visibles = 0;
        document.querySelectorAll('.peli-item').forEach(el => {
            const matchQ = !q     || el.dataset.titulo.includes(q) || el.dataset.genero.includes(q);
            const matchG = !genero || el.dataset.genero.includes(genero);
            const ok     = matchQ && matchG;
            el.style.display = ok ? '' : 'none';
            if (ok) visibles++;
        });
        document.getElementById('sinResultadosPelis').classList.toggle('show', visibles === 0);
        document.getElementById('contadorPelis').textContent = visibles + ' pel√≠cula' + (visibles !== 1 ? 's' : '');
    }

    function limpiarPelis() {
        document.getElementById('busqPelis').value = '';
        generoActivo = '';
        document.querySelectorAll('.ow-filter-tab').forEach((b,i) => b.classList.toggle('active', i === 0));
        aplicarFiltros('', '');
    }
</script>

<%@include file="/lib/footer.jsp" %>
