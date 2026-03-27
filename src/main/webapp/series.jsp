<%@include file="/lib/header.jsp" %>
<link rel="stylesheet" href="styles/otaku.css">

<style>
.page-hero {
    background: linear-gradient(135deg, #1a2a3a 0%, #0d1117 60%);
    border-radius: 12px; padding: 2rem 2rem 1.5rem;
    margin-bottom: 2rem;
    border-left: 4px solid var(--ow-orange);
}
.page-hero h1 { font-family:'Rajdhani',sans-serif; font-size:2rem; font-weight:700; color:#fff; margin-bottom:0.3rem; }
.page-hero p  { color:var(--ow-muted); font-size:0.92rem; margin:0; }
.count-badge  { background:rgba(227,114,57,0.18); color:var(--ow-orange); border:1px solid rgba(227,114,57,0.4); border-radius:20px; padding:2px 12px; font-size:0.8rem; font-weight:700; display:inline-block; margin-top:0.5rem; }
</style>

<!-- Hero de sección -->
<div class="page-hero">
    <h1>📺 Series de Anime</h1>
    <p>Todo el catálogo de series — busca, filtra por género y encuentra tu próxima obsesión.</p>
    <span class="count-badge" id="contadorSeries">13 series</span>
</div>

<!-- Búsqueda + filtros -->
<div class="d-flex flex-wrap gap-2 mb-3">
    <input class="ow-search-bar" style="max-width:340px" type="text" id="busqSeries"
           placeholder="🔍  Buscar serie por título o género..." oninput="filtrarSeries()">
    <button class="btn-ow-clear" onclick="limpiarSeries()">Limpiar</button>
</div>

<!-- Filtros por género -->
<div class="ow-filter-tabs" id="filtroTabs">
    <button class="ow-filter-tab active" onclick="filtroGenero(this,'')">Todos</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Acción')">⚔ Acción</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Aventura')">🗺 Aventura</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Thriller')">🔪 Thriller</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Comedia')">😄 Comedia</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Horror')">💀 Horror</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Fantasía')">🐉 Fantasía</button>
</div>

