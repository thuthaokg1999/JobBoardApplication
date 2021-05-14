/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.repository.impl;

import com.lttt.jobboard.pojo.JobTypes;
import com.lttt.jobboard.pojo.Major;
import com.lttt.jobboard.pojo.Position;
import com.lttt.jobboard.repository.PositionRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public class PositionRepositoryImpl implements PositionRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Position> getPositions(String kw) {
        List<Position> p;
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Position> cr = builder.createQuery(Position.class);
        Root<Position> root = cr.from(Position.class);

        CriteriaQuery query = cr.select(root);
        if (!kw.isEmpty()) {
            query = query.where(builder.like(root.get("name").as(String.class),
                    "%" + kw + "%"));
        }

        p = session.createQuery(query).getResultList();
        return p;
    }

//    @Override
//    public List<Position> getPositionsByMajor(int id) {
//         List<Position> posts = null;
//        Session session = sessionFactory.getCurrentSession(); 
//        Major mr = session.get(Major.class, id);
//        if (mr != null) {
//            Hibernate.initialize(mr.getPositions());
//            posts = mr.getPositions();
//        }
//        return posts;
//    }
}
