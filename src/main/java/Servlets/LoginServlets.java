package Servlets;

import Modelo.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/LoginServlet")
public class LoginServlets extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("usuario");
        String clave  = request.getParameter("contrasena");

        // Admin hardcodeado (igual que antes, pero ahora en el servidor)
        boolean ok = ("admin".equals(nombre) && "1234".equals(clave));

        // Si no es admin, busca en la lista de registrados
        if (!ok) {
            List<Usuario> usuarios = RegistroServlets.getUsuarios();
            ok = usuarios.stream()
                    .anyMatch(u -> u.getNombre().equals(nombre)
                               && u.getClave().equals(clave));
        }

        if (ok) {
            // Crear sesión y guardar el usuario activo
            HttpSession session = request.getSession();
            session.setAttribute("usuarioActivo", nombre);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            request.setAttribute("error", "Usuario o contrasena incorrectos.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}