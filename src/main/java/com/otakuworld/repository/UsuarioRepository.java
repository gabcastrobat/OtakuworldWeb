package com.otakuworld.repository;

import com.otakuworld.model.Usuario;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import java.util.List;
import java.util.Optional;

/**
 * Repositorio para operaciones CRUD de Usuario.
 * Utiliza Hibernate para abstracción de base de datos.
 * 
 * @author OtakuWorld Team
 * @version 2.0
 */
public class UsuarioRepository {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(UsuarioRepository.class);
    private static SessionFactory sessionFactory;
    
    static {
        initSessionFactory();
    }
    
    /**
     * Inicializa SessionFactory de Hibernate.
     */
    private static void initSessionFactory() {
        try {
            Configuration config = new Configuration();
            config.configure("hibernate.cfg.xml");
            sessionFactory = config.buildSessionFactory();
            LOGGER.info("Hibernate SessionFactory inicializado");
        } catch (Exception e) {
            LOGGER.error("Error inicializando Hibernate", e);
            throw new RuntimeException("Fallo al inicializar Hibernate", e);
        }
    }
    
    /**
     * Guarda un usuario nuevo.
     * 
     * @param usuario Usuario a guardar
     * @return Usuario guardado con ID
     */
    public Usuario save(Usuario usuario) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            session.persist(usuario);
            tx.commit();
            LOGGER.info("Usuario guardado: {}", usuario.getUsername());
            return usuario;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            LOGGER.error("Error guardando usuario", e);
            throw new RuntimeException("Error al guardar usuario", e);
        } finally {
            session.close();
        }
    }
    
    /**
     * Actualiza un usuario existente.
     * 
     * @param usuario Usuario con datos actualizados
     * @return Usuario actualizado
     */
    public Usuario update(Usuario usuario) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            session.merge(usuario);
            tx.commit();
            LOGGER.info("Usuario actualizado: {}", usuario.getUsername());
            return usuario;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            LOGGER.error("Error actualizando usuario", e);
            throw new RuntimeException("Error al actualizar usuario", e);
        } finally {
            session.close();
        }
    }
    
    /**
     * Busca usuario por ID.
     * 
     * @param id ID del usuario
     * @return Optional con el usuario si existe
     */
    public Optional<Usuario> findById(Integer id) {
        Session session = sessionFactory.openSession();
        
        try {
            Usuario usuario = session.find(Usuario.class, id);
            return Optional.ofNullable(usuario);
        } catch (Exception e) {
            LOGGER.error("Error buscando usuario por ID", e);
            return Optional.empty();
        } finally {
            session.close();
        }
    }
    
    /**
     * Busca usuario por nombre de usuario.
     * 
     * @param username Nombre de usuario
     * @return Optional con el usuario si existe
     */
    public Optional<Usuario> findByUsername(String username) {
        Session session = sessionFactory.openSession();
        
        try {
            TypedQuery<Usuario> query = session.createQuery(
                "FROM Usuario WHERE username = :username", Usuario.class);
            query.setParameter("username", username);
            Usuario usuario = query.uniqueResult();
            return Optional.ofNullable(usuario);
        } catch (NoResultException e) {
            return Optional.empty();
        } catch (Exception e) {
            LOGGER.error("Error buscando usuario por username", e);
            return Optional.empty();
        } finally {
            session.close();
        }
    }
    
    /**
     * Busca usuario por email.
     * 
     * @param email Email del usuario
     * @return Optional con el usuario si existe
     */
    public Optional<Usuario> findByEmail(String email) {
        Session session = sessionFactory.openSession();
        
        try {
            TypedQuery<Usuario> query = session.createQuery(
                "FROM Usuario WHERE email = :email", Usuario.class);
            query.setParameter("email", email);
            Usuario usuario = query.uniqueResult();
            return Optional.ofNullable(usuario);
        } catch (NoResultException e) {
            return Optional.empty();
        } catch (Exception e) {
            LOGGER.error("Error buscando usuario por email", e);
            return Optional.empty();
        } finally {
            session.close();
        }
    }
    
    /**
     * Obtiene todos los usuarios activos.
     * 
     * @param page Número de página (0-indexed)
     * @param pageSize Tamaño de la página
     * @return Lista de usuarios
     */
    public List<Usuario> findAllActive(int page, int pageSize) {
        Session session = sessionFactory.openSession();
        
        try {
            TypedQuery<Usuario> query = session.createQuery(
                "FROM Usuario WHERE isActive = true ORDER BY createdAt DESC", Usuario.class);
            query.setFirstResult(page * pageSize);
            query.setMaxResults(pageSize);
            return query.getResultList();
        } catch (Exception e) {
            LOGGER.error("Error obteniendo usuarios activos", e);
            return List.of();
        } finally {
            session.close();
        }
    }
    
    /**
     * Obtiene total de usuarios activos.
     * 
     * @return Número de usuarios activos
     */
    public long countActive() {
        Session session = sessionFactory.openSession();
        
        try {
            TypedQuery<Long> query = session.createQuery(
                "SELECT COUNT(*) FROM Usuario WHERE isActive = true", Long.class);
            return query.uniqueResult();
        } catch (Exception e) {
            LOGGER.error("Error contando usuarios activos", e);
            return 0;
        } finally {
            session.close();
        }
    }
    
    /**
     * Elimina un usuario (soft delete - marca como inactivo).
     * 
     * @param id ID del usuario
     */
    public void delete(Integer id) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            Usuario usuario = session.find(Usuario.class, id);
            if (usuario != null) {
                usuario.setIsActive(false);
                session.merge(usuario);
                tx.commit();
                LOGGER.info("Usuario eliminado (soft delete): {}", id);
            }
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            LOGGER.error("Error eliminando usuario", e);
            throw new RuntimeException("Error al eliminar usuario", e);
        } finally {
            session.close();
        }
    }
    
    /**
     * Verifica si existe usuario con ese username.
     * 
     * @param username Username a verificar
     * @return true si existe
     */
    public boolean existsByUsername(String username) {
        return findByUsername(username).isPresent();
    }
    
    /**
     * Verifica si existe usuario con ese email.
     * 
     * @param email Email a verificar
     * @return true si existe
     */
    public boolean existsByEmail(String email) {
        return findByEmail(email).isPresent();
    }
}
