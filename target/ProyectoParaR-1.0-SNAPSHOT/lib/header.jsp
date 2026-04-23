<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-419">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400&family=Outfit:wght@500;600;700;800&display=swap" rel="stylesheet">
    <title>OtakuWorld</title>
    <style>
        :root {
            --ow-bg:      #254252;
            --ow-bg-dark: #171c2d;
            --ow-orange:  #e37239;
            --ow-peach:   #f9982f;
            --ow-cream:   #eab56f;
            --ow-text:    #f0e6d3;
            --ow-font-text: "Nunito", ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            --ow-font-display: "Outfit", ui-sans-serif, system-ui, sans-serif;
        }
        html { font-size: 16px; }
        body {
            background-color: var(--ow-bg-dark);
            color: var(--ow-text);
            font-family: var(--ow-font-text);
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.55;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        h1, h2, h3, h4, h5, h6,
        .ow-font-display { font-family: var(--ow-font-display); }

        input, button, select, textarea, .btn { font-family: inherit; }
        footer, footer p { font-family: var(--ow-font-text); }

        /* ── NAVBAR estilo Crunchyroll ── */
        .ow-navbar { background-color: #0d1117; border-bottom: 3px solid var(--ow-orange); padding: 0 1.2rem; min-height: 56px; }
        .ow-navbar .navbar-brand { font-family: var(--ow-font-display); font-size: 1.55rem; font-weight: 700; color: var(--ow-orange) !important; letter-spacing: 0.04em; padding: 0; margin-right: 1.4rem; }
        .ow-navbar .navbar-brand span { color: var(--ow-cream); }
        .ow-navbar .nav-link { color: #c8c8d0 !important; font-weight: 600; font-size: 0.9375rem; padding: 1rem 0.85rem !important; border-bottom: 3px solid transparent; border-radius: 0; transition: color 0.15s, border-color 0.15s; white-space: nowrap; }
        .ow-navbar .nav-link:hover, .ow-navbar .nav-link.active { color: #fff !important; border-bottom-color: var(--ow-orange); }
        .ow-navbar .dropdown-menu { background-color: #1a1f2e; border: 1px solid rgba(227,114,57,0.35); border-top: 3px solid var(--ow-orange); border-radius: 0 0 10px 10px; padding: 0.5rem 0; margin-top: 0 !important; min-width: 210px; box-shadow: 0 8px 24px rgba(0,0,0,0.5); }
        .ow-navbar .dropdown-item { color: #c8c8d0; font-size: 0.9rem; padding: 0.55rem 1.2rem; transition: background 0.15s, color 0.15s; }
        .ow-navbar .dropdown-item:hover { background: rgba(227,114,57,0.12); color: #fff; }
        .ow-navbar .dropdown-divider { border-color: rgba(227,114,57,0.2); margin: 0.3rem 0.8rem; }
        .ow-badge-new { font-size: 0.6rem; background: var(--ow-orange); color: #0d1117; padding: 1px 5px; border-radius: 6px; font-weight: 800; vertical-align: middle; margin-left: 5px; letter-spacing: 0.5px; }
        .ow-navbar .search-wrap { display: flex; align-items: center; background: rgba(255,255,255,0.07); border: 1px solid rgba(255,255,255,0.12); border-radius: 20px; padding: 0 4px 0 12px; height: 34px; transition: border-color 0.2s; }
        .ow-navbar .search-wrap:focus-within { border-color: var(--ow-orange); background: rgba(255,255,255,0.1); }
        .ow-navbar .search-wrap input { background: transparent; border: none; color: #fff; font-size: 0.9rem; width: 180px; outline: none; font-family: var(--ow-font-text); }
        .ow-navbar .search-wrap input::placeholder { color: rgba(200,200,208,0.45); }
        .ow-navbar .search-wrap button { background: none; border: none; color: rgba(200,200,208,0.6); font-size: 0.9rem; padding: 0 6px; cursor: pointer; transition: color 0.15s; }
        .ow-navbar .search-wrap button:hover { color: var(--ow-orange); }
        .nav-actions { display: flex; align-items: center; gap: 6px; margin-left: 1rem; }
        .btn-ow-login { background: transparent; border: 1.5px solid rgba(200,200,208,0.4); color: #c8c8d0; border-radius: 6px; font-weight: 600; font-size: 0.875rem; padding: 0.28rem 0.9rem; transition: all 0.18s; white-space: nowrap; text-decoration: none; font-family: var(--ow-font-text); }
        .btn-ow-login:hover { border-color: #fff; color: #fff; }
        .btn-ow-register { background: var(--ow-orange); border: none; color: #0d1117; border-radius: 6px; font-weight: 700; font-size: 0.875rem; padding: 0.3rem 1rem; transition: background 0.18s; white-space: nowrap; text-decoration: none; font-family: var(--ow-font-text); }
        .btn-ow-register:hover { background: var(--ow-peach); color: #0d1117; }
        .navbar-toggler { border-color: rgba(227,114,57,0.5); padding: 4px 8px; }
        .navbar-toggler-icon { filter: invert(55%) sepia(70%) saturate(500%) hue-rotate(340deg); }
        .ow-main { padding-top: 1.5rem; padding-bottom: 3rem; }

        .auth-wrapper {
            min-height: calc(100vh - 140px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }
        .auth-card {
            width: 100%;
            max-width: 400px;
            background: var(--ow-bg);
            border: 1px solid rgba(227,114,57,0.35);
            border-top: 3px solid var(--ow-orange);
            border-radius: 14px;
            padding: 2rem 1.75rem;
            box-shadow: 0 12px 40px rgba(0,0,0,0.45);
        }
        .auth-brand {
            font-family: var(--ow-font-display);
            font-size: 1.85rem;
            font-weight: 800;
            color: var(--ow-orange);
            text-align: center;
            margin-bottom: 0.25rem;
            letter-spacing: 0.02em;
        }
        .auth-subtitle {
            font-family: var(--ow-font-text);
            font-size: 1rem;
            font-weight: 600;
            color: var(--ow-cream);
            text-align: center;
            margin-bottom: 1.5rem;
        }
        .auth-card .form-label { color: #fff; font-weight: 600; font-size: 0.9rem; font-family: var(--ow-font-text); }
        .auth-card .form-control {
            background: #111827;
            border: 1px solid rgba(249,152,47,0.45);
            color: #fff;
            border-radius: 8px;
            font-family: var(--ow-font-text);
            font-size: 0.95rem;
        }
        .auth-card .form-control::placeholder { color: rgba(255,255,255,0.35); }
        .auth-card .form-control:focus { border-color: var(--ow-orange); box-shadow: 0 0 0 3px rgba(227,114,57,0.2); color: #fff; background: #111827; }
        .btn-auth-primary {
            width: 100%;
            background: var(--ow-orange);
            color: #0d1117;
            border: none;
            border-radius: 8px;
            font-family: var(--ow-font-text);
            font-weight: 700;
            font-size: 1rem;
            padding: 0.55rem;
            transition: background 0.2s;
        }
        .btn-auth-primary:hover { background: var(--ow-peach); }
        .btn-auth-secondary {
            width: 100%;
            background: transparent;
            color: var(--ow-cream);
            border: 1px solid rgba(234,181,111,0.45);
            border-radius: 8px;
            font-family: var(--ow-font-text);
            font-weight: 600;
            font-size: 0.95rem;
            padding: 0.5rem;
            margin-top: 0.5rem;
            transition: border-color 0.2s, color 0.2s;
        }
        .btn-auth-secondary:hover { border-color: var(--ow-cream); color: #fff; }
        .auth-divider {
            text-align: center;
            color: rgba(240,230,211,0.35);
            font-size: 0.8rem;
            margin: 1rem 0;
            font-family: var(--ow-font-text);
        }
        .ow-alert {
            display: none;
            background: rgba(227,114,57,0.15);
            border: 1px solid var(--ow-orange);
            color: #ffd8b0;
            border-radius: 8px;
            padding: 0.6rem 1rem;
            font-size: 0.9rem;
            margin-bottom: 1rem;
            font-family: var(--ow-font-text);
        }
        .ow-alert.show { display: block; }
        .pass-wrap { position: relative; }
        .pass-toggle {
            position: absolute;
            right: 8px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: rgba(255,255,255,0.45);
            cursor: pointer;
            padding: 0.25rem;
        }
        .pass-toggle:hover { color: var(--ow-orange); }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg ow-navbar sticky-top">
    <div class="container-xl px-2">
        <a class="navbar-brand" href="index.jsp">⛩&nbsp;<span>Otaku</span>World</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#owNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="owNav">
            <ul class="navbar-nav me-auto align-items-lg-stretch mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" href="index.jsp">Inicio</a></li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Series</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="series.jsp">📺 Todas las series</a></li>
                        <li><a class="dropdown-item" href="series.jsp">🌟 Novedades <span class="ow-badge-new">NUEVO</span></a></li>
                        <li><a class="dropdown-item" href="series.jsp">🔥 Más populares</a></li>
                        <li><hr class="dropdown-divider"></li>

                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Películas</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="peliculas.jsp">🎬 Todas las películas</a></li>
                        <li><a class="dropdown-item" href="peliculas.jsp">🌟 Estrenos <span class="ow-badge-new">NUEVO</span></a></li>
                        <li><a class="dropdown-item" href="peliculas.jsp">🔥 Más populares</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="peliculas.jsp">💥 Acción</a></li>
                        <li><a class="dropdown-item" href="peliculas.jsp">🌸 Romance</a></li>
                        <li><a class="dropdown-item" href="peliculas.jsp">🐉 Fantasía</a></li>
                    </ul>
                </li>

                <li class="nav-item"><a class="nav-link" href="planes.jsp">Planes</a></li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        📋 Mi Lista
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="MiLista">📋 Ver toda mi lista</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="MiLista#tab-series">📺 Series guardadas</a></li>
                        <li><a class="dropdown-item" href="MiLista#tab-peliculas">🎬 Peliculas guardadas</a></li>
                    </ul>
                </li>
            </ul>

            <div class="search-wrap me-3">
                <input type="text" placeholder="Buscar anime o película…" lang="es-419">
                <button type="button">🔍</button>
            </div>

            <div class="nav-actions">
                <a href="login.jsp" class="btn-ow-login">Iniciar sesión</a>
                <a href="registro.jsp" class="btn-ow-register">Registrarse</a>
            </div>
        </div>
    </div>
</nav>

<div class="container-xl ow-main px-3">
