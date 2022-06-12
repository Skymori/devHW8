package ua.goit.store.model.repository;

import org.springframework.stereotype.Repository;
import ua.goit.store.model.entity.User;

import java.util.Optional;

@Repository
public interface UserRepository extends GenericRepository<User> {

    Optional<User> findByEmail(String email);
}
