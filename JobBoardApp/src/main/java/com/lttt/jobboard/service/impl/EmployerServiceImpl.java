/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.service.impl;

import com.lttt.jobboard.pojo.Employer;
import com.lttt.jobboard.repository.EmployeeRepository;
import com.lttt.jobboard.repository.EmployerRepository;
import com.lttt.jobboard.service.EmployerService;
import java.io.File;
import java.io.IOException;
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
public class EmployerServiceImpl implements EmployerService {

    @Autowired
    private EmployerRepository employerRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Object[]> getAllEmployer(String username) {
        return employerRepository.getAllEmployer(username);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Object[]> getPostsEmployer(String username) {
        return employerRepository.getPostsEmployer(username);
    }

    @Override
    @Transactional
    public void addEmployer(Employer employer, String rootDir) {
        MultipartFile img = employer.getLogoFile();
        if (img != null && !img.isEmpty()) {
            employer.setLogo("/images/imgFile/" + img.getOriginalFilename());
            try {
                img.transferTo(new File(rootDir + "resources" + employer.getLogo()));
                employerRepository.addEmployer(employer);
            } catch (IOException | IllegalStateException ex) {
                System.err.println(ex.getMessage());
            }
        }
    }

    @Override
    @Transactional
    public void AddOrUpdateEmployer(Employer employer, String rootDir) {
        MultipartFile img = employer.getLogoFile();
        if (img != null && !img.isEmpty()) {
            employer.setLogo("/images/imgFile/" + img.getOriginalFilename());
            try {
                img.transferTo(new File(rootDir + "resources" + employer.getLogo()));
                employerRepository.AddOrUpdateEmployer(employer);
            } catch (IOException | IllegalStateException ex) {
                System.err.println(ex.getMessage());
            }
        }
    }

    @Override
    @Transactional
    public List<Employer> getEmployer() {
        return employerRepository.getEmployer();
    }

    @Override
    @Transactional(readOnly = true)
    public Employer getEmployerId(int id) {
        return employerRepository.getEmployerId(id);
    }

    @Override
    @Transactional
    public List<Employer> getEmployerKw(String kw) {
        return employerRepository.getEmployerKw(kw);
    }

}
