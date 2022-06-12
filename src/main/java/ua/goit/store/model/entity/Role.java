package ua.goit.store.model.entity;

import java.util.Arrays;
import java.util.Optional;

public enum Role {
    ROLE_ADMIN("ROLE_ADMIN"),
    ROLE_USER("ROLE_USER");

    private final String role;

    Role(String role) {
        this.role = role;
    }

    public static Optional<Role> getUserRole(String role) {
        return Arrays.stream(Role.values())
                .filter(value -> value.getRole().equals(role))
                .findAny();
    }

    public String getRole() {
        return role;
    }
}
