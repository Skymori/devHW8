package ua.goit.store.service.formatters;

import org.springframework.beans.factory.annotation.Autowired;
import ua.goit.store.model.entity.Product;
import ua.goit.store.service.ProductService;

import java.beans.PropertyEditorSupport;
import java.util.Objects;
import java.util.UUID;

public class ProductEditor extends PropertyEditorSupport {

    ProductService service;
    @Autowired
    public ProductEditor(ProductService service) {
        this.service = service;
    }

    @Override
    public String getAsText() {
        if (Objects.isNull(getValue())) {
            return "";
        }
        Product product = (Product) getValue();
        return product.getName();
    }

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        if (Objects.nonNull(text)) {
            Product product = service.read(UUID.fromString(text));
            this.setValue(product);
        }
    }
}
