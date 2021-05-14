/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Dy
 */
public interface StatisRepository {
    List<Object[]> countEmployeesApplyPost(Date fromDate, Date toDate);
}
