<%@include file="/lib/header.jsp" %>
<link rel="stylesheet" href="styles/otaku.css">

<style>
    /* ?? Hero ?? */
    .planes-hero {
        text-align: center;
        padding: 3rem 1rem 2.5rem;
    }
    .planes-hero h1 {
        font-family: var(--ow-font-display);
        font-size: 2.8rem;
        font-weight: 800;
        color: #fff;
        margin-bottom: 0.5rem;
        letter-spacing: 0.02em;
    }
    .planes-hero p {
        font-family: var(--ow-font-text);
        color: rgba(200,200,208,0.75);
        font-size: 1rem;
        max-width: 480px;
        margin: 0 auto;
        line-height: 1.6;
    }

    /* ?? Grid de planes ?? */
    .planes-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 0;
        max-width: 960px;
        margin: 2.5rem auto 0;
        align-items: start;
    }
    @media (max-width: 768px) {
        .planes-grid { grid-template-columns: 1fr; max-width: 400px; gap: 1.2rem; }
        .plan-card.featured { transform: none; }
    }

    /* ?? Card base ?? */
    .plan-card {
        background: #0f1420;
        border: 1px solid rgba(255,255,255,0.08);
        border-radius: 4px;
        padding: 2rem 1.6rem 2rem;
        position: relative;
        transition: border-color 0.2s;
    }
    .plan-card:hover { border-color: rgba(227,114,57,0.4); }

    /* ?? Card destacada (centro) ?? */
    .plan-card.featured {
        background: #0f1420;
        border: 2px solid var(--ow-orange);
        border-radius: 4px;
        transform: scaleY(1.03);
        transform-origin: top center;
        z-index: 2;
        padding-top: 1.4rem;
        padding-bottom: 2.2rem;
    }
    .plan-featured-label {
        display: block;
        font-family: var(--ow-font-display);
        font-size: 0.72rem;
        font-weight: 800;
        letter-spacing: 0.12em;
        color: var(--ow-orange);
        text-align: center;
        margin-bottom: 0.8rem;
        text-transform: uppercase;
    }

    /* ?? Nombre del plan ?? */
    .plan-name {
        font-family: var(--ow-font-display);
        font-size: 1.55rem;
        font-weight: 800;
        color: #fff;
        text-align: center;
        text-transform: uppercase;
        letter-spacing: 0.04em;
        margin-bottom: 0.5rem;
    }

    /* ?? Precio ?? */
    .plan-price {
        font-family: var(--ow-font-display);
        font-size: 2.1rem;
        font-weight: 800;
        color: #fff;
        text-align: center;
        line-height: 1.1;
    }
    .plan-price small {
        font-size: 1rem;
        font-weight: 500;
        color: rgba(240,230,211,0.6);
    }
    .plan-taxes {
        font-family: var(--ow-font-text);
        font-size: 0.7rem;
        font-weight: 600;
        letter-spacing: 0.08em;
        color: rgba(200,200,208,0.45);
        text-align: center;
        text-transform: uppercase;
        margin-bottom: 1.4rem;
    }

    /* ?? Botones ?? */
    .btn-plan-primary {
        display: block;
        width: 100%;
        background: var(--ow-orange);
        color: #0d1117;
        border: none;
        border-radius: 4px;
        font-family: var(--ow-font-display);
        font-size: 0.82rem;
        font-weight: 800;
        letter-spacing: 0.06em;
        text-transform: uppercase;
        padding: 0.75rem 1rem;
        text-align: center;
        cursor: pointer;
        transition: background 0.18s;
    }
    .btn-plan-primary:hover { background: var(--ow-peach); color: #0d1117; }

    .btn-plan-outline {
        display: block;
        width: 100%;
        background: transparent;
        color: var(--ow-orange);
        border: 1.5px solid var(--ow-orange);
        border-radius: 4px;
        font-family: var(--ow-font-display);
        font-size: 0.82rem;
        font-weight: 800;
        letter-spacing: 0.06em;
        text-transform: uppercase;
        padding: 0.72rem 1rem;
        text-align: center;
        cursor: pointer;
        transition: background 0.18s, color 0.18s;
    }
    .btn-plan-outline:hover { background: rgba(227,114,57,0.12); }

    .btn-skip {
        display: block;
        text-align: center;
        font-family: var(--ow-font-text);
        font-size: 0.78rem;
        font-weight: 700;
        letter-spacing: 0.07em;
        text-transform: uppercase;
        color: rgba(200,200,208,0.5);
        margin-top: 0.7rem;
        cursor: pointer;
        transition: color 0.15s;
    }
    .btn-skip:hover { color: var(--ow-cream); }

    /* ?? Descripcion base ?? */
    .plan-base-desc {
        font-family: var(--ow-font-text);
        font-size: 0.85rem;
        color: rgba(240,230,211,0.75);
        line-height: 1.5;
        margin: 1.3rem 0 1rem;
    }

    /* ?? Divider PLUS ?? */
    .plan-plus-divider {
        display: flex;
        align-items: center;
        gap: 0.6rem;
        margin: 1rem 0 0.9rem;
        font-family: var(--ow-font-text);
        font-size: 0.7rem;
        font-weight: 700;
        letter-spacing: 0.1em;
        color: rgba(200,200,208,0.4);
    }
    .plan-plus-divider::before,
    .plan-plus-divider::after {
        content: '';
        flex: 1;
        height: 1px;
        background: rgba(255,255,255,0.1);
    }

    /* ?? Features list ?? */
    .plan-features {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    .plan-features li {
        font-family: var(--ow-font-text);
        font-size: 0.875rem;
        color: rgba(240,230,211,0.85);
        line-height: 1.4;
        padding: 0.35rem 0;
        display: flex;
        align-items: flex-start;
        gap: 0.6rem;
    }
    .plan-features li .feat-check {
        color: var(--ow-orange);
        flex-shrink: 0;
        margin-top: 1px;
        font-size: 0.85rem;
    }
    .plan-features li .feat-highlight {
        color: var(--ow-peach);
        font-weight: 700;
    }

    /* ?? Tabla comparativa ?? */
    .section-title-alt {
        font-family: var(--ow-font-display);
        font-size: 1.5rem;
        font-weight: 800;
        color: #fff;
        text-align: center;
        margin: 4rem 0 1.8rem;
        letter-spacing: 0.02em;
    }
    .compare-table {
        width: 100%;
        border-collapse: collapse;
        max-width: 960px;
        margin: 0 auto;
    }
    .compare-table thead th {
        background: rgba(227,114,57,0.1);
        color: var(--ow-orange);
        font-family: var(--ow-font-display);
        font-size: 0.95rem;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: 0.05em;
        padding: 1rem;
        text-align: center;
        border: 1px solid rgba(227,114,57,0.18);
    }
    .compare-table thead th:first-child {
        text-align: left;
        color: rgba(200,200,208,0.6);
        font-size: 0.8rem;
    }
    .compare-table td {
        font-family: var(--ow-font-text);
        padding: 0.85rem 1rem;
        border: 1px solid rgba(255,255,255,0.05);
        color: rgba(240,230,211,0.8);
        font-size: 0.88rem;
        text-align: center;
    }
    .compare-table td:first-child {
        text-align: left;
        color: var(--ow-cream);
        font-weight: 600;
        font-size: 0.9rem;
    }
    .compare-table tr:nth-child(even) td { background: rgba(255,255,255,0.02); }
    .compare-table tr:hover td { background: rgba(227,114,57,0.05); }
    .check { color: #4ade80; }
    .cross { color: rgba(255,255,255,0.15); }

    /* ?? Toast ?? */
    .ow-toast {
        position: fixed;
        bottom: 2rem;
        left: 50%;
        transform: translateX(-50%) translateY(120%);
        background: #1a1f2e;
        border: 1px solid var(--ow-orange);
        color: var(--ow-cream);
        font-family: var(--ow-font-text);
        font-size: 0.9rem;
        font-weight: 600;
        padding: 0.75rem 1.5rem;
        border-radius: 10px;
        box-shadow: 0 8px 24px rgba(0,0,0,0.5);
        z-index: 9999;
        transition: transform 0.3s cubic-bezier(.34,1.56,.64,1);
        white-space: nowrap;
    }
    .ow-toast.show { transform: translateX(-50%) translateY(0); }
</style>

<!-- Hero -->
<div class="planes-hero">
    <h1>Elige tu Plan</h1>
    <p>Todo el anime que quieras, sin anuncios. Cancela cuando desees.</p>
</div>

<!-- Grid de planes -->
<div class="planes-grid">

    <!-- Basico -->
    <div class="plan-card">
        <div class="plan-name">Básico</div>
        <div class="plan-price">$19.900 <small>/mes</small></div>
        <div class="plan-taxes">+ impuestos aplicables</div>
        <button class="btn-plan-outline" onclick="elegirPlan('Basico')">Iniciar prueba gratis</button>
        <a class="btn-skip" onclick="elegirPlan('Basico')">Omitir prueba gratuita</a>
        <p class="plan-base-desc">Accede a todo el catálogo de OtakuWorld sin anuncios, nuevos episodios poco después de Japón y manga digital.</p>
        <div class="plan-plus-divider">PLUS</div>
        <ul class="plan-features">
            <li><span class="feat-check">?</span> Streaming en <span class="feat-highlight">1 pantalla</span> a la vez</li>
            <li><span class="feat-check">?</span> Calidad SD</li>
        </ul>
    </div>

    <!-- Premium (destacado) -->
    <div class="plan-card featured">
        <span class="plan-featured-label">? Más Popular</span>
        <div class="plan-name">Premium</div>
        <div class="plan-price">$39.900 <small>/mes</small></div>
        <div class="plan-taxes">+ impuestos aplicables</div>
        <button class="btn-plan-primary" onclick="elegirPlan('Premium')">Iniciar prueba gratis</button>
        <a class="btn-skip" onclick="elegirPlan('Premium')">Omitir prueba gratuita</a>
        <p class="plan-base-desc">Accede a todo el catálogo de OtakuWorld sin anuncios, nuevos episodios poco después de Japón y manga digital.</p>
        <div class="plan-plus-divider">PLUS</div>
        <ul class="plan-features">
            <li><span class="feat-check">?</span> Streaming en <span class="feat-highlight">4 pantallas</span> a la vez</li>
            <li><span class="feat-check">?</span> Calidad <span class="feat-highlight">4K Ultra HD</span></li>
            <li><span class="feat-check">?</span> Descarga sin conexión</li>
            <li><span class="feat-check">?</span> $15.000 off en la Tienda cada 3 meses</li>
        </ul>
    </div>

    <!-- Familia -->
    <div class="plan-card">
        <div class="plan-name">Familia</div>
        <div class="plan-price">$49.900 <small>/mes</small></div>
        <div class="plan-taxes">+ impuestos aplicables</div>
        <button class="btn-plan-outline" onclick="elegirPlan('Familia')">Iniciar prueba gratis</button>
        <a class="btn-skip" onclick="elegirPlan('Familia')">Omitir prueba gratuita</a>
        <p class="plan-base-desc">Accede a todo el catálogo de OtakuWorld sin anuncios, nuevos episodios poco después de Japón y manga digital.</p>
        <div class="plan-plus-divider">PLUS</div>
        <ul class="plan-features">
            <li><span class="feat-check">?</span> Streaming en <span class="feat-highlight">6 pantallas</span> a la vez</li>
            <li><span class="feat-check">?</span> Calidad <span class="feat-highlight">4K Ultra HD</span></li>
            <li><span class="feat-check">?</span> Descarga sin conexión</li>
            <li><span class="feat-check">?</span> $25.000 off en la Tienda cada 3 meses</li>
            <li><span class="feat-check">?</span> Envío gratis en todos los pedidos</li>
            <li><span class="feat-check">?</span> Kit exclusivo tras 12 meses consecutivos</li>
        </ul>
    </div>

</div>

<script>
    function elegirPlan(nombre) {
        <%
            Modelo.Usuario usuarioPlan = (Modelo.Usuario) session.getAttribute("usuarioActivo");
            boolean logueado = (usuarioPlan != null);
        %>
        var estaLogueado = <%= logueado %>;
        if (estaLogueado) {
            showToast('¡Plan ' + nombre + ' seleccionado! Gracias por elegirnos ?');
        } else {
            if (confirm('Para elegir un plan necesitas iniciar sesión. ¿Quieres ir al inicio de sesión?')) {
                window.location.href = 'Login';
            }
        }
    }

    function showToast(msg) {
        var t = document.getElementById('owToast');
        t.textContent = msg;
        t.classList.add('show');
        setTimeout(function(){ t.classList.remove('show'); }, 3500);
    }
</script>

<%@include file="/lib/footer.jsp" %>
