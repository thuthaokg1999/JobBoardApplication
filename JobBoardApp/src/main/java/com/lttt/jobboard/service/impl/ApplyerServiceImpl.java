/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.service.impl;

import com.lttt.jobboard.pojo.Apply;
import com.lttt.jobboard.repository.ApplyerRepository;
import com.lttt.jobboard.service.ApplyerService;
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
@Transactional
public class ApplyerServiceImpl implements ApplyerService {

    @Autowired
    private ApplyerRepository applyerRepository;

    @Override
    public List<Object[]> getEmployeeByPostId(int postId) {
        return applyerRepository.getEmployeeByPostId(postId);
    }

    @Override
    @Transactional
    public void addApply(Apply apply, String rootDir) {
        MultipartFile cv = apply.getCvFile();
        if (cv != null && !cv.isEmpty()) {
            apply.setCv(cv.getOriginalFilename());
            try {
                cv.transferTo(new File(rootDir + apply.getCv()));
                applyerRepository.addApply(apply);
            } catch (IOException | IllegalStateException ex) {
                System.err.println(ex.getMessage());
            }
        }
    }

}
