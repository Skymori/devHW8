package ua.goit.store.model.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import java.util.UUID;

@Data
@Entity
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "product_id")
    private UUID id;

    @NotBlank(message = "Name can't be empty")
    @Size(min = 3, max = 100, message = "Name must be in range of 3-100 symbols")
    @Column(name = "name")
    private String name;

    @NotNull(message = "Price must be bigger than 0")
    @Column(name = "price")
    private BigDecimal price;

    @NotNull(message = "Manufacturer can't be null")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "manufacturer_id", nullable = false)
    private Manufacturer manufacturers;

    public Product() {
    }

    public Product(UUID id, String name, BigDecimal price, Manufacturer manufacturer) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.manufacturers = manufacturer;
    }

}
