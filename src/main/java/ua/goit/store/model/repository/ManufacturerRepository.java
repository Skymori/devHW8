package ua.goit.store.model.repository;

import org.springframework.stereotype.Repository;
import ua.goit.store.model.entity.Manufacturer;

@Repository
public interface ManufacturerRepository extends GenericRepository<Manufacturer> {
}
