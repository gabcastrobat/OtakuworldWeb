<%@include file="/lib/header.jsp" %>
<link rel="stylesheet" href="styles/otaku.css">

<style>
.page-hero {
    background: linear-gradient(135deg, #1a2a3a 0%, #0d1117 60%);
    border-radius: 12px; padding: 2rem 2rem 1.5rem;
    margin-bottom: 2rem;
    border-left: 4px solid var(--ow-orange);
}
.page-hero h1 { font-family:var(--ow-font-display); font-size:2rem; font-weight:700; color:#fff; margin-bottom:0.3rem; letter-spacing:0.02em; }
.page-hero p  { font-family:var(--ow-font-text); color:var(--ow-muted); font-size:0.95rem; line-height:1.55; margin:0; }
.count-badge  { background:rgba(227,114,57,0.18); color:var(--ow-orange); border:1px solid rgba(227,114,57,0.4); border-radius:20px; padding:2px 12px; font-size:0.8rem; font-weight:700; display:inline-block; margin-top:0.5rem; }
</style>

<div class="page-hero">
    <h1> Series de Anime</h1>
    <p>Todo el catalogo de series: busca, filtra por genero y encuentra tu proximo maraton.</p>
    <span class="count-badge" id="contadorSeries">13 series</span>
</div>


<div class="d-flex flex-wrap gap-2 mb-3">
    <input class="ow-search-bar" style="max-width:340px" type="text" id="busqSeries"
           placeholder=" Buscar serie por titulo o genero" lang="es-419" oninput="filtrarSeries()">
    <button class="btn-ow-clear" onclick="limpiarSeries()">Limpiar</button>
</div>

<!-- Filtros por género -->
<div class="ow-filter-tabs" id="filtroTabs">
    <button class="ow-filter-tab active" onclick="filtroGenero(this,'')">Todos</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Accion')"> Accion</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Aventura')"> Aventura</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Thriller')">Thriller</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Comedia')"> Comedia</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Horror')"> Horror</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Fantasia')"> Fantasia</button>
</div>

