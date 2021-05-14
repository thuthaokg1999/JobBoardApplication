/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.service;

import com.lttt.jobboard.pojo.Employer;
import java.util.List;

/**
 *
 * @author Dy
 */
public interface EmployerService {

    List<Object[]> getAllEmployer(String username);

    List<Object[]> getPostsEmployer(String username);

    List<Employer> getEmployer();
    
    List<Employer> getEmployerKw(String kw);

    Employer getEmployerId(int id);

    void addEmployer(Employer employer, String rootDir);

    void AddOrUpdateEmployer(Employer employer, String rootDir);
//    boolean addOrUpdateEmployee(Employer employer,String rootDir);
}
