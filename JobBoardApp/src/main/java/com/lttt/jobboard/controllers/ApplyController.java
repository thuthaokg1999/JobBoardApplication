/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Dy
 */
@Controller
@RequestMapping("/post-detail/apply")
public class ApplyController {

    @RequestMapping("/")
    public String NewsFeed() {
        return "apply";
    }
}
