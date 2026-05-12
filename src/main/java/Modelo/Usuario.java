package Modelo;

/**
 * Representa un usuario registrado en OtakuWorld.
 * Se guarda en la aplicacion (memoria) y en la sesion HTTP al iniciar sesion.
 */
public class Usuario {

    private int    id;
    private String nombre;       // nombre de usuario (unico)
    private String correo;       // email
    private String clave;        // contrasena (en produccion deberia ir hasheada)
    private String avatarUrl;    // URL de imagen de perfil (puede ser null)

    // Constructor vacio
    public Usuario() {}

    // Constructor con 3 argumentos (usado en RegistroServlets)
    public Usuario(String nombre, String correo, String clave) {
        this.nombre = nombre;
        this.correo = correo;
        this.clave = clave;
    }

    // Constructor completo
    public Usuario(int id, String nombre, String correo, String clave, String avatarUrl) {
        this.id        = id;
        this.nombre    = nombre;
        this.correo    = correo;
        this.clave     = clave;
        this.avatarUrl = avatarUrl;
    }

    // Getters y Setters

    public int getId()                     { return id; }
    public void setId(int id)              { this.id = id; }

    public String getNombre()              { return nombre; }
    public void setNombre(String nombre)   { this.nombre = nombre; }

    public String getCorreo()              { return correo; }
    public void setCorreo(String correo)   { this.correo = correo; }

    public String getClave()               { return clave; }
    public void setClave(String clave)     { this.clave = clave; }

    public String getAvatarUrl()                   { return avatarUrl; }
    public void setAvatarUrl(String avatarUrl)     { this.avatarUrl = avatarUrl; }

    /**
     * Devuelve la inicial del correo en mayuscula.
     * Se usa en el navbar cuando el usuario no tiene avatar.
     */
    public String getInicialCorreo() {
        if (correo != null && !correo.isEmpty()) {
            return String.valueOf(correo.charAt(0)).toUpperCase();
        }
        if (nombre != null && !nombre.isEmpty()) {
            return String.valueOf(nombre.charAt(0)).toUpperCase();
        }
        return "?";
    }

    @Override
    public String toString() {
        return "Usuario{id=" + id + ", nombre='" + nombre + "', correo='" + correo + "'}";
    }
}
