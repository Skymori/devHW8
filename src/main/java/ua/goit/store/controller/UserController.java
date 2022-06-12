package ua.goit.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import ua.goit.store.exceptions.UserAlreadyExistException;
import ua.goit.store.model.entity.Role;
import ua.goit.store.model.entity.User;
import ua.goit.store.service.GenericService;
import ua.goit.store.service.UserService;
import ua.goit.store.service.formatters.RoleEditor;

import javax.validation.Valid;

@Controller
@RequestMapping(path = "/users")
public class UserController extends GenericController<User> {

    @Autowired
    UserService service;

    @Override
    protected GenericService<User> getService() {
        return service;
    }

    @Override
    protected String entitiesPage() {
        return "users";
    }

    @Override
    protected String formPage() {
        return "formUser";
    }

    @Override
    protected void setRelatedEntities(Model model) {
        model.addAttribute("roles", Role.values());
    }

    @GetMapping("/registration")
    public String showRegistrationPage() {
        return "formUser";
    }

    @PostMapping("/registration")
    public String register(@Valid @ModelAttribute("entityForm") User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "formUser";
        }

        try {
            service.register(user);
        } catch (UserAlreadyExistException ex) {
            model.addAttribute("message", ex.getMessage());
            return "formUser";
        }

        return "redirect:/login";
    }

    @InitBinder("entityForm")
    public void customizeBinding (WebDataBinder binder) {
        binder.registerCustomEditor(Role.class, "userRole", new RoleEditor());
    }

    @ModelAttribute("entityForm")
    @Override
    public User defaultEntity() {
        return new User();
    }
}
