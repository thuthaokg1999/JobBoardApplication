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
import com.lttt.jobboard.repository.EmployeeRepository;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Dy
 */
@Repository
public class EmployeeRepositoryImpl implements EmployeeRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Autowired
    private SessionFactory sessionFactorys;

    public boolean addOrUpdateEmployee(Employee employee) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            if (employee.getId() > 0) {
                session.update(employee);
            } else {
                session.save(employee);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    @Transactional
    public List<Object[]> getAllEmployee(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root employeeRoot = query.from(Employee.class);
        Root majorRoot = query.from(Major.class);
        Root userRoot = query.from(User.class);

        if (!username.isEmpty()) {
//            query.where(builder.equal(userRoot.get("username"), username));

            query = query.where(builder.and(
                    builder.equal(areaRoot.get("id"), employeeRoot.get("area")),
                    builder.equal(majorRoot.get("id"), employeeRoot.get("major")),
                    builder.equal(userRoot.get("id"), employeeRoot.get("user")),
                    builder.equal(userRoot.get("username"), username)
            ));

            query.multiselect(employeeRoot.get("id"),
                    employeeRoot.get("firstName").as(String.class),
                    employeeRoot.get("lastName").as(String.class),
                    employeeRoot.get("birthday").as(Date.class),
                    employeeRoot.get("gender").as(String.class),
                    employeeRoot.get("cv").as(String.class),
                    employeeRoot.get("phone").as(String.class),
                    employeeRoot.get("email").as(String.class),
                    employeeRoot.get("address").as(String.class),
                    employeeRoot.get("experience").as(String.class),
                    employeeRoot.get("salary").as(BigDecimal.class),
                    areaRoot.get("name").as(String.class),
                    userRoot.get("id"),
                    userRoot.get("username").as(String.class),
                    majorRoot.get("name").as(String.class),
                    majorRoot.get("id").as(String.class),
                    areaRoot.get("id").as(String.class)
            );

            query.groupBy(employeeRoot.get("id"),
                    employeeRoot.get("firstName").as(String.class),
                    employeeRoot.get("lastName").as(String.class),
                    employeeRoot.get("birthday").as(Date.class),
                    employeeRoot.get("gender").as(String.class),
                    employeeRoot.get("cv").as(String.class),
                    employeeRoot.get("phone").as(String.class),
                    employeeRoot.get("email").as(String.class),
                    employeeRoot.get("address").as(String.class),
                    employeeRoot.get("experience").as(String.class),
                    areaRoot.get("name").as(String.class),
                    userRoot.get("id"),
                    userRoot.get("username").as(String.class),
                    majorRoot.get("name").as(String.class)
            );
        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public void addEmployee(Employee employee) {
        Session session = sessionFactorys.getCurrentSession();
        session.save(employee);
    }

    @Override
    @Transactional
    public List<Employee> getEmployee() {
        List<Employee> employees;
        Session session = sessionFactorys.getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Employee> cr = builder.createQuery(Employee.class);
        Root<Employee> root = cr.from(Employee.class);

        CriteriaQuery<Employee> query = cr.select(root);
        employees = session.createQuery(query).getResultList();

        return employees;
    }

    @Override
    public Employee getEmployeeId(int id) {
        Employee employee;

        Session session = sessionFactorys.getCurrentSession();
        employee = session.get(Employee.class, id);

        return employee;
    }

    @Override
    public void updateEmployee(Employee employee) {
        Session session = sessionFactorys.getCurrentSession();
        session.update(employee);
    }

    @Override
    @Transactional
    public List<Object[]> getEmployeeAreaMajor(int areaId, int majorId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root usersRoot = query.from(User.class);
        Root majorRoot = query.from(Major.class);
        Root employeeRoot = query.from(Employee.class);

        if (areaId > 0 && majorId > 0) {
            query = query.where(builder.and(
                    builder.equal(areaRoot.get("id"), employeeRoot.get("area")),
                    builder.equal(usersRoot.get("id"), employeeRoot.get("user")),
                    builder.equal(majorRoot.get("id"), employeeRoot.get("major")),
                    builder.equal(employeeRoot.get("area"), areaId),
                    builder.equal(employeeRoot.get("major"), majorId)
            ));
            query.multiselect(employeeRoot.get("id"),
                    employeeRoot.get("firstName").as(String.class),
                    employeeRoot.get("lastName").as(String.class),
                    areaRoot.get("name").as(String.class),
                    majorRoot.get("name").as(String.class)
            );

            query.groupBy(employeeRoot.get("id"),
                    employeeRoot.get("firstName").as(String.class),
                    employeeRoot.get("lastName").as(String.class),
                    areaRoot.get("name").as(String.class),
                    majorRoot.get("name").as(String.class)
            );

        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    @Transactional
    public List<Object[]> getAllEmployee() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root areaRoot = query.from(Area.class);
        Root usersRoot = query.from(User.class);
        Root majorRoot = query.from(Major.class);
        Root employeeRoot = query.from(Employee.class);

        query = query.where(builder.and(
                builder.equal(areaRoot.get("id"), employeeRoot.get("area")),
                builder.equal(usersRoot.get("id"), employeeRoot.get("user")),
                builder.equal(majorRoot.get("id"), employeeRoot.get("major"))
        ));
        query.multiselect(employeeRoot.get("id"),
                employeeRoot.get("firstName").as(String.class),
                employeeRoot.get("lastName").as(String.class),
                areaRoot.get("name").as(String.class),
                majorRoot.get("name").as(String.class)
        );

        query.groupBy(employeeRoot.get("id"),
                employeeRoot.get("firstName").as(String.class),
                employeeRoot.get("lastName").as(String.class),
                areaRoot.get("name").as(String.class),
                majorRoot.get("name").as(String.class)
        );

        Query q = session.createQuery(query);
        return q.getResultList();
    }
}
