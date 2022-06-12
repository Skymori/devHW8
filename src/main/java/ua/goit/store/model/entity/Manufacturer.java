package ua.goit.store.model.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Set;
import java.util.UUID;

@Data
@Entity
@Table(name = "manufacturers")
public class Manufacturer {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "manufacturer_id")
    private UUID id;

    @NotBlank
    @Size(min=2, max=100, message = "Name must be in range of 2-100 symbols")
    @Column(name = "name")
    private String name;

    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    @OneToMany(mappedBy="manufacturers", fetch = FetchType.LAZY, cascade= CascadeType.ALL, orphanRemoval = true)
    private Set<Product> products;

    public Manufacturer() {
    }

    public Manufacturer(UUID id, String name, Set<Product> products) {
        this.id = id;
        this.name = name;
        this.products = products;
    }

}
