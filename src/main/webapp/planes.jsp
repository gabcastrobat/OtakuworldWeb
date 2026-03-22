<%@include file="/lib/header.jsp" %>
<link rel="stylesheet" href="styles/otaku.css">

<style>
.planes-hero {
    text-align: center; padding: 2.5rem 1rem 2rem;
    background: linear-gradient(180deg, rgba(23,28,45,0) 0%, rgba(23,28,45,0) 100%);
}
.planes-hero h1 { font-family:'Rajdhani',sans-serif; font-size:2.4rem; font-weight:700; color:#fff; margin-bottom:0.5rem; }
.planes-hero p  { color:var(--ow-muted); font-size:1rem; max-width:520px; margin:0 auto; }

.planes-grid { display:grid; grid-template-columns:repeat(auto-fit,minmax(220px,1fr)); gap:1.2rem; margin-top:2.5rem; }

/* Tabla comparativa */
.compare-table { width:100%; border-collapse:collapse; margin-top:3rem; }
.compare-table th { background:rgba(227,114,57,0.15); color:var(--ow-orange); font-family:'Rajdhani',sans-serif; font-size:1rem; font-weight:700; padding:1rem; text-align:center; border:1px solid rgba(227,114,57,0.2); }
.compare-table th:first-child { text-align:left; }
.compare-table td { padding:0.85rem 1rem; border:1px solid rgba(255,255,255,0.06); color:var(--ow-text); font-size:0.88rem; text-align:center; }
.compare-table td:first-child { text-align:left; color:var(--ow-cream); font-weight:600; }
.compare-table tr:nth-child(even) td { background:rgba(255,255,255,0.025); }
.compare-table tr:hover td { background:rgba(227,114,57,0.06); }
.check { color:#22c55e; font-size:1rem; }
.cross { color:rgba(255,255,255,0.2); font-size:1rem; }

.section-title-alt { font-family:'Rajdhani',sans-serif; font-size:1.4rem; font-weight:700; color:var(--ow-orange); text-align:center; margin:3rem 0 1.5rem; }
</style>

<!-- Hero -->
<div class="planes-hero">
    <h1>💎 Elige tu plan</h1>
    <p>Disfruta de todo el anime que quieras. Cancela cuando quieras. Sin compromisos.</p>
</div>

<!-- Cards de planes — datos de Pantalla.java / PESTAÑA INICIO modeloPlanes -->
<div class="planes-grid">

    <!-- Básico: $19.900/mes · 1 pantalla -->
    <div class="plan-card">
        <div class="plan-name">Básico</div>
        <div class="plan-price">$19.900 <small>/mes</small></div>
        <div class="plan-desc">Películas y series estándar</div>
        <div class="plan-screens">📺&nbsp; 1 pantalla</div>
        <button class="btn-plan-ghost" onclick="elegirPlan('Básico')">Elegir plan</button>
    </div>

    <!-- Estándar: $29.900/mes · 2 pantallas -->
    <div class="plan-card">
        <div class="plan-name">Estándar</div>
        <div class="plan-price">$29.900 <small>/mes</small></div>
        <div class="plan-desc">Todo Básico + HD</div>
        <div class="plan-screens">📺📺&nbsp; 2 pantallas</div>
        <button class="btn-plan-ghost" onclick="elegirPlan('Estándar')">Elegir plan</button>
    </div>

    <!-- Premium (featured): $39.900/mes · 4 pantallas -->
    <div class="plan-card featured">
        <div class="plan-recommended">MEJOR</div>
        <div class="plan-name">Premium</div>
        <div class="plan-price">$39.900 <small>/mes</small></div>
        <div class="plan-desc">Todo Estándar + 4K</div>
        <div class="plan-screens">📺📺📺📺&nbsp; 4 pantallas</div>
        <button class="btn-plan" onclick="elegirPlan('Premium')">Elegir plan</button>
    </div>

    <!-- Familia: $49.900/mes · 6 pantallas -->
    <div class="plan-card">
        <div class="plan-name">Familia</div>
        <div class="plan-price">$49.900 <small>/mes</small></div>
        <div class="plan-desc">Todo Premium + contenido infantil</div>
        <div class="plan-screens">📺×6&nbsp; 6 pantallas</div>
        <button class="btn-plan-ghost" onclick="elegirPlan('Familia')">Elegir plan</button>
    </div>

</div>

<!-- Tabla comparativa detallada -->
<div class="section-title-alt">¿Qué incluye cada plan?</div>

<div class="table-responsive">
<table class="compare-table">
    <thead>
        <tr>
            <th>Característica</th>
            <th>Básico</th>
            <th>Estándar</th>
            <th>Premium</th>
            <th>Familia</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Precio mensual</td>
            <td>$19.900</td>
            <td>$29.900</td>
            <td>$39.900</td>
            <td>$49.900</td>
        </tr>
        <tr>
            <td>Pantallas simultáneas</td>
            <td>1</td>
            <td>2</td>
            <td>4</td>
            <td>6</td>
        </tr>
        <tr>
            <td>Calidad de video</td>
            <td>SD</td>
            <td>HD</td>
            <td>4K</td>
            <td>4K</td>
        </tr>
        <tr>
            <td>Películas y series</td>
            <td><span class="check">✓</span></td>
            <td><span class="check">✓</span></td>
            <td><span class="check">✓</span></td>
            <td><span class="check">✓</span></td>
        </tr>
        <tr>
            <td>Contenido HD</td>
            <td><span class="cross">✗</span></td>
            <td><span class="check">✓</span></td>
            <td><span class="check">✓</span></td>
            <td><span class="check">✓</span></td>
        </tr>
        <tr>
            <td>Contenido 4K Ultra HD</td>
            <td><span class="cross">✗</span></td>
            <td><span class="cross">✗</span></td>
            <td><span class="check">✓</span></td>
            <td><span class="check">✓</span></td>
        </tr>
        <tr>
            <td>Contenido infantil</td>
            <td><span class="cross">✗</span></td>
            <td><span class="cross">✗</span></td>
            <td><span class="cross">✗</span></td>
            <td><span class="check">✓</span></td>
        </tr>
    </tbody>
</table>
</div>

<script>
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
