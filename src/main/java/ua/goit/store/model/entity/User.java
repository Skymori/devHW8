package ua.goit.store.model.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.UUID;

@Data
@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id", updatable = false, nullable = false, unique = true)
    private UUID id;

    @Email(regexp = ".+@.+\\..+", message = "Email must have @ symbol")
    @Column(name = "email", unique = true)
    private String email;

    @ToString.Exclude
    @NotBlank(message = "Password can't be empty")
    @Column(name = "password")
    private String password;

    @NotBlank(message = "First name can't be empty")
    @Column(name = "first_name")
    private String firstName;

    @NotBlank(message = "Last name can't be empty")
    @Column(name = "last_name")
    private String lastName;

    @Column(name = "user_role")
    @Enumerated(EnumType.STRING)
    private Role userRole;

}
