/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.service.impl;

import com.lttt.jobboard.pojo.JobTypes;
import com.lttt.jobboard.repository.JobTypesRepository;
import com.lttt.jobboard.service.JobTypesService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Service
public class JobTypesServiceImpl implements JobTypesService {

    @Autowired
    private JobTypesRepository jobTypesRepository;

    @Override
    public List<JobTypes> getJobTypes(String kw) {
        return this.jobTypesRepository.getJobTypes(kw);
    }

    @Override
    @Transactional
    public List<Object[]> getPostsByJobtypeId(int jobtypeId) {
        return this.jobTypesRepository.getPostsByJobtypeId(jobtypeId);
    }
}
