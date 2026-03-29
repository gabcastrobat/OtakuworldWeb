<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/lib/header.jsp" %>
<link rel="stylesheet" href="styles/otaku.css">

<style>
.page-hero {
    background: linear-gradient(135deg,#2a1a1a 0%,#0d1117 60%);
    border-radius: 12px; padding: 2rem 2rem 1.5rem;
    margin-bottom: 2rem; border-left: 4px solid var(--ow-orange);
}
.page-hero h1 { font-family:'Rajdhani',sans-serif; font-size:2rem; font-weight:700; color:#fff; margin-bottom:0.3rem; }
.page-hero p  { color:var(--ow-muted); font-size:0.92rem; margin:0; }
.count-badge  { background:rgba(227,114,57,0.18); color:var(--ow-orange); border:1px solid rgba(227,114,57,0.4); border-radius:20px; padding:2px 12px; font-size:0.8rem; font-weight:700; display:inline-block; margin-top:0.5rem; }
</style>

<div class="page-hero">
    <h1>Pel&iacute;culas de anime</h1>
    <p>Las mejores producciones cinematogr&aacute;ficas del anime, desde cl&aacute;sicos de Ghibli hasta los &uacute;ltimos estrenos.</p>
    <span class="count-badge" id="contadorPelis">10 pel&iacute;culas</span>
</div>

<!-- Búsqueda + filtros -->
<div class="d-flex flex-wrap gap-2 mb-3">
    <input class="ow-search-bar" style="max-width:340px" type="text" id="busqPelis"
< codex/fix-grammatical-and-syntax-errors-7x4lyz
           placeholder="Buscar pel&iacute;cula por t&iacute;tulo o g&eacute;nero..." oninput="filtrarPelis()">
=======
           placeholder="Buscar película por título o género..." oninput="filtrarPelis()">
> main
    <button class="btn-ow-clear" onclick="limpiarPelis()">Limpiar</button>
</div>

<div class="ow-filter-tabs">
    <button class="ow-filter-tab active" onclick="filtroGenero(this,'')">Todas</button>
< codex/fix-grammatical-and-syntax-errors-7x4lyz
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Acción')">Acci&oacute;n</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Aventura')">Aventura</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Romance')">Romance</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Fantasía')">Fantas&iacute;a</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'ciencia ficción')">Ciencia ficci&oacute;n</button>
=======
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Acción')">💥 Acción</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Aventura')">🗺 Aventura</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Romance')">🌸 Romance</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Fantasía')">🐉 Fantasía</button>
    <button class="ow-filter-tab" onclick="filtroGenero(this,'Sci-Fi')">🚀 Sci-Fi</button>
> main
</div>

