<%@include file="/lib/header.jsp" %>

<style>
    /* ── registro.jsp — colores corregidos para legibilidad ── */
    .reg-wrapper {
        min-height: calc(100vh - 130px);
        display: flex; align-items: center; justify-content: center;
        padding: 2rem 1rem;
    }

    .reg-card {
        background: #1e2d3d;                        /* fondo propio, más claro que bg-dark */
        border: 1px solid rgba(227,114,57,0.55);
        border-top: 3px solid var(--ow-orange);
        border-radius: 14px;
        padding: 2.2rem 2rem;
        width: 100%; max-width: 420px;
        box-shadow: 0 12px 40px rgba(0,0,0,0.6);
    }

    .reg-brand {
        font-family: 'Rajdhani', sans-serif;
        font-size: 2rem; font-weight: 700;
        color: var(--ow-orange);
        text-align: center; margin-bottom: 0.15rem;
    }
    .reg-brand span { color: #f5d8a8; }            /* crema más brillante */

    .reg-subtitle {
        color: #f5d8a8;
        text-align: center; font-size: 1rem; font-weight: 700;
        margin-bottom: 1.6rem;
        letter-spacing: 0.3px;
    }

    /* Labels — blanco puro para máxima legibilidad */
    .reg-card .form-label {
        color: #ffffff;
        font-weight: 700;
        font-size: 0.88rem;
        margin-bottom: 0.3rem;
    }

    /* Inputs — fondo oscuro pero diferenciado del card */
    .reg-card .form-control {
        background: #111827;
        border: 1.5px solid rgba(249,152,47,0.55);
        color: #fff;
        border-radius: 8px;
        padding: 0.6rem 0.9rem;
        font-size: 0.92rem;
    }
    .reg-card .form-control::placeholder { color: rgba(255,255,255,0.3); }
    .reg-card .form-control:focus {
        background: #111827;
        border-color: var(--ow-orange);
        color: #fff;
        box-shadow: 0 0 0 3px rgba(227,114,57,0.22);
    }

    /* Texto de ayuda — visible sobre fondo oscuro */
    .reg-card .form-text {
        color: #a0b4c8;
        font-size: 0.76rem;
    }

    /* Botón principal */
    .btn-reg-primary {
        background: var(--ow-orange);
        color: #0d1117;
        border: none; border-radius: 8px;
        font-weight: 800; font-size: 1rem;
        padding: 0.62rem; width: 100%;
        transition: background 0.2s, transform 0.1s;
        cursor: pointer;
    }
    .btn-reg-primary:hover  { background: var(--ow-peach); }
    .btn-reg-primary:active { transform: scale(0.98); }

    /* Botón secundario — borde sólido, texto blanco */
    .btn-reg-back {
        background: transparent;
        border: 1.5px solid rgba(255,255,255,0.35);
        color: #e0e0e0;
        border-radius: 8px;
        font-weight: 600; font-size: 0.9rem;
        padding: 0.58rem; width: 100%;
        transition: all 0.2s; cursor: pointer;
    }
    .btn-reg-back:hover {
        border-color: var(--ow-orange);
        color: var(--ow-orange);
        background: rgba(227,114,57,0.08);
    }

    /* Separador */
    .reg-divider {
        display: flex; align-items: center; gap: 10px;
        margin: 1rem 0; color: rgba(255,255,255,0.3); font-size: 0.78rem;
    }
    .reg-divider::before, .reg-divider::after {
        content: ''; flex: 1; height: 1px; background: rgba(255,255,255,0.12);
    }

    /* Alertas */
    .ow-alert {
        background: rgba(227,114,57,0.18);
        border: 1px solid var(--ow-orange);
        color: #ffd8b0;
        border-radius: 8px; padding: 0.6rem 1rem; font-size: 0.88rem;
        margin-bottom: 1rem; display: none;
    }
    .ow-alert.show { display: block; }
    .ow-success {
        background: rgba(20,180,80,0.15);
        border: 1px solid #22c55e;
        color: #86efac;
        border-radius: 8px; padding: 0.6rem 1rem; font-size: 0.88rem;
        margin-bottom: 1rem; display: none;
    }
    .ow-success.show { display: block; }

    /* Toggle contraseña */
    .pass-wrap { position: relative; }
    .pass-toggle {
        position: absolute; right: 10px; top: 50%; transform: translateY(-50%);
        background: none; border: none; color: rgba(255,255,255,0.5);
        cursor: pointer; font-size: 1rem; padding: 0;
    }
    .pass-toggle:hover { color: var(--ow-orange); }
</style>

<div class="reg-wrapper">
    <div class="reg-card">

        <div class="reg-brand">⛩ <span>Otaku</span>World</div>
        <div class="reg-subtitle">Crear cuenta</div>

        <div class="ow-alert" id="alertaReg">Por favor complete todos los campos.</div>
        <div class="ow-success" id="exito">¡Registro exitoso! Redirigiendo al login...</div>

        <form id="regForm" onsubmit="registrar(event)">

            <div class="mb-3">
                <label for="regUsuario" class="form-label">Nombre de usuario</label>
                <input type="text" class="form-control" id="regUsuario"
                       placeholder="Elige un nombre único" required>
            </div>

            <div class="mb-3">
                <label for="regCorreo" class="form-label">Correo electrónico</label>
                <input type="email" class="form-control" id="regCorreo"
                       placeholder="tu@correo.com" required>
                <div class="form-text">Nunca compartimos tu correo.</div>
            </div>

            <div class="mb-4">
                <label for="regClave" class="form-label">Contraseña</label>
                <div class="pass-wrap">
                    <input type="password" class="form-control" id="regClave"
                           placeholder="Mínimo 4 caracteres" required minlength="4"
                           style="padding-right:2.4rem">
                    <button type="button" class="pass-toggle"
                            onclick="togglePass('regClave', this)">👁</button>
                </div>
            </div>

            <button type="submit" class="btn-reg-primary mb-2">Registrarse</button>

        </form>

        <div class="reg-divider">¿Ya tienes cuenta?</div>

        <button class="btn-reg-back" onclick="window.location='login.jsp'">
            Volver al Login
        </button>

    </div>
</div>

<script>
    function registrar(e) {
        e.preventDefault();
        const usuario = document.getElementById('regUsuario').value.trim();
        const correo  = document.getElementById('regCorreo').value.trim();
        const clave   = document.getElementById('regClave').value.trim();
        if (!usuario || !correo || !clave) {
            document.getElementById('alertaReg').classList.add('show');
            return;
        }
        document.getElementById('alertaReg').classList.remove('show');
        const registrados = JSON.parse(sessionStorage.getItem('ow_usuarios') || '[]');
        registrados.push({ nombre: usuario, correo: correo, clave: clave });
        sessionStorage.setItem('ow_usuarios', JSON.stringify(registrados));
        document.getElementById('exito').classList.add('show');
        setTimeout(() => { window.location.href = 'login.jsp'; }, 1800);
    }
    function togglePass(id, btn) {
        const inp = document.getElementById(id);
        inp.type = inp.type === 'password' ? 'text' : 'password';
        btn.textContent = inp.type === 'password' ? '👁' : '🙈';
    }
</script>

<%@include file="/lib/footer.jsp" %>
