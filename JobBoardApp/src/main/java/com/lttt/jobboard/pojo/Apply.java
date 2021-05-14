/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Dy
 */
@Entity
@Table(name = "apply")
public class Apply implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
   
    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employeeId;

    @Column(name = "apply_date")
    private Date applyDate;

    @Column(name = "cv")
    private String cv;

    @Transient
    private MultipartFile cvFile;
    {
        applyDate = new Date();
    }

    @ManyToOne
    @JoinColumn(name = "post_id")
    private Post postId;

    /**
     * @return the employeeId
     */
    public Employee getEmployeeId() {
        return employeeId;
    }

    /**
     * @param employeeId the employeeId to set
     */
    public void setEmployeeId(Employee employeeId) {
        this.employeeId = employeeId;
    }

    /**
     * @return the appyDate
     */
    public Date getAppyDate() {
        return applyDate;
    }

    /**
     * @param appyDate the appyDate to set
     */
    public void setAppyDate(Date appyDate) {
        this.applyDate = appyDate;
    }

    /**
     * @return the postId
     */
    public Post getPostId() {
        return postId;
    }

    /**
     * @param postId the postId to set
     */
    public void setPostId(Post postId) {
        this.postId = postId;
    }

    /**
     * @return the cv
     */
    public String getCv() {
        return cv;
    }

    /**
     * @param cv the cv to set
     */
    public void setCv(String cv) {
        this.cv = cv;
    }

    /**
     * @return the cvFile
     */
    public MultipartFile getCvFile() {
        return cvFile;
    }

    /**
     * @param cvFile the cvFile to set
     */
    public void setCvFile(MultipartFile cvFile) {
        this.cvFile = cvFile;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }
}
