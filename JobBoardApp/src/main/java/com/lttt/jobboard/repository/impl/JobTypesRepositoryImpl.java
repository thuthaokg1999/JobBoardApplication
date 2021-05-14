/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.repository.impl;

import com.lttt.jobboard.pojo.Area;
import com.lttt.jobboard.pojo.Employer;
import com.lttt.jobboard.pojo.JobTypes;
import com.lttt.jobboard.pojo.Major;
import com.lttt.jobboard.pojo.Position;
import com.lttt.jobboard.pojo.Post;
import com.lttt.jobboard.repository.JobTypesRepository;
import java.math.BigDecimal;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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
public class JobTypesRepositoryImpl implements JobTypesRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private LocalSessionFactoryBean sessionsFactory;

    @Override
    @Transactional
    public List<JobTypes> getJobTypes(String kw) {
        List<JobTypes> jobtypes;
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<JobTypes> cr = builder.createQuery(JobTypes.class);
        Root<JobTypes> root = cr.from(JobTypes.class);

        CriteriaQuery query = cr.select(root);
        if (!kw.isEmpty()) {
            query = query.where(builder.like(root.get("name").as(String.class),
                    "%" + kw + "%"));
        }

        jobtypes = session.createQuery(query).getResultList();
        return jobtypes;
    }

    @Override
    public List<Object[]> getPostsByJobtypeId(int jobtypeId) {
        Session session = this.sessionsFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root jobTypesRoot = query.from(JobTypes.class);
        Root positionRoot = query.from(Position.class);
        Root majorRoot = query.from(Major.class);
        Root employerRoot = query.from(Employer.class);
        Root postRoot = query.from(Post.class);

        query = query.where(builder.and(
                builder.equal(postRoot.get("area"), areaRoot.get("id")),
                builder.equal(postRoot.get("jobTypes"), jobTypesRoot.get("id")),
                builder.equal(postRoot.get("position"), positionRoot.get("id")),
                builder.equal(postRoot.get("major"), majorRoot.get("id")),
                builder.equal(postRoot.get("employer"), employerRoot.get("id")),
                builder.equal(postRoot.get("jobTypes"), jobtypeId)
        ));
        query.multiselect(postRoot.get("id"),
                postRoot.get("salary").as(BigDecimal.class),
                employerRoot.get("companyName").as(String.class),
                employerRoot.get("logo").as(String.class),
                employerRoot.get("address").as(String.class),
                areaRoot.get("name").as(String.class),
                jobTypesRoot.get("name").as(String.class),
                positionRoot.get("name").as(String.class),
                employerRoot.get("id").as(String.class)
        );

        query.groupBy(postRoot.get("id"),
                postRoot.get("salary").as(BigDecimal.class),
                employerRoot.get("companyName").as(String.class),
                employerRoot.get("logo").as(String.class),
                employerRoot.get("address").as(String.class),
                areaRoot.get("name").as(String.class),
                jobTypesRoot.get("name").as(String.class),
                positionRoot.get("name").as(String.class),
                employerRoot.get("id").as(String.class)
        );

        Query q = session.createQuery(query);
        return q.getResultList();
    }

}
