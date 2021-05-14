/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.repository.impl;

import com.lttt.jobboard.pojo.User;
import com.lttt.jobboard.repository.UserRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Dy
 */
@Repository
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.save(user);
    }

    @Override
    public List<User> getUsers(String username) {
        List<User> users;
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> cr = builder.createQuery(User.class);

        Root<User> root = cr.from(User.class);

        CriteriaQuery<User> query = cr.select(root);
        if (!username.isEmpty()) {
            query.where(builder.equal(root.get("username"), username));
        }

        users = session.createQuery(query).getResultList();

        return users;

//        List<User> users;
//        Session session = sessionFactory.getCurrentSession();
//
//        CriteriaBuilder builder = session.getCriteriaBuilder();
//        CriteriaQuery<User> cr = builder.createQuery(User.class);
//        Root<User> root = cr.from(User.class);
//
//        CriteriaQuery<User> query = cr.select(root);
//        if (!username.isEmpty()) {
//            Predicate p1 = builder.like(root.get("username").as(String.class), username);
//
//            query = query.where(builder.or( p1));
//        }
//
//        users = session.createQuery(query).getResultList();
//
//        return users;
    }

//    @Override
//    @Transactional
//    public List<Object[]> getAllUsers(String username) {
//
//    }
}
