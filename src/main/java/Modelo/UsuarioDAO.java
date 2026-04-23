package Modelo;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * DAO en memoria para usuarios.
 * En una app real esto iria contra base de datos.
 *
 * Se guarda como atributo del ServletContext (application scope)
 * para que todos los servlets compartan la misma lista.
 */
public class UsuarioDAO {

    private final List<Usuario>    usuarios  = new ArrayList<>();
    private final AtomicInteger    contador  = new AtomicInteger(1);

    // Usuario admin por defecto
    public UsuarioDAO() {
        Usuario admin = new Usuario(0, "admin", "admin@otakuworld.com", "1234", null);
        usuarios.add(admin);
    }

    // ── Registrar ────────────────────────────────────────────────────────────

    /**
     * Agrega un usuario nuevo. Devuelve null si el nombre o correo ya existe.
     */
    public synchronized Usuario registrar(String nombre, String correo, String clave) {
        boolean duplicado = usuarios.stream()
            .anyMatch(u -> u.getNombre().equalsIgnoreCase(nombre)
                       || u.getCorreo().equalsIgnoreCase(correo));
        if (duplicado) return null;

        Usuario u = new Usuario(contador.getAndIncrement(), nombre, correo, clave, null);
        usuarios.add(u);
        return u;
    }

    // ── Login ────────────────────────────────────────────────────────────────

    /**
     * Busca por nombre de usuario O correo + clave.
     * Devuelve el Usuario si coincide, null si no.
     */
    public synchronized Usuario login(String identificador, String clave) {
        return usuarios.stream()
            .filter(u -> (u.getNombre().equalsIgnoreCase(identificador)
                       || u.getCorreo().equalsIgnoreCase(identificador))
                      && u.getClave().equals(clave))
            .findFirst()
            .orElse(null);
    }

    // ── Actualizar avatar ─────────────────────────────────────────────────────

    public synchronized void actualizarAvatar(int id, String avatarUrl) {
        usuarios.stream()
            .filter(u -> u.getId() == id)
            .findFirst()
            .ifPresent(u -> u.setAvatarUrl(avatarUrl));
    }

    // ── Consultas ─────────────────────────────────────────────────────────────

    public synchronized boolean existeNombre(String nombre) {
        return usuarios.stream().anyMatch(u -> u.getNombre().equalsIgnoreCase(nombre));
    }

    public synchronized boolean existeCorreo(String correo) {
        return usuarios.stream().anyMatch(u -> u.getCorreo().equalsIgnoreCase(correo));
    }

    public synchronized List<Usuario> getTodos() {
        return new ArrayList<>(usuarios);
    }
}
