/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.repository;

import com.lttt.jobboard.pojo.JobTypes;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface JobTypesRepository {

    List<JobTypes> getJobTypes(String kw);

    List<Object[]> getPostsByJobtypeId(int id);
}
