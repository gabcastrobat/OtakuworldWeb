<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario"%>
<%
    // Si ya hay sesion activa, redirigir al inicio
    Usuario activo = (Usuario) session.getAttribute("usuarioActivo");
    if (activo != null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }

    String error      = (String) request.getAttribute("error");
    String registrado = request.getParameter("registrado");
%>
<jsp:include page="lib/header.jsp" />

<div class="auth-wrapper">
    <div class="auth-card">

        <div class="auth-brand">OtakuWorld</div>
        <div class="auth-subtitle">Inicio de sesion</div>

        <!-- Mensaje de exito tras registro -->
        <% if ("ok".equals(registrado)) { %>
        <div class="ow-alert" style="background:rgba(20,180,80,.15);border-color:#22c55e;color:#86efac;display:block;">
            Cuenta creada. Ya puedes iniciar sesion.
        </div>
        <% } %>

        <!-- Error del servidor -->
        <% if (error != null) { %>
        <div class="ow-alert show"><%= error %></div>
        <% } %>

        <form id="loginForm" method="post" action="Login">

            <div class="mb-3">
                <label for="usuario" class="form-label">Usuario o correo</label>
                <input type="text" class="form-control" id="usuario"
                       name="usuario" placeholder="Tu nombre o tu@correo.com" required
                       autocomplete="username">
            </div>

            <div class="mb-3">
                <label for="clave" class="form-label">Contrasena</label>
                <div class="pass-wrap">
                    <input type="password" class="form-control" id="clave"
                           name="clave" placeholder="* * * * * * * *"
                           style="padding-right:2.4rem" required
                           autocomplete="current-password">
                    <button type="button" class="pass-toggle"
                            onclick="togglePass('clave', this)">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2">
                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                    </button>
                </div>
            </div>

            <div class="mb-2 mt-4">
                <button type="submit" class="btn-auth-primary">Ingresar</button>
            </div>

        </form>

        <div class="auth-divider">o</div>

        <button class="btn-auth-secondary" onclick="window.location='Registro'">
            Crear cuenta nueva
        </button>

        <a href="#" style="display:block;text-align:center;color:var(--ow-peach);
                           font-size:.85rem;margin-top:1rem;opacity:.8;text-decoration:none;"
           onclick="alert('Recuperacion de contrasena en construccion.'); return false;">
            Olvide mi contrasena
        </a>

    </div>
</div>

<script>
function togglePass(id, btn) {
    const inp = document.getElementById(id);
    inp.type  = inp.type === 'password' ? 'text' : 'password';
}
</script>

<jsp:include page="lib/footer.jsp" />
