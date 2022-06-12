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
import ua.goit.store.service.formatters.ManufacturerEditor;

import java.util.List;

@Controller
@RequestMapping(path = "/products")
public class ProductController extends GenericController<Product> {

    @Autowired
    ProductService service;
    @Autowired
    ManufacturerService manufacturerService;

    @Override
    protected GenericService<Product> getService() {
        return service;
    }

    @Override
    protected String entitiesPage() {
        return "products";
    }

    @Override
    protected String formPage() {
        return "formProduct";
    }

    @Override
    protected void setRelatedEntities(Model model) {
        List<Manufacturer> manufacturers = manufacturerService.readAll();
        model.addAttribute("manufacturers", manufacturers);
    }

    @InitBinder("entityForm")
    public void customizeBinding (WebDataBinder binder) {
        binder.registerCustomEditor(Manufacturer.class, "manufacturers", new ManufacturerEditor(manufacturerService));
    }

    @ModelAttribute("entityForm")
    @Override
    public Product defaultEntity() {
        return new Product();
    }
}