<!-- Grid de series — datos de Pantalla.java datosSeries[][] -->
<div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 g-3" id="gridSeries">

    <div class="col serie-item" data-titulo="one piece" data-genero="aventura acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c1"><img class="ow-cover" data-mal="21" alt="One Piece" loading="lazy"><span class="ow-card-badge badge-popular">POPULAR</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">One Piece</div>
                <div class="ow-card-meta">Anime mas de 1000 episodios</div>
                <span class="ow-genre-tag">Aventura</span><span class="ow-genre-tag">Accion</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="21">
                    <input type="hidden" name="titulo" value="One Piece">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/21/cover.jpg">
                    <input type="hidden" name="genero" value="Aventura, Accion">
                    <input type="hidden" name="tipo" value="SERIE">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="naruto shippuden" data-genero="acción ninja">
        <div class="ow-card">
            <div class="ow-card-img bg-c4"><img class="ow-cover" data-mal="1735" alt="Naruto Shippuden" loading="lazy"><span class="ow-card-badge badge-clasico">CLASICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Naruto Shippuden</div>
                <div class="ow-card-meta">Anime � 500 episodios</div>
                <span class="ow-genre-tag">Accion</span><span class="ow-genre-tag">Ninja</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="1735">
                    <input type="hidden" name="titulo" value="Naruto Shippuden">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/1735/cover.jpg">
                    <input type="hidden" name="genero" value="Accion, Ninja">
                    <input type="hidden" name="tipo" value="SERIE">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="attack on titan" data-genero="acción drama">
        <div class="ow-card">
            <div class="ow-card-img bg-c3"><img class="ow-cover" data-mal="16498" alt="Attack on Titan" loading="lazy"><span class="ow-card-badge badge-popular">POPULAR</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Attack on Titan</div>
                <div class="ow-card-meta">Anime � 89 episodios</div>
                <span class="ow-genre-tag">Accion</span><span class="ow-genre-tag">Drama</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="16498">
                    <input type="hidden" name="titulo" value="Attack on Titan">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/16498/cover.jpg">
                    <input type="hidden" name="genero" value="Accion, Drama">
                    <input type="hidden" name="tipo" value="SERIE">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="kimetsu no yaiba demon slayer" data-genero="acción fantasía">
        <div class="ow-card">
            <div class="ow-card-img bg-c6"><img class="ow-cover" data-mal="38000" alt="Kimetsu no Yaiba" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Kimetsu no Yaiba</div>
                <div class="ow-card-meta">Anime� 55 episodios</div>
                <span class="ow-genre-tag">Accion</span><span class="ow-genre-tag">Fantasia</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="38000">
                    <input type="hidden" name="titulo" value="Kimetsu no Yaiba">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/38000/cover.jpg">
                    <input type="hidden" name="genero" value="Accion, Fantasia">
                    <input type="hidden" name="tipo" value="SERIE">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="my hero academia" data-genero="superhéroes acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c8"><img class="ow-cover" data-mal="31964" alt="My Hero Academia" loading="lazy"><span class="ow-card-badge badge-popular">POPULAR</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">My Hero Academia</div>
                <div class="ow-card-meta">Anime � 138 episodios</div>
                <span class="ow-genre-tag">Super heroes</span><span class="ow-genre-tag">Accion</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="31964">
                    <input type="hidden" name="titulo" value="My Hero Academia">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/31964/cover.jpg">
                    <input type="hidden" name="genero" value="Super heroes, Accion">
                    <input type="hidden" name="tipo" value="SERIE">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="jujutsu kaisen" data-genero="acción sobrenatural">
        <div class="ow-card">
            <div class="ow-card-img bg-c2"><img class="ow-cover" data-mal="40748" alt="Jujutsu Kaisen" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Jujutsu Kaisen</div>
                <div class="ow-card-meta">Anime � 47 episodios</div>
                <span class="ow-genre-tag">Accion</span><span class="ow-genre-tag">Sobrenatural</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="40748">
                    <input type="hidden" name="titulo" value="Jujutsu Kaisen">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/40748/cover.jpg">
                    <input type="hidden" name="genero" value="Accion, Sobrenatural">
                    <input type="hidden" name="tipo" value="SERIE">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="spy x family" data-genero="comedia acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c5"><img class="ow-cover" data-mal="50265" alt="Spy x Family" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Spy x Family</div>
                <div class="ow-card-meta">Anime  37 episodios</div>
                <span class="ow-genre-tag">Comedia</span><span class="ow-genre-tag">Accion</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="50265">
                    <input type="hidden" name="titulo" value="Spy x Family">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/50265/cover.jpg">
                    <input type="hidden" name="genero" value="Comedia, Accion">
                    <input type="hidden" name="tipo" value="SERIE">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="death note" data-genero="thriller psicológico">
        <div class="ow-card">
            <div class="ow-card-img bg-c7"><img class="ow-cover" data-mal="1535" alt="Death Note" loading="lazy"><span class="ow-card-badge badge-clasico">CLASICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Death Note</div>
                <div class="ow-card-meta">Anime · 37 episodios</div>
                <span class="ow-genre-tag">Thriller</span><span class="ow-genre-tag">Psicologia</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="1535">
                    <input type="hidden" name="titulo" value="Death Note">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/1535/cover.jpg">
                    <input type="hidden" name="genero" value="Thriller, Psicologia">
                    <input type="hidden" name="tipo" value="SERIE">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="fullmetal alchemist brotherhood" data-genero="aventura fantasía">
        <div class="ow-card">
            <div class="ow-card-img bg-c9"><img class="ow-cover" data-mal="5114" alt="Fullmetal Alchemist Brotherhood" loading="lazy"><span class="ow-card-badge badge-clasico">CLASICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">FMA: Brotherhood</div>
                <div class="ow-card-meta">Anime � 64 episodios</div>
                <span class="ow-genre-tag">Aventura</span><span class="ow-genre-tag">Fantasia</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="5114">
                    <input type="hidden" name="titulo" value="FMA: Brotherhood">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/5114/cover.jpg">
                    <input type="hidden" name="genero" value="Aventura, Fantasia">
                    <input type="hidden" name="tipo" value="SERIE">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="bleach" data-genero="accion sobrenatural">
        <div class="ow-card">
            <div class="ow-card-img bg-c1"><img class="ow-cover" data-mal="269" alt="Bleach" loading="lazy"><span class="ow-card-badge badge-clasico">CLASICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Bleach</div>
                <div class="ow-card-meta">Anime · 366 episodios</div>
                <span class="ow-genre-tag">Accion</span><span class="ow-genre-tag">Sobrenatural</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="269">
                    <input type="hidden" name="titulo" value="Bleach">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/269/cover.jpg">
                    <input type="hidden" name="genero" value="Accion, Sobrenatural">
                    <input type="hidden" name="tipo" value="SERIE">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="dragon ball z" data-genero="acción aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c3"><img class="ow-cover" data-mal="813" alt="Dragon Ball Z" loading="lazy"><span class="ow-card-badge badge-clasico">CLASICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Dragon Ball Z</div>
                <div class="ow-card-meta">Anime · 291 episodios</div>
                <span class="ow-genre-tag">Accion</span><span class="ow-genre-tag">Aventura</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="813">
                    <input type="hidden" name="titulo" value="Dragon Ball Z">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/813/cover.jpg">
                    <input type="hidden" name="genero" value="Accion, Aventura">
                    <input type="hidden" name="tipo" value="SERIE">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="hunter x hunter" data-genero="aventura acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c5"><img class="ow-cover" data-mal="11061" alt="Hunter x Hunter" loading="lazy"><span class="ow-card-badge badge-clasico">CLASICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Hunter x Hunter</div>
                <div class="ow-card-meta">Anime � 148 episodios</div>
                <span class="ow-genre-tag">Aventura</span><span class="ow-genre-tag">Accion</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="11061">
                    <input type="hidden" name="titulo" value="Hunter x Hunter">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/11061/cover.jpg">
                    <input type="hidden" name="genero" value="Aventura, Accion">
                    <input type="hidden" name="tipo" value="SERIE">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="chainsaw man" data-genero="acción horror">
        <div class="ow-card">
            <div class="ow-card-img bg-c2"><img class="ow-cover" data-mal="44511" alt="Chainsaw Man" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Chainsaw Man</div>
                <div class="ow-card-meta">Anime � 12 episodios</div>
                <span class="ow-genre-tag">Accion</span><span class="ow-genre-tag">Horror</span>
                <a href="#" class="ow-card-btn"> Ver ahora</a>
                <form method="post" action="MiLista" style="margin-top:0.4rem;">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="id" value="44511">
                    <input type="hidden" name="titulo" value="Chainsaw Man">
                    <input type="hidden" name="imagen" value="https://cdn.myanimelist.net/images/anime/44511/cover.jpg">
                    <input type="hidden" name="genero" value="Accion, Horror">
                    <input type="hidden" name="tipo" value="SERIE">
                    <button type="submit" class="ow-card-btn" style="background:rgba(227,114,57,0.15);color:var(--ow-orange);border:1px solid rgba(227,114,57,0.5);cursor:pointer;width:100%;">+ Mi lista</button>
                </form>
            </div>
        </div>
    </div>

