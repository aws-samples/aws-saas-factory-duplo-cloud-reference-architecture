package com.saas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.saas.auth.validate.UserValidator;
import com.saas.model.User;
import com.saas.service.UserService;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;


    @RequestMapping("/")
    public String index(Model model) {            
        return "redirect:/registration";
    } 
    
    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    
    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        return "redirect:registration";
    }

}
