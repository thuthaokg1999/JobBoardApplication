/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.controllers;

import com.lttt.jobboard.pojo.Apply;
import com.lttt.jobboard.pojo.Employee;
import com.lttt.jobboard.pojo.User;
import com.lttt.jobboard.service.ApplyerService;
import com.lttt.jobboard.service.AreaService;
import com.lttt.jobboard.service.EmployeeService;
import com.lttt.jobboard.service.EmployerService;
import com.lttt.jobboard.service.MajorService;
import com.lttt.jobboard.service.PostService;
import com.lttt.jobboard.service.UserService;
import com.lttt.jobboard.validator.WebAppValidator;
import java.math.BigDecimal;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Admin
 */
@Controller
@ControllerAdvice
public class HomeController {

    @Autowired
    private PostService postService;

    @Autowired
    private AreaService areaService;

    @Autowired
    private UserService userService;

    @Autowired
    private EmployeeService employeeService;
    
    @Autowired
    private EmployerService employerService;

    @Autowired
    private MajorService majorService;

    @Autowired
    private ApplyerService applyerService;

    @RequestMapping(value = "/")
    public ModelAndView index(@RequestParam(value = "areaId", defaultValue = "") String areaId,
            @RequestParam(value = "majorId", defaultValue = "") String majorId,
            @RequestParam(value = "fromSalary", defaultValue = "") BigDecimal fromSalary,
            @RequestParam(value = "toSalary", defaultValue = "") BigDecimal toSalary) {
        ModelAndView view = new ModelAndView();
        view.setViewName("index");
        view.addObject("areas", areaService.getAreas());
        view.addObject("posts", postService.getPost());
        view.addObject("majors", majorService.getMajors());

        if (!areaId.isEmpty() && !majorId.isEmpty() && fromSalary == null && toSalary == null) {
            view.addObject("posts", postService.getPostsAreaMajor(Integer.parseInt(areaId), Integer.parseInt(majorId)));
        } else if (!areaId.isEmpty() && !majorId.isEmpty() && fromSalary != null && toSalary != null) {
            view.addObject("posts", postService.getAllPosts(Integer.parseInt(areaId), Integer.parseInt(majorId), fromSalary, toSalary));
        }

        return view;
    }

    @GetMapping(value = "/posts/{post_id}")
    public ModelAndView detail(@PathVariable(value = "post_id") int postId) {
        ModelAndView view = new ModelAndView();
        view.setViewName("post-detail");
        view.addObject("post", postService.getPostId(postId));

        return view;
    }

    @GetMapping(value = "/posts/{post_id}/{username}")
    public ModelAndView apply(
            @PathVariable(value = "post_id") int postId,
            @PathVariable(value = "username") String username) {
        ModelAndView view = new ModelAndView();
        view.setViewName("apply");

        view.addObject("post", postService.getPostId(postId));
        view.addObject("employees", employeeService.getAllEmployee(username));
        view.addObject("addApplyer", new Apply());

        return view;
    }

    @PostMapping(value = "/posts/{post_id}/{username}")
    public String addApplyer(Model model,
            @ModelAttribute(value = "addApplyer") @Valid Apply addApplyer,
            BindingResult result, HttpServletRequest request) {

        String rootDir = request.getSession().getServletContext().getRealPath("/");

        applyerService.addApply(addApplyer, rootDir);

        return "redirect:/";
    }

    @RequestMapping(value = "/list-company")
    public ModelAndView index(@RequestParam(value = "company", defaultValue = "") String company) {
        ModelAndView view = new ModelAndView();
        view.setViewName("list-company");
        
        view.addObject("companies", employerService.getEmployer());
        if(!company.isEmpty()){
            view.addObject("companies", employerService.getEmployerKw(company));
        }
        return view;
    }
    
    @GetMapping(value = "/company/{employer_id}")
    public ModelAndView companyDetail(@PathVariable(value = "employer_id") int employerId) {
        ModelAndView view = new ModelAndView();
        view.setViewName("company-detail");
//        view.addObject("post", postService.getPostId(postId));
        view.addObject("employer", postService.getPostsInfoEmployer(employerId));
        view.addObject("employers", this.employerService.getEmployerId(employerId));

        return view;
    }
}
