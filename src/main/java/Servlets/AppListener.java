package Servlets;

import Modelo.UsuarioDAO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

/**
 * Se ejecuta cuando el servidor arranca.
 * Crea el UsuarioDAO y lo guarda en el contexto de la aplicacion
 * para que todos los servlets lo compartan.
 */
@WebListener
public class AppListener implements ServletContextListener {

    public static final String DAO_KEY = "usuarioDAO";

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext ctx = sce.getServletContext();
        ctx.setAttribute(DAO_KEY, new UsuarioDAO());
        System.out.println("[OtakuWorld] UsuarioDAO inicializado.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Nada que limpiar en este caso
    }
}
