/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.controllers;

import com.lttt.jobboard.service.StatisService;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Dy
 */
@Controller
@ControllerAdvice
public class StatisController {

    @Autowired
    private StatisService statisService;

    @Autowired
    private SimpleDateFormat simpleDateFormat;

    @RequestMapping("/statis")
    public String Statis(Model model,
            @RequestParam(name = "fromDate", defaultValue = "") String fromDate,
            @RequestParam(name = "toDate", defaultValue = "") String toDate) {

        Date fr = null, to = null;
        try {
            fr = this.simpleDateFormat.parse(fromDate);
            to = this.simpleDateFormat.parse(toDate);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        List<Object[]> statises = this.statisService.countEmployeesApplyPost(fr, to);
        model.addAttribute("statis", statises);

        return "statis";
    }
}
