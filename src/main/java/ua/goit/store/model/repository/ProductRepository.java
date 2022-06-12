package ua.goit.store.model.repository;

import org.springframework.stereotype.Repository;
import ua.goit.store.model.entity.Product;

@Repository
public interface ProductRepository extends GenericRepository<Product> {
}