</div>

<div class="ow-no-results" id="sinResultadosSeries">No hay series que coincidan con tu busquedad.</div>

<script>
    let generoActivo = '';

    function filtrarSeries() {
        const q = document.getElementById('busqSeries').value.toLowerCase();
        aplicarFiltros(q, generoActivo);
    }

    function filtroGenero(btn, genero) {
        document.querySelectorAll('.ow-filter-tab').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        generoActivo = genero.toLowerCase();
        const q = document.getElementById('busqSeries').value.toLowerCase();
        aplicarFiltros(q, generoActivo);
    }

    function aplicarFiltros(q, genero) {
        let visibles = 0;
        document.querySelectorAll('.serie-item').forEach(el => {
            const matchQ  = !q     || el.dataset.titulo.includes(q) || el.dataset.genero.includes(q);
            const matchG  = !genero || el.dataset.genero.includes(genero);
            const visible = matchQ && matchG;
            el.style.display = visible ? '' : 'none';
            if (visible) visibles++;
        });
        document.getElementById('sinResultadosSeries').classList.toggle('show', visibles === 0);
        document.getElementById('contadorSeries').textContent = visibles + ' serie' + (visibles !== 1 ? 's' : '');
    }

    function limpiarSeries() {
        document.getElementById('busqSeries').value = '';
        generoActivo = '';
        document.querySelectorAll('.ow-filter-tab').forEach((b,i) => b.classList.toggle('active', i === 0));
        aplicarFiltros('', '');
    }
</script>

<%@include file="/lib/footer.jsp" %>
