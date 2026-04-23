package Servlets;

import Modelo.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/RegistroServlet")
public class RegistroServlets extends HttpServlet {

    // Lista en memoria (temporal, mientras no hay BD)
    private static List<Usuario> usuarios = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("regUsuario");
        String correo = request.getParameter("regCorreo");
        String clave  = request.getParameter("regClave");

        // Validación básica
        if (nombre == null || nombre.isBlank() ||
            correo == null || correo.isBlank() ||
            clave  == null || clave.isBlank()) {

            request.setAttribute("error", "Completa todos los campos.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
            return;
        }

        // Verificar si el usuario ya existe
        boolean yaExiste = usuarios.stream()
                .anyMatch(u -> u.getNombre().equalsIgnoreCase(nombre));

        if (yaExiste) {
            request.setAttribute("error", "Ese nombre de usuario ya esta registrado.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
            return;
        }

        // Crear y guardar el usuario
        Usuario nuevo = new Usuario(nombre, correo, clave);
        usuarios.add(nuevo);

        // Redirigir al login con mensaje de exito
        response.sendRedirect(request.getContextPath() + "/login.jsp?registro=ok");
    }

    // Método público para que LoginServlet pueda acceder a la lista
    public static List<Usuario> getUsuarios() {
        return usuarios;
    }
}