package ua.goit.store.authorization;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ua.goit.store.model.entity.User;
import ua.goit.store.model.repository.UserRepository;

@Service(value = "userServiceDetails")
public class StoreUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    @Autowired
    public StoreUserDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        final User user = userRepository.findByEmail(username).orElseThrow(() ->
                new UsernameNotFoundException(String.format("User with username %s doesn't exist", username)));
        return new UserPrincipal(user);
    }
}
