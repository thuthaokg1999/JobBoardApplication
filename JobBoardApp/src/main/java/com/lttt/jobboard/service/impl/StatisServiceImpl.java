/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.service.impl;

import com.lttt.jobboard.repository.StatisRepository;
import com.lttt.jobboard.service.StatisService;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *  
 * @author Dy
 */
@Service
public class StatisServiceImpl implements StatisService {

    @Autowired
    private StatisRepository statisRepository;


    @Override
    public List<Object[]> countEmployeesApplyPost(Date fromDate, Date toDate) {
        return this.statisRepository.countEmployeesApplyPost(fromDate, toDate);
    }

}
