package ua.goit.store.service.formatters;

import org.springframework.beans.factory.annotation.Autowired;
import ua.goit.store.model.entity.Manufacturer;
import ua.goit.store.service.ManufacturerService;

import java.beans.PropertyEditorSupport;
import java.util.Objects;
import java.util.UUID;

public class ManufacturerEditor extends PropertyEditorSupport {

    ManufacturerService service;

    @Autowired
    public ManufacturerEditor(ManufacturerService service) {
        this.service = service;
    }

    @Override
    public String getAsText() {
        if (Objects.isNull(getValue())) {
            return "";
        }
        Manufacturer manufacturer = (Manufacturer) getValue();
        return manufacturer.getName();
    }

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        if (Objects.nonNull(text)) {
            Manufacturer manufacturer = service.read(UUID.fromString(text));
            this.setValue(manufacturer);
        }
    }
}
