<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario"%>
<%
    // Si ya hay sesion activa, redirigir al inicio
    Usuario activo = (Usuario) session.getAttribute("usuarioActivo");
    if (activo != null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
    String error = (String) request.getAttribute("error");
%>
<jsp:include page="lib/header.jsp" />

<style>
    .reg-wrapper {
        min-height: calc(100vh - 130px);
        display: flex; align-items: center; justify-content: center;
        padding: 2rem 1rem;
    }
    .reg-card {
        background: #1e2d3d;
        border: 1px solid rgba(227,114,57,0.55);
        border-top: 3px solid var(--ow-orange);
        border-radius: 14px;
        padding: 2.2rem 2rem;
        width: 100%; max-width: 420px;
        box-shadow: 0 12px 40px rgba(0,0,0,0.6);
    }
    .reg-brand {
        font-family: var(--ow-font-display);
        font-size: 2rem; font-weight: 700;
        color: var(--ow-orange);
        text-align: center; margin-bottom: 0.15rem;
    }
    .reg-brand span { color: #f5d8a8; }
    .reg-subtitle {
        font-family: var(--ow-font-text);
        color: #f5d8a8;
        text-align: center; font-size: 1rem; font-weight: 700;
        margin-bottom: 1.6rem;
    }
    .reg-card .form-label {
        font-family: var(--ow-font-text);
        color: #ffffff; font-weight: 700; font-size: 0.9rem; margin-bottom: 0.3rem;
    }
    .reg-card .form-control {
        font-family: var(--ow-font-text);
        background: #111827;
        border: 1.5px solid rgba(249,152,47,0.55);
        color: #fff; border-radius: 8px;
        padding: 0.6rem 0.9rem; font-size: 0.95rem;
    }
    .reg-card .form-control::placeholder { color: rgba(255,255,255,0.3); }
    .reg-card .form-control:focus {
        background: #111827; border-color: var(--ow-orange); color: #fff;
        box-shadow: 0 0 0 3px rgba(227,114,57,0.22);
    }
    .reg-card .form-text { color: #a0b4c8; font-size: 0.8rem; }

    /* Avatar preview */
    .avatar-preview-wrap {
        display: flex; align-items: center; gap: 1rem; margin-bottom: 0.5rem;
    }
    .avatar-preview {
        width: 56px; height: 56px; border-radius: 50%;
        background: var(--ow-orange);
        display: flex; align-items: center; justify-content: center;
        font-family: var(--ow-font-display); font-size: 1.4rem; font-weight: 800;
        color: #0d1117; overflow: hidden; flex-shrink: 0;
        border: 2px solid rgba(227,114,57,0.5);
    }
    .avatar-preview img { width: 100%; height: 100%; object-fit: cover; }
    .avatar-label {
        background: transparent;
        border: 1px solid rgba(227,114,57,0.5);
        color: var(--ow-cream); border-radius: 6px;
        padding: 0.3rem 0.85rem; font-size: 0.82rem; font-weight: 600;
        cursor: pointer; transition: all 0.18s; font-family: var(--ow-font-text);
    }
    .avatar-label:hover { border-color: var(--ow-orange); color: #fff; }
    #avatarInput { display: none; }

    .btn-reg-primary {
        font-family: var(--ow-font-text);
        background: var(--ow-orange); color: #0d1117;
        border: none; border-radius: 8px;
        font-weight: 700; font-size: 1rem;
        padding: 0.62rem; width: 100%;
        transition: background 0.2s; cursor: pointer;
    }
    .btn-reg-primary:hover { background: var(--ow-peach); }
    .btn-reg-back {
        font-family: var(--ow-font-text);
        background: transparent;
        border: 1.5px solid rgba(255,255,255,0.35);
        color: #e0e0e0; border-radius: 8px;
        font-weight: 600; font-size: 0.95rem;
        padding: 0.58rem; width: 100%;
        transition: all 0.2s; cursor: pointer;
    }
    .btn-reg-back:hover { border-color: var(--ow-orange); color: var(--ow-orange); }
    .reg-divider {
        display: flex; align-items: center; gap: 10px;
        margin: 1rem 0; color: rgba(255,255,255,0.3); font-size: 0.82rem;
    }
    .reg-divider::before, .reg-divider::after {
        content: ''; flex: 1; height: 1px; background: rgba(255,255,255,0.12);
    }
    .ow-alert { display:none; background:rgba(227,114,57,.18); border:1px solid var(--ow-orange);
                color:#ffd8b0; border-radius:8px; padding:.6rem 1rem; font-size:.9rem; margin-bottom:1rem; }
    .ow-alert.show { display:block; }
    .pass-wrap { position: relative; }
    .pass-toggle {
        position:absolute; right:10px; top:50%; transform:translateY(-50%);
        background:none; border:none; color:rgba(255,255,255,0.5); cursor:pointer; font-size:1rem; padding:0;
    }
    .pass-toggle:hover { color: var(--ow-orange); }
</style>

<div class="reg-wrapper">
    <div class="reg-card">

        <div class="reg-brand"><span>Otaku</span>World</div>
        <div class="reg-subtitle">Crear cuenta</div>

        <% if (error != null) { %>
        <div class="ow-alert show"><%= error %></div>
        <% } %>

        <!-- enctype multipart para poder subir la foto -->
        <form id="regForm" method="post" action="Registro" enctype="multipart/form-data">

            <!-- Avatar opcional -->
            <div class="mb-3">
                <label class="form-label">Foto de perfil <span style="opacity:.5;font-weight:400">(opcional)</span></label>
                <div class="avatar-preview-wrap">
                    <div class="avatar-preview" id="avatarPreview">
                        <span id="avatarInicial">?</span>
                    </div>
                    <label class="avatar-label" for="avatarInput">Subir imagen</label>
                    <input type="file" id="avatarInput" name="avatar"
                           accept="image/png, image/jpeg, image/webp, image/gif">
                </div>
                <div class="form-text">PNG, JPG o WEBP. Max 2 MB.</div>
            </div>

            <div class="mb-3">
                <label for="regNombre" class="form-label">Nombre de usuario</label>
                <input type="text" class="form-control" id="regNombre"
                       name="nombre" placeholder="Elige un nombre unico" required
                       autocomplete="username">
            </div>

            <div class="mb-3">
                <label for="regCorreo" class="form-label">Correo electronico</label>
                <input type="email" class="form-control" id="regCorreo"
                       name="correo" placeholder="tu@correo.com" required
                       autocomplete="email">
                <div class="form-text">Nunca compartimos tu correo.</div>
            </div>

            <div class="mb-4">
                <label for="regClave" class="form-label">Contrasena</label>
                <div class="pass-wrap">
                    <input type="password" class="form-control" id="regClave"
                           name="clave" placeholder="Minimo 4 caracteres"
                           required minlength="4" style="padding-right:2.4rem"
                           autocomplete="new-password">
                    <button type="button" class="pass-toggle"
                            onclick="togglePass('regClave', this)">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2">
                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                    </button>
                </div>
            </div>

            <button type="submit" class="btn-reg-primary mb-2">Registrarse</button>

        </form>

        <div class="reg-divider">Ya tienes cuenta?</div>

        <button class="btn-reg-back" onclick="window.location='Login'">
            Volver al inicio de sesion
        </button>

    </div>
</div>

<script>
// Preview del avatar en tiempo real
const avatarInput    = document.getElementById('avatarInput');
const avatarPreview  = document.getElementById('avatarPreview');
const avatarInicial  = document.getElementById('avatarInicial');
const correoInput    = document.getElementById('regCorreo');

// Actualizar inicial cuando escribe el correo
correoInput.addEventListener('input', function() {
    if (!avatarInput.files || !avatarInput.files[0]) {
        const inicial = this.value.trim().charAt(0).toUpperCase() || '?';
        avatarInicial.textContent = inicial;
    }
});

// Mostrar preview de la imagen
avatarInput.addEventListener('change', function() {
    const file = this.files[0];
    if (!file) return;
    if (file.size > 2 * 1024 * 1024) {
        alert('La imagen supera los 2 MB.');
        this.value = '';
        return;
    }
    const reader = new FileReader();
    reader.onload = function(e) {
        avatarPreview.innerHTML = '<img src="' + e.target.result + '" alt="avatar">';
    };
    reader.readAsDataURL(file);
});

function togglePass(id) {
    const inp = document.getElementById(id);
    inp.type  = inp.type === 'password' ? 'text' : 'password';
}
</script>

<jsp:include page="lib/footer.jsp" />
