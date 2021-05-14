/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.controllers;

import com.lttt.jobboard.pojo.Employee;
import com.lttt.jobboard.pojo.Employer;
import com.lttt.jobboard.service.ApplyerService;
import com.lttt.jobboard.service.AreaService;
import com.lttt.jobboard.service.EmployeeService;
import com.lttt.jobboard.service.EmployerService;
import com.lttt.jobboard.service.MajorService;
import com.lttt.jobboard.service.PostService;
import com.lttt.jobboard.service.UserService;
import java.math.BigDecimal;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Dy
 */
@Controller
@ControllerAdvice
public class EmployerInfoController {

    @Autowired
    private EmployerService employerService;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private MajorService majorService;

    @Autowired
    private AreaService areaService;

    @Autowired
    private UserService userService;

    @Autowired
    private PostService postService;

    @Autowired
    private ApplyerService applyerService;

    @GetMapping(value = "/employer-info/{username}")
    public ModelAndView employerInfo(@PathVariable(value = "username") String username) {
        ModelAndView view = new ModelAndView();
        view.setViewName("employer-info");
        view.addObject("employers", employerService.getAllEmployer(username));
        return view;
    }

    @GetMapping(value = "/add-info-employer/{username}")
    public ModelAndView employerAddInfo(@PathVariable(value = "username") String username) {
        ModelAndView view = new ModelAndView();
        view.setViewName("add-info-employer");
        view.addObject("employerss", userService.getUserByUsername(username));
        view.addObject("areas", areaService.getAreas());

        view.addObject("addEmployer", new Employer());

        return view;
    }

    @PostMapping(value = "/add-info-employer/{username}")
    public String addEmployerProcess(Model model,
            @ModelAttribute(value = "addEmployer") @Valid Employer addEmployer,
            BindingResult result, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("areas", areaService.getAreas());
            return "add-info-employer";
        }
        String rootDir = request.getSession()
                .getServletContext().getRealPath("/");

        employerService.addEmployer(addEmployer, rootDir);
        return "redirect:/employer-info/{username}";
    }

    @GetMapping(value = "/EmployerUpdateInfo/{employer_id}")
    public ModelAndView employerUpdateInfo(@PathVariable(value = "employer_id") int employer_id) {
        ModelAndView view = new ModelAndView();
        view.setViewName("employer-update-info");
//        view.addObject("employerss", userService.getUserByUsername(username));
        view.addObject("areas", areaService.getAreas());
        view.addObject("employer", employerService.getEmployer());
        if (employer_id > 0) {
            view.addObject("employers", this.employerService.getEmployerId(employer_id));
        }
//        else{
//            view.addObject("employers",new Employer());
//        }
//        view.addObject("employers",this.employerService.getEmployerId(employer_id));  
//        view.addObject("employers",new Employer());  

//        view.addObject("employers", this.employerService.getAllEmployer(username));       
        return view;
    }

    @PostMapping(value = "/EmployerUpdateInfo/{employer_id}")
    public String updateEmployerProcess(Model model,
            @ModelAttribute(value = "employers") @Valid Employer addEmployer,
            BindingResult result, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("areas", areaService.getAreas());
            return "employer-update-info";
        }
        String rootDir = request.getSession()
                .getServletContext().getRealPath("/");

        employerService.AddOrUpdateEmployer(addEmployer, rootDir);
        return "redirect:/";
    }

    @GetMapping(value = "/ListPost/{username}")
    public ModelAndView listPost(@PathVariable(value = "username") String username,
            @RequestParam(value = "kw", defaultValue = "") String kw) {
        ModelAndView view = new ModelAndView();
        view.setViewName("list-post");
        view.addObject("employerss", userService.getUserByUsername(username));
        view.addObject("employers", employerService.getAllEmployer(username));
        view.addObject("listpost", employerService.getPostsEmployer(username));
        return view;
    }

    @GetMapping(value = "/listApplyers/{post_id}")
    public ModelAndView listApplyers(@PathVariable(value = "post_id") int postId) {
        ModelAndView view = new ModelAndView();
        view.setViewName("list-applyer");
        view.addObject("post", postService.getPostId(postId));
        view.addObject("applyers", applyerService.getEmployeeByPostId(postId));
        return view;
    }

//        @GetMapping(value = "/search-applyer/{username}")
//        public ModelAndView searchApplyers(@PathVariable(value = "username") String username, 
//                @RequestParam(value = "areaId", defaultValue = "") String areaId,           
//                @RequestParam(value = "majorId", defaultValue = "") String majorId) {
//        ModelAndView view = new ModelAndView();
//            view.setViewName("search-applyer");
//            view.addObject("employees", employeeService.getAllEmployee());
//            view.addObject("majors", majorService.getMajors());
//            view.addObject("areas", areaService.getAreas());
////            view.addObject("employees", employeeService.getEmployee());
//            view.addObject("employers", employerService.getAllEmployer(username));
//            if(!areaId.isEmpty() && !majorId.isEmpty()){
//                view.addObject("employees", employeeService.getEmployeeAreaMajor(Integer.parseInt(areaId),Integer.parseInt(majorId)));
//            }
//
//            return view;
//        }
    @RequestMapping(value = "/search-applyer")
    public ModelAndView searchApplyers(@RequestParam(value = "areaId", defaultValue = "") String areaId,
            @RequestParam(value = "majorId", defaultValue = "") String majorId) {
        ModelAndView view = new ModelAndView();
        view.setViewName("search-applyer");
        view.addObject("employees", employeeService.getAllEmployee());
        view.addObject("majors", majorService.getMajors());
        view.addObject("areas", areaService.getAreas());
//            view.addObject("employees", employeeService.getEmployee());
//            view.addObject("employers", employerService.getAllEmployer(username));
        if (!areaId.isEmpty() && !majorId.isEmpty()) {
            view.addObject("employees", employeeService.getEmployeeAreaMajor(Integer.parseInt(areaId), Integer.parseInt(majorId)));
        }

        return view;
    }

    @GetMapping(value = "/info-applyers/{employee_id}")
    public ModelAndView infoApplyers(@PathVariable(value = "employee_id") int employeeId) {
        ModelAndView view = new ModelAndView();
        view.setViewName("info-applyer");
        view.addObject("employee", employeeService.getEmployeeId(employeeId));
        return view;
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String deletePost(@PathVariable("id") int id) {
        postService.deletePost(id);
        return "list-post";
    }

}
