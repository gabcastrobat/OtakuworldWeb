package Servlets;

import Modelo.Usuario;
import Modelo.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

/**
 * Servlet de registro.
 * - GET  → muestra registro.jsp
 * - POST → procesa el formulario y redirige
 *
 * Acepta multipart para la foto de perfil (opcional).
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/Registro"})
@MultipartConfig(maxFileSize = 2 * 1024 * 1024)   // max 2 MB
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = trim(request.getParameter("nombre"));
        String correo = trim(request.getParameter("correo"));
        String clave  = trim(request.getParameter("clave"));

        // Validacion basica
        if (nombre.isEmpty() || correo.isEmpty() || clave.isEmpty()) {
            request.setAttribute("error", "Todos los campos son obligatorios.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
            return;
        }

        UsuarioDAO dao = (UsuarioDAO) getServletContext().getAttribute(AppListener.DAO_KEY);

        // Verificar duplicados
        if (dao.existeNombre(nombre)) {
            request.setAttribute("error", "Ese nombre de usuario ya existe.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
            return;
        }
        if (dao.existeCorreo(correo)) {
            request.setAttribute("error", "Ese correo ya esta registrado.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
            return;
        }

        // Registrar usuario
        Usuario nuevo = dao.registrar(nombre, correo, clave);
        if (nuevo == null) {
            request.setAttribute("error", "No se pudo completar el registro. Intenta de nuevo.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
            return;
        }

        // Procesar avatar opcional (archivo subido)
        try {
            Part fotoPart = request.getPart("avatar");
            if (fotoPart != null && fotoPart.getSize() > 0) {
                String contentType = fotoPart.getContentType();
                if (contentType != null && contentType.startsWith("image/")) {
                    // Guardamos la imagen como Base64 en el usuario
                    byte[] bytes = fotoPart.getInputStream().readAllBytes();
                    String base64 = java.util.Base64.getEncoder().encodeToString(bytes);
                    String dataUrl = "data:" + contentType + ";base64," + base64;
                    dao.actualizarAvatar(nuevo.getId(), dataUrl);
                    nuevo.setAvatarUrl(dataUrl);
                }
            }
        } catch (Exception ignored) {
            // Si falla la foto, el registro igual continua sin avatar
        }

        // Registro exitoso -> redirigir al login con mensaje
        response.sendRedirect(request.getContextPath() + "/Login?registrado=ok");
    }

    private String trim(String s) {
        return s == null ? "" : s.trim();
    }
}
