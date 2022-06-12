package ua.goit.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.goit.store.model.entity.Manufacturer;
import ua.goit.store.model.entity.Product;
import ua.goit.store.service.GenericService;
import ua.goit.store.service.ManufacturerService;
import ua.goit.store.service.ProductService;
import ua.goit.store.service.formatters.ProductEditor;

import java.util.List;

@Controller
@RequestMapping(path = "/manufacturers")
public class ManufacturerController extends GenericController<Manufacturer> {

    @Autowired
    ManufacturerService service;
    @Autowired
    ProductService productService;

    @Override
    protected GenericService<Manufacturer> getService() {
        return service;
    }

    @Override
    protected String entitiesPage() {
        return "manufacturers";
    }

    @Override
    protected String formPage() {
        return "formManufacturer";
    }

    @Override
    protected void setRelatedEntities(Model model) {
        List<Product> products = productService.readAll();
        model.addAttribute("products", products);
    }

    @InitBinder("entityForm")
    public void customizeBinding (WebDataBinder binder) {
        binder.registerCustomEditor(Product.class, "products", new ProductEditor(productService));
    }

    @ModelAttribute("entityForm")
    @Override
    public Manufacturer defaultEntity() {
        return new Manufacturer();
    }
}
