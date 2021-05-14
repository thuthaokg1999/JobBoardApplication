/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.controllers;

import com.lttt.jobboard.pojo.Employee;
import com.lttt.jobboard.pojo.Employer;
import com.lttt.jobboard.pojo.User;
import com.lttt.jobboard.service.AreaService;
import com.lttt.jobboard.service.EmployeeService;
import com.lttt.jobboard.service.MajorService;
import com.lttt.jobboard.service.UserService;
import java.math.BigDecimal;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Admin
 */
@Controller
@ControllerAdvice
public class EmployeeUpdateInfoController {

    @Autowired
    private MajorService majorService;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private AreaService areaService;

    @Autowired
    private UserService userService;

    @GetMapping(value = "/EmployeeInfo/{employee_name}")
    public ModelAndView EmployeeInfo(@PathVariable(value = "employee_name") String employeeName) {
        ModelAndView view = new ModelAndView();
        view.setViewName("employee-info");
        view.addObject("employees", employeeService.getAllEmployee(employeeName));
//        List<Object[]> employee = this.employeeService.getAllEmployee(employeeName);         
        return view;
    }

    @GetMapping(value = "/add-info-employee/{username}")
    public ModelAndView employeeAddInfo(@PathVariable(value = "username") String username) {
        ModelAndView view = new ModelAndView();
        view.setViewName("add-info-employee");
        view.addObject("employeess", userService.getUserByUsername(username));
        view.addObject("employees", employeeService.getAllEmployee(username));
        view.addObject("majors", majorService.getMajors());
        view.addObject("areas", areaService.getAreas());
        view.addObject("addEmployee", new Employee());

        return view;
    }

    @PostMapping(value = "/add-info-employee/{username}")
    public String addEmployerProcess(Model model,
            @ModelAttribute(value = "addEmployee") @Valid Employee addEmployee,
            BindingResult result, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("majors", majorService.getMajors());
            model.addAttribute("areas", areaService.getAreas());
            return "add-info-employee";
        }
        String rootDir = request.getSession()
                .getServletContext().getRealPath("/");

        employeeService.addEmployee(addEmployee, rootDir);
        return "redirect:/EmployeeInfo/{username}";
    }

    @GetMapping(value = "/EmployeeUpdateInfo/{employeeId}")
    public ModelAndView EmployeeUpdateInfo(@PathVariable(value = "employeeId") int employeeId,
            @RequestParam(value = "kw", defaultValue = "") String kw) {
        ModelAndView view = new ModelAndView();
        view.setViewName("employee-update-info");
//        view.addObject("employeess", userService.getUserByUsername(employeeName));
//        view.addObject("employees", employeeService.getAllEmployee(employeeName));
        view.addObject("majors", majorService.getMajors());
        view.addObject("areas", areaService.getAreas());
        if (employeeId > 0) {
            view.addObject("employees", this.employeeService.getEmployeeId(employeeId));
        }

//        view.addObject("addEmployee", new Employee());         
        return view;
    }

    @PostMapping(value = "/EmployeeUpdateInfo/{employeeId}")
    public String addEmployeeProcess(Model model,
            @ModelAttribute(value = "employees") @Valid Employee addEmployee,
            BindingResult result, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("majors", majorService.getMajors());
            model.addAttribute("areas", areaService.getAreas());
            return "employee-update-info";
        }
        String rootDir = request.getSession()
                .getServletContext().getRealPath("/");

        employeeService.updateEmployee(addEmployee, rootDir);
        return "redirect:/";
    }

}
