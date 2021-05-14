/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.controllers;

import com.lttt.jobboard.pojo.Post;
import com.lttt.jobboard.service.AreaService;
import com.lttt.jobboard.service.EmployerService;
import com.lttt.jobboard.service.JobTypesService;
import com.lttt.jobboard.service.MajorService;
import com.lttt.jobboard.service.PositionService;
import com.lttt.jobboard.service.PostService;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

/**
 *
 * @author Admin
 */
@Controller
@ControllerAdvice
public class PostController {

    @Autowired
    private EmployerService employerService;

    @Autowired
    private PostService postService;

    @Autowired
    private MajorService majorService;

    @Autowired
    private AreaService areaService;

    @Autowired
    private PositionService positionService;

    @Autowired
    private JobTypesService jobTypesService;

    @GetMapping(value = "/post/{username}")
    public ModelAndView post(@PathVariable(value = "username") String username) {
        ModelAndView view = new ModelAndView();
        view.setViewName("post");
        view.addObject("employers", employerService.getAllEmployer(username));

        view.addObject("jobtypes", jobTypesService.getJobTypes(""));
        view.addObject("majors", majorService.getMajors());
        view.addObject("areas", areaService.getAreas());
        view.addObject("positions", positionService.getPositions(""));

        view.addObject("addPost", new Post());
        return view;
    }

    @PostMapping(value = "/post/{username}")
    public String addPostProcess(Model model,
            @ModelAttribute(value = "addPost") @Valid Post addPost,
            BindingResult result, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("areas", areaService.getAreas());
            model.addAttribute("jobtypes", jobTypesService.getJobTypes(""));
            model.addAttribute("majors", majorService.getMajors());
            model.addAttribute("positions", positionService.getPositions(""));
            return "post";
        }

        postService.addPost(addPost);

        return "redirect:/";
    }
}
