package ua.goit.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.goit.store.model.entity.Product;
import ua.goit.store.model.repository.GenericRepository;
import ua.goit.store.model.repository.ProductRepository;

@Service
public class ProductService extends GenericService<Product> {

    @Autowired
    ProductRepository repository;

    @Override
    protected GenericRepository<Product> getRepository() {
        return repository;
    }

}
