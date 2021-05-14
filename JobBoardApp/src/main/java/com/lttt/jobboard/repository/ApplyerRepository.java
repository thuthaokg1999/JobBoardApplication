/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.repository;

import com.lttt.jobboard.pojo.Apply;
import java.util.List;

/**
 *
 * @author Dy
 */
public interface ApplyerRepository {

    List<Object[]> getEmployeeByPostId(int postId);

    void addApply(Apply a);
}
