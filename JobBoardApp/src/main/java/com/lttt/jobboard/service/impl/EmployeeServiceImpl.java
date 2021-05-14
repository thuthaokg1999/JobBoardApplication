/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.service.impl;

import com.lttt.jobboard.pojo.Employee;
import com.lttt.jobboard.repository.EmployeeRepository;
import com.lttt.jobboard.service.EmployeeService;
import java.io.File;
import java.io.IOException;
//import java.text.SimpleDateFormat;
//import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Dy
 */
@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

//    @Autowired
//    private SimpleDateFormat simpleDateFormat;
    @Override
    @Transactional(readOnly = true)
    public boolean addOrUpdateEmployee(Employee e) {
        return this.employeeRepository.addOrUpdateEmployee(e);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Object[]> getAllEmployee(String username) {
        return employeeRepository.getAllEmployee(username);
    }

    @Override
    @Transactional
    public void addEmployee(Employee employee, String rootDir) {
        MultipartFile cv = employee.getCvFile();
        if (cv != null && !cv.isEmpty()) {
            employee.setCv(cv.getOriginalFilename());
            try {
                cv.transferTo(new File(rootDir + employee.getCv()));
                employeeRepository.addEmployee(employee);
            } catch (IOException | IllegalStateException ex) {
                System.err.println(ex.getMessage());
            }
        }

    }

    @Override
    @Transactional
    public List<Employee> getEmployee() {
        return employeeRepository.getEmployee();
    }

    @Override
    @Transactional(readOnly = true)
    public Employee getEmployeeId(int id) {
        return employeeRepository.getEmployeeId(id);
    }

    @Override
    @Transactional
    public void updateEmployee(Employee employee, String rootDir) {
        MultipartFile cv = employee.getCvFile();
        if (cv != null && !cv.isEmpty()) {
            employee.setCv(cv.getOriginalFilename());
            try {
                cv.transferTo(new File(rootDir + employee.getCv()));
                employeeRepository.updateEmployee(employee);
            } catch (IOException | IllegalStateException ex) {
                System.err.println(ex.getMessage());
            }
        }
    }

    @Override
    @Transactional
    public List<Object[]> getEmployeeAreaMajor(int areaId, int majorId) {
        return employeeRepository.getEmployeeAreaMajor(areaId, majorId);
    }

    @Override
    @Transactional
    public List<Object[]> getAllEmployee() {
        return employeeRepository.getAllEmployee();
    }

}
