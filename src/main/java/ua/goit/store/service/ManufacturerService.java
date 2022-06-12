package ua.goit.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.goit.store.exceptions.NestedEntityException;
import ua.goit.store.model.entity.Manufacturer;
import ua.goit.store.model.entity.Product;
import ua.goit.store.model.repository.GenericRepository;
import ua.goit.store.model.repository.ManufacturerRepository;
import ua.goit.store.model.repository.ProductRepository;

import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class ManufacturerService extends GenericService<Manufacturer> {

    @Autowired
    ManufacturerRepository repository;
    @Autowired
    ProductRepository productRepository;

    @Override
    protected GenericRepository<Manufacturer> getRepository() {
        return repository;
    }

    @Override
    public void save(Manufacturer manufacturer) throws NestedEntityException {
        if (Objects.nonNull(manufacturer.getId())) {
            update(manufacturer);
        } else {
            super.save(manufacturer);
        }

    }

    private void update(Manufacturer manufacturer) throws NestedEntityException {
        Set<Product> productsInDB = repository.getById(manufacturer.getId()).getProducts();
        Set<Product> products = manufacturer.getProducts();

        List<Product> productsToDelete = productsInDB.stream()
                .filter(info -> !products.contains(info))
                .collect(Collectors.toList());

        if (productsToDelete.size() > 0) {
            throw new NestedEntityException("All products without manufacturer must be deleted before updating manufacturer");
        }

        products.forEach((p -> {
            Product product = productRepository.getById(p.getId());
            product.setManufacturers(manufacturer);
        }));
        repository.saveAndFlush(manufacturer);
    }

}