<!-- Grid de series — datos de Pantalla.java datosSeries[][] -->
<div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 g-3" id="gridSeries">

    <div class="col serie-item" data-titulo="one piece" data-genero="aventura acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c1"><img class="ow-cover" data-mal="21" alt="One Piece" loading="lazy"><span class="ow-card-badge badge-popular">POPULAR</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">One Piece</div>
                <div class="ow-card-meta">Anime · 1000+ eps</div>
                <span class="ow-genre-tag">Aventura</span><span class="ow-genre-tag">Acción</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="naruto shippuden" data-genero="acción ninja">
        <div class="ow-card">
            <div class="ow-card-img bg-c4"><img class="ow-cover" data-mal="1735" alt="Naruto Shippuden" loading="lazy"><span class="ow-card-badge badge-clasico">CLÁSICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Naruto Shippuden</div>
                <div class="ow-card-meta">Anime · 500 eps</div>
                <span class="ow-genre-tag">Acción</span><span class="ow-genre-tag">Ninja</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="attack on titan" data-genero="acción drama">
        <div class="ow-card">
            <div class="ow-card-img bg-c3"><img class="ow-cover" data-mal="16498" alt="Attack on Titan" loading="lazy"><span class="ow-card-badge badge-popular">POPULAR</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Attack on Titan</div>
                <div class="ow-card-meta">Anime · 89 eps</div>
                <span class="ow-genre-tag">Acción</span><span class="ow-genre-tag">Drama</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="demon slayer" data-genero="acción fantasía">
        <div class="ow-card">
            <div class="ow-card-img bg-c6"><img class="ow-cover" data-mal="38000" alt="Demon Slayer" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Demon Slayer</div>
                <div class="ow-card-meta">Anime · 55 eps</div>
                <span class="ow-genre-tag">Acción</span><span class="ow-genre-tag">Fantasía</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="my hero academia" data-genero="superhéroes acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c8"><img class="ow-cover" data-mal="31964" alt="My Hero Academia" loading="lazy"><span class="ow-card-badge badge-popular">POPULAR</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">My Hero Academia</div>
                <div class="ow-card-meta">Anime · 138 eps</div>
                <span class="ow-genre-tag">Superhéroes</span><span class="ow-genre-tag">Acción</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="jujutsu kaisen" data-genero="acción sobrenatural">
        <div class="ow-card">
            <div class="ow-card-img bg-c2"><img class="ow-cover" data-mal="40748" alt="Jujutsu Kaisen" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Jujutsu Kaisen</div>
                <div class="ow-card-meta">Anime · 47 eps</div>
                <span class="ow-genre-tag">Acción</span><span class="ow-genre-tag">Sobrenatural</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="spy x family" data-genero="comedia acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c5"><img class="ow-cover" data-mal="50265" alt="Spy x Family" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Spy x Family</div>
                <div class="ow-card-meta">Anime · 37 eps</div>
                <span class="ow-genre-tag">Comedia</span><span class="ow-genre-tag">Acción</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="death note" data-genero="thriller psicológico">
        <div class="ow-card">
            <div class="ow-card-img bg-c7"><img class="ow-cover" data-mal="1535" alt="Death Note" loading="lazy"><span class="ow-card-badge badge-clasico">CLÁSICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Death Note</div>
                <div class="ow-card-meta">Anime · 37 eps</div>
                <span class="ow-genre-tag">Thriller</span><span class="ow-genre-tag">Psicológico</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="fullmetal alchemist brotherhood" data-genero="aventura fantasía">
        <div class="ow-card">
            <div class="ow-card-img bg-c9"><img class="ow-cover" data-mal="5114" alt="Fullmetal Alchemist Brotherhood" loading="lazy"><span class="ow-card-badge badge-clasico">CLÁSICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">FMA: Brotherhood</div>
                <div class="ow-card-meta">Anime · 64 eps</div>
                <span class="ow-genre-tag">Aventura</span><span class="ow-genre-tag">Fantasía</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="bleach" data-genero="acción sobrenatural">
        <div class="ow-card">
            <div class="ow-card-img bg-c1"><img class="ow-cover" data-mal="269" alt="Bleach" loading="lazy"><span class="ow-card-badge badge-clasico">CLÁSICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Bleach</div>
                <div class="ow-card-meta">Anime · 366 eps</div>
                <span class="ow-genre-tag">Acción</span><span class="ow-genre-tag">Sobrenatural</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="dragon ball z" data-genero="acción aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c3"><img class="ow-cover" data-mal="813" alt="Dragon Ball Z" loading="lazy"><span class="ow-card-badge badge-clasico">CLÁSICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Dragon Ball Z</div>
                <div class="ow-card-meta">Anime · 291 eps</div>
                <span class="ow-genre-tag">Acción</span><span class="ow-genre-tag">Aventura</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="hunter x hunter" data-genero="aventura acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c5"><img class="ow-cover" data-mal="11061" alt="Hunter x Hunter" loading="lazy"><span class="ow-card-badge badge-clasico">CLÁSICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Hunter x Hunter</div>
                <div class="ow-card-meta">Anime · 148 eps</div>
                <span class="ow-genre-tag">Aventura</span><span class="ow-genre-tag">Acción</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col serie-item" data-titulo="chainsaw man" data-genero="acción horror">
        <div class="ow-card">
            <div class="ow-card-img bg-c2"><img class="ow-cover" data-mal="44511" alt="Chainsaw Man" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Chainsaw Man</div>
                <div class="ow-card-meta">Anime · 12 eps</div>
                <span class="ow-genre-tag">Acción</span><span class="ow-genre-tag">Horror</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

</div>

<div class="ow-no-results" id="sinResultadosSeries">Sin series para tu búsqueda 😔</div>

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
