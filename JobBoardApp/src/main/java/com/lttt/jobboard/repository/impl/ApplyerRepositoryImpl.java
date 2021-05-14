/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.repository.impl;

import com.lttt.jobboard.pojo.Apply;
import com.lttt.jobboard.pojo.Area;
import com.lttt.jobboard.pojo.Employee;
import com.lttt.jobboard.pojo.Employer;
import com.lttt.jobboard.pojo.JobTypes;
import com.lttt.jobboard.pojo.Major;
import com.lttt.jobboard.pojo.Position;
import com.lttt.jobboard.pojo.Post;
import com.lttt.jobboard.repository.ApplyerRepository;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Dy
 */
@Repository
public class ApplyerRepositoryImpl implements ApplyerRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private SessionFactory sessionFactorys;

    @Override
    public List<Object[]> getEmployeeByPostId(int postId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root employeeRoot = query.from(Employee.class);
        Root applyRoot = query.from(Apply.class);
        Root postRoot = query.from(Post.class);

        query = query.where(builder.and(
                builder.equal(employeeRoot.get("id"), applyRoot.get("employeeId")),
                builder.equal(postRoot.get("id"), applyRoot.get("postId")),
                builder.equal(postRoot.get("id"), postId)
        ));
        query.multiselect(postRoot.get("id"),
                employeeRoot.get("firstName").as(String.class),
                employeeRoot.get("lastName").as(String.class),
                employeeRoot.get("email").as(String.class),
                applyRoot.get("cv").as(String.class),
                applyRoot.get("appyDate").as(Date.class),
                employeeRoot.get("id")
        );

        query.groupBy(postRoot.get("id"),
                employeeRoot.get("firstName").as(String.class),
                employeeRoot.get("lastName").as(String.class),
                employeeRoot.get("email").as(String.class),
                employeeRoot.get("cv").as(String.class),
                applyRoot.get("appyDate").as(Date.class),
                employeeRoot.get("id")
        );

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public void addApply(Apply a) {
        Session session = sessionFactorys.getCurrentSession();
        session.save(a);
    }

}
