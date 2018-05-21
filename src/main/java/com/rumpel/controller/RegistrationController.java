package com.rumpel.controller;

import com.rumpel.model.Role;
import com.rumpel.model.User;
import com.rumpel.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user/*приходить будет пользователь*/, Map<String,Object> model){
        User userFromDb = userRepo.findByUsername(user.getUsername());

        if (userFromDb != null) {
            model.put("message", "User exists!");
            return "registration";
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));//Collections.singleton() - создает Set с одним единственным значением
        userRepo.save(user);
        return "redirect:/login"; // при успешной регистрации будем делать redirect на страницу login
    }

}
