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
import com.lttt.jobboard.repository.PostRepository;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;
import org.hibernate.Hibernate;
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
public class PostRepositoryImpl implements PostRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private LocalSessionFactoryBean sessionsFactory;

    @Override
    public List<Post> getPosts(String kw) {
        List<Post> posts;
        Session session = sessionFactory.getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Post> cr = builder.createQuery(Post.class);
        Root<Post> root = cr.from(Post.class);

        CriteriaQuery<Post> query = cr.select(root);
        if (!kw.isEmpty()) {
            String pattern = String.format("%%%s%%", kw);
            Predicate p2 = builder.like(root.get("description").as(String.class), pattern);

            query = query.where(builder.or(p2));
        }
        posts = session.createQuery(query).getResultList();
        return posts;
    }

    @Override
    public List<Post> getPostsBySalary(BigDecimal fromSalary, BigDecimal toSalary) {
        List<Post> posts;
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Post> cr = builder.createQuery(Post.class);
        Root<Post> root = cr.from(Post.class);

        CriteriaQuery query = cr.select(root);
        if (fromSalary != null && toSalary != null) {
            Predicate p1 = builder.greaterThanOrEqualTo(root.get("salary").as(BigDecimal.class), fromSalary);
            Predicate p2 = builder.lessThanOrEqualTo(root.get("salary").as(BigDecimal.class), toSalary);

            query = query.where(builder.and(p1, p2));
        }

        posts = session.createQuery(query).getResultList();

        return posts;
    }

    @Override
    public Post getPostId(int id) {
        Post post;

        Session session = sessionFactory.getCurrentSession();
        post = session.get(Post.class, id);

        return post;
    }

    @Override
    public List<Post> getPostsBySalaryKw(String kw, BigDecimal fromSalary, BigDecimal toSalary) {
        List<Post> posts;
        Session session = sessionFactory.getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Post> cr = builder.createQuery(Post.class);
        Root<Post> root = cr.from(Post.class);

        CriteriaQuery<Post> query = cr.select(root);
        if (!kw.isEmpty() && fromSalary != null && toSalary != null) {
            String pattern = String.format("%%%s%%", kw);
            Predicate p1 = builder.like(root.get("description").as(String.class), pattern);
            Predicate p2 = builder.greaterThanOrEqualTo(root.get("salary").as(BigDecimal.class), fromSalary);
            Predicate p3 = builder.lessThanOrEqualTo(root.get("salary").as(BigDecimal.class), toSalary);

            query = query.where(builder.and(p1, p2, p3));
        }

        posts = session.createQuery(query).getResultList();

        return posts;
    }

    @Override
    public List<Post> getPostsArea(String kw, int areaId) {
        List<Post> posts;
        Session session = sessionFactory.getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Post> cr = builder.createQuery(Post.class);
        Root<Post> root = cr.from(Post.class);

        CriteriaQuery<Post> query = cr.select(root);
        if (!kw.isEmpty()) {
            String pattern = String.format("%%%s%%", kw);
            Predicate p2 = builder.like(root.get("description").as(String.class), pattern);
            Predicate p3 = builder.equal(root.get("area").as(Integer.class), areaId);

            query = query.where(builder.and(p2, p3));
        }

        posts = session.createQuery(query).getResultList();

        return posts;
    }

    @Override
    @Transactional
    public List<Object[]> getAllPosts(int areaId, int majorId, BigDecimal fromSalary, BigDecimal toSalary) {
        Session session = this.sessionsFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root jobTypesRoot = query.from(JobTypes.class);
        Root positionRoot = query.from(Position.class);
        Root majorRoot = query.from(Major.class);
        Root employerRoot = query.from(Employer.class);
        Root postRoot = query.from(Post.class);

        if (areaId > 0 && majorId > 0 && fromSalary != null && toSalary != null) {
            query = query.where(builder.and(
                    builder.equal(areaRoot.get("id"), postRoot.get("area")),
                    builder.equal(jobTypesRoot.get("id"), postRoot.get("jobTypes")),
                    builder.equal(positionRoot.get("id"), postRoot.get("position")),
                    builder.equal(majorRoot.get("id"), postRoot.get("major")),
                    builder.equal(employerRoot.get("id"), postRoot.get("employer")),
                    builder.equal(postRoot.get("area"), areaId),
                    builder.equal(postRoot.get("major"), majorId),
                    builder.greaterThanOrEqualTo(postRoot.get("salary").as(BigDecimal.class), fromSalary),
                    builder.lessThanOrEqualTo(postRoot.get("salary").as(BigDecimal.class), toSalary)
            ));
            query.multiselect(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

            query.groupBy(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    @Transactional
    public List<Object[]> getPostsAreaMajor(int areaId, int majorId) {
        Session session = this.sessionsFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root jobTypesRoot = query.from(JobTypes.class);
        Root positionRoot = query.from(Position.class);
        Root majorRoot = query.from(Major.class);
        Root employerRoot = query.from(Employer.class);
        Root postRoot = query.from(Post.class);

        if (areaId > 0 && majorId > 0) {
            query = query.where(builder.and(
                    builder.equal(areaRoot.get("id"), postRoot.get("area")),
                    builder.equal(jobTypesRoot.get("id"), postRoot.get("jobTypes")),
                    builder.equal(positionRoot.get("id"), postRoot.get("position")),
                    builder.equal(majorRoot.get("id"), postRoot.get("major")),
                    builder.equal(employerRoot.get("id"), postRoot.get("employer")),
                    builder.equal(postRoot.get("area"), areaId),
                    builder.equal(postRoot.get("major"), majorId)
            ));
            query.multiselect(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

            query.groupBy(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    @Transactional
    public List<Object[]> getPostsSalary(BigDecimal fromSalary, BigDecimal toSalary) {
        Session session = this.sessionsFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root jobTypesRoot = query.from(JobTypes.class);
        Root positionRoot = query.from(Position.class);
        Root majorRoot = query.from(Major.class);
        Root employerRoot = query.from(Employer.class);
        Root postRoot = query.from(Post.class);

        if (fromSalary != null && toSalary != null) {

            query = query.where(builder.and(
                    builder.equal(areaRoot.get("id"), postRoot.get("area")),
                    builder.equal(jobTypesRoot.get("id"), postRoot.get("jobTypes")),
                    builder.equal(positionRoot.get("id"), postRoot.get("position")),
                    builder.equal(majorRoot.get("id"), postRoot.get("major")),
                    builder.equal(employerRoot.get("id"), postRoot.get("employer")),
                    builder.greaterThanOrEqualTo(postRoot.get("salary").as(BigDecimal.class), fromSalary),
                    builder.lessThanOrEqualTo(postRoot.get("salary").as(BigDecimal.class), toSalary)
            ));
            query.multiselect(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

            query.groupBy(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<Object[]> getPost() {
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
                builder.equal(areaRoot.get("id"), postRoot.get("area")),
                builder.equal(jobTypesRoot.get("id"), postRoot.get("jobTypes")),
                builder.equal(positionRoot.get("id"), postRoot.get("position")),
                builder.equal(majorRoot.get("id"), postRoot.get("major")),
                builder.equal(employerRoot.get("id"), postRoot.get("employer"))
        ));
        query.multiselect(postRoot.get("id"),
                postRoot.get("salary").as(BigDecimal.class),
                employerRoot.get("companyName").as(String.class),
                employerRoot.get("logo").as(String.class),
                employerRoot.get("address").as(String.class),
                areaRoot.get("name").as(String.class),
                jobTypesRoot.get("name").as(String.class),
                positionRoot.get("name").as(String.class)
        );

        query.groupBy(postRoot.get("id"),
                postRoot.get("salary").as(BigDecimal.class),
                employerRoot.get("companyName").as(String.class),
                employerRoot.get("logo").as(String.class),
                employerRoot.get("address").as(String.class),
                areaRoot.get("name").as(String.class),
                jobTypesRoot.get("name").as(String.class),
                positionRoot.get("name").as(String.class)
        );

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    @Transactional
    public void addPost(Post post) {
        Session session = sessionFactory.getCurrentSession();
        session.save(post);
    }

    @Override
    @Transactional
    public boolean deletePost(int PostId) {
        try {
            Session session = this.sessionsFactory.getObject().getCurrentSession();
            session.delete(session.get(Post.class, PostId));
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    @Transactional
    public List<Object[]> getPostDate(Date fromDate, Date toDate) {
        Session session = this.sessionsFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root jobTypesRoot = query.from(JobTypes.class);
        Root positionRoot = query.from(Position.class);
        Root majorRoot = query.from(Major.class);
        Root employerRoot = query.from(Employer.class);
        Root postRoot = query.from(Post.class);

        query.where(builder.and(
                builder.equal(areaRoot.get("id"), postRoot.get("area")),
                builder.equal(jobTypesRoot.get("id"), postRoot.get("jobTypes")),
                builder.equal(positionRoot.get("id"), postRoot.get("position")),
                builder.equal(majorRoot.get("id"), postRoot.get("major")),
                builder.equal(employerRoot.get("id"), postRoot.get("employer"))
        ));

        query.multiselect(postRoot.get("id"),
                postRoot.get("salary").as(BigDecimal.class),
                employerRoot.get("companyName").as(String.class),
                employerRoot.get("logo").as(String.class),
                employerRoot.get("address").as(String.class),
                areaRoot.get("name").as(String.class),
                jobTypesRoot.get("name").as(String.class),
                positionRoot.get("name").as(String.class)
        );

        query.groupBy(postRoot.get("id"),
                postRoot.get("salary").as(BigDecimal.class),
                employerRoot.get("companyName").as(String.class),
                employerRoot.get("logo").as(String.class),
                employerRoot.get("address").as(String.class),
                areaRoot.get("name").as(String.class),
                jobTypesRoot.get("name").as(String.class),
                positionRoot.get("name").as(String.class)
        );

        if (fromDate != null && toDate != null) {
            Predicate p1 = builder.greaterThanOrEqualTo(postRoot.get("createdDate").as(Date.class), fromDate);
            Predicate p2 = builder.lessThanOrEqualTo(postRoot.get("createdDate").as(Date.class), toDate);
            query = query.having(p1, p2);
        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    @Transactional
    public List<Object[]> getPostsByAny(int areaId, int majorId, int s_jobtypeId, BigDecimal fromSalary, BigDecimal toSalary) {
        Session session = this.sessionsFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root jobTypesRoot = query.from(JobTypes.class);
        Root positionRoot = query.from(Position.class);
        Root majorRoot = query.from(Major.class);
        Root employerRoot = query.from(Employer.class);
        Root postRoot = query.from(Post.class);

        if (areaId > 0 && majorId > 0 && s_jobtypeId > 0 && fromSalary != null && toSalary != null) {
            query = query.where(builder.and(
                    builder.equal(areaRoot.get("id"), postRoot.get("area")),
                    builder.equal(jobTypesRoot.get("id"), postRoot.get("jobTypes")),
                    builder.equal(positionRoot.get("id"), postRoot.get("position")),
                    builder.equal(majorRoot.get("id"), postRoot.get("major")),
                    builder.equal(employerRoot.get("id"), postRoot.get("employer")),
                    builder.equal(postRoot.get("area"), areaId),
                    builder.equal(postRoot.get("major"), majorId),
                    builder.equal(postRoot.get("jobTypes"), s_jobtypeId),
                    builder.greaterThanOrEqualTo(postRoot.get("salary").as(BigDecimal.class), fromSalary),
                    builder.lessThanOrEqualTo(postRoot.get("salary").as(BigDecimal.class), toSalary)
            ));
            query.multiselect(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

            query.groupBy(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    @Transactional
    public List<Object[]> getPostsBySelected(int areaId, int majorId, int s_jobtypeId) {
        Session session = this.sessionsFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root jobTypesRoot = query.from(JobTypes.class);
        Root positionRoot = query.from(Position.class);
        Root majorRoot = query.from(Major.class);
        Root employerRoot = query.from(Employer.class);
        Root postRoot = query.from(Post.class);

        if (areaId > 0 && majorId > 0 && s_jobtypeId > 0) {
            query = query.where(builder.and(
                    builder.equal(areaRoot.get("id"), postRoot.get("area")),
                    builder.equal(jobTypesRoot.get("id"), postRoot.get("jobTypes")),
                    builder.equal(positionRoot.get("id"), postRoot.get("position")),
                    builder.equal(majorRoot.get("id"), postRoot.get("major")),
                    builder.equal(employerRoot.get("id"), postRoot.get("employer")),
                    builder.equal(postRoot.get("area"), areaId),
                    builder.equal(postRoot.get("major"), majorId),
                    builder.equal(postRoot.get("jobTypes"), s_jobtypeId)
            ));
            query.multiselect(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

            query.groupBy(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<Object[]> getPostsByCompanyName(String companyName) {
        Session session = this.sessionsFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root jobTypesRoot = query.from(JobTypes.class);
        Root positionRoot = query.from(Position.class);
        Root majorRoot = query.from(Major.class);
        Root employerRoot = query.from(Employer.class);
        Root postRoot = query.from(Post.class);

        if (!companyName.isEmpty()) {
            String pattern = String.format("%%%s%%", companyName);
            query = query.where(builder.and(
                    builder.equal(areaRoot.get("id"), postRoot.get("area")),
                    builder.equal(jobTypesRoot.get("id"), postRoot.get("jobTypes")),
                    builder.equal(positionRoot.get("id"), postRoot.get("position")),
                    builder.equal(majorRoot.get("id"), postRoot.get("major")),
                    builder.equal(employerRoot.get("id"), postRoot.get("employer")),
                    builder.like(builder.lower(employerRoot.get("companyName").as(String.class)), pattern.toLowerCase())
            ));
            query.multiselect(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

            query.groupBy(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<Object[]> getPostsSuggestByMajor(int majorSuggestId) {
        Session session = this.sessionsFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root jobTypesRoot = query.from(JobTypes.class);
        Root positionRoot = query.from(Position.class);
        Root majorRoot = query.from(Major.class);
        Root employerRoot = query.from(Employer.class);
        Root postRoot = query.from(Post.class);

        if (majorSuggestId > 0) {
            query = query.where(builder.and(
                    builder.equal(areaRoot.get("id"), postRoot.get("area")),
                    builder.equal(jobTypesRoot.get("id"), postRoot.get("jobTypes")),
                    builder.equal(positionRoot.get("id"), postRoot.get("position")),
                    builder.equal(majorRoot.get("id"), postRoot.get("major")),
                    builder.equal(employerRoot.get("id"), postRoot.get("employer")),
                    builder.equal(majorRoot.get("id"), majorSuggestId)
            ));
            query.multiselect(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

            query.groupBy(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    @Transactional
    public List<Object[]> getPostsInfoEmployer(int employerId) {
        Session session = this.sessionsFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root jobTypesRoot = query.from(JobTypes.class);
        Root employerRoot = query.from(Employer.class);
        Root postRoot = query.from(Post.class);
        Root positionRoot = query.from(Position.class);

        if (employerId > 0) {
            query = query.where(builder.and(
                    builder.equal(areaRoot.get("id"), postRoot.get("area")),
                    builder.equal(jobTypesRoot.get("id"), postRoot.get("jobTypes")),
                    builder.equal(employerRoot.get("id"), postRoot.get("employer")),
                    builder.equal(positionRoot.get("id"), postRoot.get("position")),
                    builder.equal(postRoot.get("employer"), employerId)
            ));
            query.multiselect(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    employerRoot.get("phone").as(String.class),
                    employerRoot.get("email").as(String.class),
                    employerRoot.get("scale").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

            query.groupBy(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    employerRoot.get("phone").as(String.class),
                    employerRoot.get("email").as(String.class),
                    employerRoot.get("scale").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );
        }
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<Object[]> getPostsSuggestByArea(int areaSuggestId, int majorSuggestId) {
                Session session = this.sessionsFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root jobTypesRoot = query.from(JobTypes.class);
        Root positionRoot = query.from(Position.class);
        Root majorRoot = query.from(Major.class);
        Root employerRoot = query.from(Employer.class);
        Root postRoot = query.from(Post.class);

        if (areaSuggestId > 0) {
            query = query.where(builder.and(
                    builder.equal(areaRoot.get("id"), postRoot.get("area")),
                    builder.equal(jobTypesRoot.get("id"), postRoot.get("jobTypes")),
                    builder.equal(positionRoot.get("id"), postRoot.get("position")),
                    builder.equal(majorRoot.get("id"), postRoot.get("major")),
                    builder.equal(employerRoot.get("id"), postRoot.get("employer")),
                    builder.equal(areaRoot.get("id"), areaSuggestId),
                    builder.equal(majorRoot.get("id"), majorSuggestId)
            ));
            query.multiselect(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

            query.groupBy(postRoot.get("id"),
                    postRoot.get("salary").as(BigDecimal.class),
                    employerRoot.get("companyName").as(String.class),
                    employerRoot.get("logo").as(String.class),
                    employerRoot.get("address").as(String.class),
                    areaRoot.get("name").as(String.class),
                    jobTypesRoot.get("name").as(String.class),
                    positionRoot.get("name").as(String.class)
            );

        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

}
