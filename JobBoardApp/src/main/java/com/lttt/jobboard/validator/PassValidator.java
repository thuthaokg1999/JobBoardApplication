/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.validator;

import com.lttt.jobboard.pojo.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Dy
 */
@Component
public class PassValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User u = (User) target;

        if (!u.getPassword().trim().equals(u.getConfirmPassword().trim())) {
            errors.rejectValue("password", "user.password.error.notMatchMsg");
        }
    }

}