<!-- Grid — datos de Pantalla.java datosPeliculas[][] -->
<div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 g-3" id="gridPelis">

    <div class="col peli-item" data-titulo="your name" data-genero="romance fantasía">
        <div class="ow-card">
            <div class="ow-card-img bg-c5"><img class="ow-cover" data-mal="32281" alt="Your Name" loading="lazy"><span class="ow-card-badge badge-popular">POPULAR</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Your Name</div>
                <div class="ow-card-meta">Anime · 2016</div>
                <span class="ow-genre-tag">Romance</span><span class="ow-genre-tag">Fantasía</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="akira" data-genero="ciencia ficción acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c7"><img class="ow-cover" data-mal="572" alt="Akira" loading="lazy"><span class="ow-card-badge badge-clasico">CLÁSICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Akira</div>
                <div class="ow-card-meta">Anime · 1988</div>
                <span class="ow-genre-tag">Ciencia ficci&oacute;n</span><span class="ow-genre-tag">Acci&oacute;n</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="el viaje de chihiro" data-genero="fantasía aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c9"><img class="ow-cover" data-mal="199" alt="El viaje de Chihiro" loading="lazy"><span class="ow-card-badge badge-clasico">CLÁSICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">El viaje de Chihiro</div>
                <div class="ow-card-meta">Anime · 2001</div>
                <span class="ow-genre-tag">Fantasía</span><span class="ow-genre-tag">Aventura</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="demon slayer mugen train" data-genero="acción fantasía">
        <div class="ow-card">
            <div class="ow-card-img bg-c3"><img class="ow-cover" data-mal="40456" alt="Demon Slayer Mugen Train" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">DS: Mugen Train</div>
                <div class="ow-card-meta">Anime · 2020</div>
                <span class="ow-genre-tag">Acción</span><span class="ow-genre-tag">Fantasía</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="one piece film red" data-genero="aventura acción">
        <div class="ow-card">
            <div class="ow-card-img bg-c6"><img class="ow-cover" data-mal="49365" alt="One Piece Film Red" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">One Piece Film Red</div>
                <div class="ow-card-meta">Anime · 2022</div>
                <span class="ow-genre-tag">Aventura</span><span class="ow-genre-tag">Acción</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="jujutsu kaisen 0" data-genero="acción sobrenatural">
        <div class="ow-card">
            <div class="ow-card-img bg-c2"><img class="ow-cover" data-mal="48561" alt="Jujutsu Kaisen 0" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Jujutsu Kaisen 0</div>
                <div class="ow-card-meta">Anime · 2021</div>
                <span class="ow-genre-tag">Acción</span><span class="ow-genre-tag">Sobrenatural</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="suzume" data-genero="aventura romance">
        <div class="ow-card">
            <div class="ow-card-img bg-c4"><img class="ow-cover" data-mal="51721" alt="Suzume" loading="lazy"><span class="ow-card-badge badge-nuevo">NUEVO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Suzume</div>
                <div class="ow-card-meta">Anime · 2022</div>
                <span class="ow-genre-tag">Aventura</span><span class="ow-genre-tag">Romance</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="princess mononoke" data-genero="fantasía aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c5"><img class="ow-cover" data-mal="164" alt="Princess Mononoke" loading="lazy"><span class="ow-card-badge badge-clasico">CLÁSICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Princess Mononoke</div>
                <div class="ow-card-meta">Anime · 1997</div>
                <span class="ow-genre-tag">Fantasía</span><span class="ow-genre-tag">Aventura</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="nausicaä del valle del viento" data-genero="ciencia ficción aventura">
        <div class="ow-card">
            <div class="ow-card-img bg-c10"><img class="ow-cover" data-mal="81" alt="Nausicaä del Valle del viento" loading="lazy"><span class="ow-card-badge badge-clasico">CLÁSICO</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Nausicaä del Valle</div>
                <div class="ow-card-meta">Anime · 1984</div>
                <span class="ow-genre-tag">Ciencia ficci&oacute;n</span><span class="ow-genre-tag">Aventura</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

    <div class="col peli-item" data-titulo="kimi no na wa" data-genero="romance fantasía">
        <div class="ow-card">
            <div class="ow-card-img bg-c8"><img class="ow-cover" data-mal="32281" alt="Kimi no Na wa" loading="lazy"><span class="ow-card-badge badge-popular">POPULAR</span></div>
            <div class="ow-card-body">
                <div class="ow-card-title">Kimi no Na wa</div>
                <div class="ow-card-meta">Anime · 2016</div>
                <span class="ow-genre-tag">Romance</span><span class="ow-genre-tag">Fantasía</span>
                <a href="#" class="ow-card-btn">▶ Ver ahora</a>
            </div>
        </div>
    </div>

</div>

<div class="ow-no-results" id="sinResultadosPelis">No se encontraron pel&iacute;culas para tu b&uacute;squeda.</div>

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
        document.getElementById('contadorPelis').textContent = visibles + ' película' + (visibles !== 1 ? 's' : '');
    }

    function limpiarPelis() {
        document.getElementById('busqPelis').value = '';
        generoActivo = '';
        document.querySelectorAll('.ow-filter-tab').forEach((b,i) => b.classList.toggle('active', i === 0));
        aplicarFiltros('', '');
    }
</script>

<%@include file="/lib/footer.jsp" %>
