/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.repository.impl;

import com.lttt.jobboard.pojo.Area;
import com.lttt.jobboard.pojo.Employee;
import com.lttt.jobboard.pojo.Employer;
import com.lttt.jobboard.pojo.JobTypes;
import com.lttt.jobboard.pojo.Major;
import com.lttt.jobboard.pojo.Position;
import com.lttt.jobboard.pojo.Post;
import com.lttt.jobboard.pojo.User;
import com.lttt.jobboard.repository.EmployerRepository;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;
import org.hibernate.HibernateException;
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
public class EmployerRepositoryImpl implements EmployerRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Autowired
    private SessionFactory sessionFactorys;

    @Override
    @Transactional
    public List<Object[]> getAllEmployer(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root employerRoot = query.from(Employer.class);
        Root userRoot = query.from(User.class);

        if (!username.isEmpty()) {
            query = query.where(builder.and(
                    builder.equal(areaRoot.get("id"), employerRoot.get("area")),
                    builder.equal(userRoot.get("id"), employerRoot.get("user")),
                    builder.equal(userRoot.get("username"), username)
            ));

            query.multiselect(employerRoot.get("id"),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("description").as(String.class),
                    employerRoot.get("scale").as(String.class),
                    employerRoot.get("phone").as(String.class),
                    employerRoot.get("email").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    userRoot.get("id"),
                    userRoot.get("username").as(String.class)
            );

            query.groupBy(employerRoot.get("id"),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("description").as(Date.class),
                    employerRoot.get("scale").as(String.class),
                    employerRoot.get("phone").as(String.class),
                    employerRoot.get("email").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    userRoot.get("id"),
                    userRoot.get("username").as(String.class)
            );
        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    @Transactional
    public List<Object[]> getPostsEmployer(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root jobTypesRoot = query.from(JobTypes.class);
        Root positionRoot = query.from(Position.class);
        Root postRoot = query.from(Post.class);
        Root employerRoot = query.from(Employer.class);
        Root userRoot = query.from(User.class);

        if (!username.isEmpty()) {
            query = query.where(builder.and(
                    builder.equal(positionRoot.get("id"), postRoot.get("position")),
                    builder.equal(areaRoot.get("id"), postRoot.get("area")),
                    builder.equal(jobTypesRoot.get("id"), postRoot.get("jobTypes")),
                    builder.equal(employerRoot.get("id"), postRoot.get("employer")),
                    builder.equal(userRoot.get("id"), employerRoot.get("user")),
                    builder.equal(userRoot.get("username"), username)
            ));

            query.multiselect(employerRoot.get("id"),
                    employerRoot.get("logo").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    postRoot.get("salary").as(BigDecimal.class),
                    areaRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class),
                    postRoot.get("id").as(String.class),
                    userRoot.get("id"),
                    userRoot.get("username").as(String.class)
            );

            query.groupBy(
                    employerRoot.get("id"),
                    employerRoot.get("logo").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    postRoot.get("salary").as(BigDecimal.class),
                    areaRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class),
                    postRoot.get("id").as(String.class),
                    userRoot.get("id"),
                    userRoot.get("username").as(String.class)
            );
        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public void addEmployer(Employer employer) {
        Session session = sessionFactorys.getCurrentSession();
        session.save(employer);
    }

//    @Override
//    public boolean addOrUpdateEmployee(Employer employer) {
//        Session session = this.sessionFactory.getObject().getCurrentSession();
//        try {
//            if (employer.getId() > 0) {
//                session.update(employer);
//            } else {
//                session.save(employer);
//            }
//            return true;
//        } catch (HibernateException ex) {
//            ex.printStackTrace();
//        }
//        return false;
//    }  
    @Override
    public void AddOrUpdateEmployer(Employer employer) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
//        Session session = sessionFactorys.getCurrentSession();
        if (employer.getId() > 0) {
            session.update(employer);
        } else if (employer.getId() == 0) {
            session.save(employer);
        }
//        session.update(employer);
    }

    @Override
    @Transactional
    public List<Employer> getEmployer() {
        List<Employer> employer;
        Session session = sessionFactorys.getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Employer> cr = builder.createQuery(Employer.class);
        Root<Employer> root = cr.from(Employer.class);

        CriteriaQuery<Employer> query = cr.select(root);
        employer = session.createQuery(query).getResultList();

        return employer;
    }

    @Override
    public Employer getEmployerId(int id) {
        Employer employer;

        Session session = sessionFactorys.getCurrentSession();
        employer = session.get(Employer.class, id);

        return employer;
    }

    @Override
    public List<Employer> getEmployerKw(String kw) {
        List<Employer> employes;
        Session session = sessionFactorys.getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Employer> cr = builder.createQuery(Employer.class);
        Root<Employer> root = cr.from(Employer.class);

        CriteriaQuery<Employer> query = cr.select(root);
        if (!kw.isEmpty()) {
            String pattern = String.format("%%%s%%", kw);
            Predicate p2 = builder.like(builder.lower(root.get("companyName").as(String.class)), pattern.toLowerCase());

            query = query.where(builder.or(p2));
        }
        employes = session.createQuery(query).getResultList();
        return employes;
    }
}
