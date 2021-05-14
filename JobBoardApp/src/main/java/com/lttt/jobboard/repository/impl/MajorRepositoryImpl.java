/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.repository.impl;

import com.lttt.jobboard.pojo.Major;
import com.lttt.jobboard.repository.MajorRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Repository
public class MajorRepositoryImpl implements MajorRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Major> getMajors() {
        List<Major> majors;
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Major> cr = builder.createQuery(Major.class);
        Root<Major> root = cr.from(Major.class);

        CriteriaQuery query = cr.select(root);
//        if (!kw.isEmpty())
//            query = query.where(builder.like(root.get("name").as(String.class),  
//                    "%" + kw + "%"));

        majors = session.createQuery(query).getResultList();
        return majors;
    }

}
