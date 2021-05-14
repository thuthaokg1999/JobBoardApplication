/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.controllers;

import com.lttt.jobboard.pojo.User;
import com.lttt.jobboard.service.UserService;
import com.lttt.jobboard.validator.WebAppValidator;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Admin
 */
@Controller
public class SignInController {

    @Autowired
    private UserService userService;
    @Autowired
    private WebAppValidator userValidator;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(userValidator);
    }

    @GetMapping(value = "/sign-in")
    public String loginView(Model model) {
        model.addAttribute("user", new User());

        return "sign-in";
    }

    @GetMapping(value = "/sign-up")
    public String registerView(Model model) {
        model.addAttribute("user", new User());

        return "sign-up";
    }

    @PostMapping(value = "/sign-up")
    public String registerProcess(@ModelAttribute(name = "user") @Valid User user,
            BindingResult result) {
        if (result.hasErrors()) {
            return "sign-up";
        }

        userService.addUser(user);

        return "redirect:/sign-in";
    }

}
