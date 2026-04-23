package Servlets;

import Modelo.Usuario;
import Modelo.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet de inicio y cierre de sesion.
 *
 * GET  /Login         → muestra login.jsp
 * POST /Login         → valida credenciales
 * GET  /Login?logout  → cierra la sesion
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Logout
        if (request.getParameter("logout") != null) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        // Mostrar formulario de login
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String identificador = trim(request.getParameter("usuario"));  // nombre o correo
        String clave         = trim(request.getParameter("clave"));

        if (identificador.isEmpty() || clave.isEmpty()) {
            request.setAttribute("error", "Completa todos los campos.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        UsuarioDAO dao = (UsuarioDAO) getServletContext().getAttribute(AppListener.DAO_KEY);
        Usuario usuario = dao.login(identificador, clave);

        if (usuario == null) {
            request.setAttribute("error", "Usuario o contrasena incorrectos.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Crear sesion y guardar usuario
        HttpSession session = request.getSession(true);
        session.setAttribute("usuarioActivo", usuario);
        session.setMaxInactiveInterval(60 * 30);  // 30 minutos

        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    private String trim(String s) {
        return s == null ? "" : s.trim();
    }
}
