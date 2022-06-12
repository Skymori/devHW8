package ua.goit.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import ua.goit.store.exceptions.UserAlreadyExistException;
import ua.goit.store.model.entity.Role;
import ua.goit.store.model.entity.User;
import ua.goit.store.model.repository.GenericRepository;
import ua.goit.store.model.repository.UserRepository;

import java.util.Objects;


@Service
public class UserService extends GenericService<User> {

    @Autowired
    UserRepository repository;
    @Autowired
    BCryptPasswordEncoder encoder;

    @Override
    protected GenericRepository<User> getRepository() {
        return repository;
    }

    public void register(User user) {
        if (repository.findByEmail(user.getEmail()).isPresent()) {
            throw new UserAlreadyExistException("Account with provided email already exists");
        }

        user.setUserRole(Role.ROLE_USER);
        user.setPassword(encoder.encode(user.getPassword()));
        repository.save(user);
    }

    @Override
    public void save(User entity) throws UserAlreadyExistException {
        if (Objects.isNull(entity.getId()) && repository.findByEmail(entity.getEmail()).isPresent()) {
            throw new UserAlreadyExistException("Account with provided email already exists");
        }
        entity.setPassword(encoder.encode(entity.getPassword()));
        repository.save(entity);
    }
}
