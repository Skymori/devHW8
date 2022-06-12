package ua.goit.store.service.formatters;

import ua.goit.store.model.entity.Role;

import java.beans.PropertyEditorSupport;
import java.util.Objects;

public class RoleEditor extends PropertyEditorSupport {

    @Override
    public String getAsText() {
        if (Objects.isNull(getValue())) {
            return "";
        }
        Role role = (Role) getValue();
        return role.getRole();
    }

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        if (Objects.nonNull(text)) {
            switch (text) {
                case "ROLE_ADMIN" -> this.setValue(Role.ROLE_ADMIN);
                case "ROLE_USER" -> this.setValue(Role.ROLE_USER);
                default -> this.setValue("");
            }
        }
    }
}
