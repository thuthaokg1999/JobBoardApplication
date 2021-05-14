/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.repository.impl;

import com.lttt.jobboard.pojo.Area;
import com.lttt.jobboard.pojo.Post;
import com.lttt.jobboard.repository.AreaRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Repository
public class AreaRepositoryImpl implements AreaRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Area> getAreas() {
        List<Area> areas;
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Area> cr = builder.createQuery(Area.class);
        Root<Area> root = cr.from(Area.class);

        CriteriaQuery query = cr.select(root);
//        if(!kw.isEmpty())
//            query = query.where(builder.like(root.get("name").as(String.class),  
//                    "%" + kw + "%"));

        areas = session.createQuery(query).getResultList();
        return areas;
    }

    @Override
    public List<Post> getPostsByArea(int areaId) {
        List<Post> posts = null;
        Session session = sessionFactory.getCurrentSession();

        Area areas = session.get(Area.class, areaId);
        if (areas != null) {
            Hibernate.initialize(areas.getPosts());
            posts = areas.getPosts();
        }
        return posts;
    }

}
