<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/lib/header.jsp" %>

<div class="auth-wrapper">
    <div class="auth-card">

        <div class="auth-brand">OtakuWorld</div>
        <div class="auth-subtitle">Inicio de sesi&oacute;n</div>

        <div class="ow-alert" id="alertaLogin">Usuario o contrase&ntilde;a incorrectos.</div>

        <form id="loginForm" onsubmit="validarLogin(event)">

            <div class="mb-3">
                <label for="usuario" class="form-label">Usuario</label>
                <input type="text" class="form-control" id="usuario"
                       name="usuario" placeholder="Tu nombre de usuario" required>
            </div>

            <div class="mb-3">
                <label for="contrasena" class="form-label">Contrase&ntilde;a</label>
                <div class="pass-wrap">
                    <input type="password" class="form-control" id="contrasena"
                           name="contrasena" placeholder="* * * * * * * *"
                           style="padding-right:2.4rem" required>
                    <button type="button" class="pass-toggle"
                            onclick="togglePass('contrasena',this)">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                    </button>
                </div>
            </div>

            <div class="mb-2 mt-4">
                <button type="submit" class="btn-auth-primary">Aceptar</button>
            </div>

        </form>

        <div class="auth-divider">o</div>

        <button class="btn-auth-secondary" onclick="window.location='registro.jsp'">
            Registrarse
        </button>

        <a href="#" style="display:block; text-align:center; color:var(--ow-peach); font-size:.85rem; margin-top:1rem; opacity:.8; text-decoration:none;"
           onclick="alert('Funci&oacute;n de recuperaci&oacute;n en construcci&oacute;n.'); return false;">
            Olvid&eacute; mi contrase&ntilde;a
        </a>

    </div>
</div>

<script>
function validarLogin(e) {
    e.preventDefault();
    const usuario    = document.getElementById('usuario').value.trim();
    const contrasena = document.getElementById('contrasena').value.trim();
    if (!usuario || !contrasena) return;
    let ok = (usuario === 'admin' && contrasena === '1234');
    if (!ok) {
        const reg = JSON.parse(sessionStorage.getItem('ow_usuarios') || '[]');
        ok = reg.some(u => u.nombre === usuario && u.clave === contrasena);
    }
    if (ok) {
        sessionStorage.setItem('ow_usuario_activo', usuario);
        window.location.href = 'index.jsp';
    } else {
        document.getElementById('alertaLogin').classList.add('show');
    }
}
function togglePass(id, btn) {
    const inp = document.getElementById(id);
    inp.type = inp.type === 'password' ? 'text' : 'password';
}
</script>

<%@include file="/lib/footer.jsp" %>
