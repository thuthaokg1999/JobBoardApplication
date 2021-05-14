/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.service;

import com.lttt.jobboard.pojo.Employer;
import com.lttt.jobboard.pojo.Post;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Dy
 */
public interface PostService {

    List<Post> getPosts(String kw);

    List<Post> getPostsArea(String kw, int areaId);

    List<Post> getPostsBySalaryKw(String kw, BigDecimal fromSalary, BigDecimal toSalary);

    List<Post> getPostsBySalary(BigDecimal fromSalary, BigDecimal toSalary);

    Post getPostId(int id);

    void addPost(Post post);

    boolean deletePost(int PostId);

    List<Object[]> getAllPosts(int areaId, int majorId, BigDecimal fromSalary, BigDecimal toSalary);

    List<Object[]> getPostsAreaMajor(int areaId, int majorId);

    List<Object[]> getPostsSalary(BigDecimal fromSalary, BigDecimal toSalary);

    List<Object[]> getPost();

    List<Object[]> getPostDate(Date fromDate, Date toDate);

    List<Object[]> getPostsByAny(int areaId, int majorId, int s_jobtypeId, BigDecimal fromSalary, BigDecimal toSalary);

    List<Object[]> getPostsBySelected(int areaId, int majorId, int s_jobtypeId);

    List<Object[]> getPostsByCompanyName(String companyName);

    List<Object[]> getPostsSuggestByMajor(int majorSuggestId);
    
    List<Object[]> getPostsSuggestByArea(int areaSuggestId,int majorSuggestId);
    
    List<Object[]> getPostsInfoEmployer(int employerId);
}
