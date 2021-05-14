/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.service.impl;

import com.lttt.jobboard.pojo.Post;
import com.lttt.jobboard.repository.PostRepository;
import com.lttt.jobboard.service.PostService;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Dy
 */
@Service
@Transactional
public class PostServiceImpl implements PostService {
    
    @Autowired
    private PostRepository postRepository;
    
    @Override
    @Transactional(readOnly = true)
    public List<Post> getPosts(String kw) {
        return postRepository.getPosts(kw);
    }
    
    @Override
    @Transactional(readOnly = true)
    public List<Post> getPostsBySalary(BigDecimal fromSalary, BigDecimal toSalary) {
        return postRepository.getPostsBySalary(fromSalary, toSalary);
    }
    
    @Override
    @Transactional(readOnly = true)
    public Post getPostId(int id) {
        return postRepository.getPostId(id);
    }
    
    @Override
    @Transactional
    public List<Post> getPostsBySalaryKw(String kw, BigDecimal fromSalary, BigDecimal toSalary) {
        return postRepository.getPostsBySalaryKw(kw, fromSalary, toSalary);
    }
    
    @Override
    @Transactional
    public List<Post> getPostsArea(String kw, int id) {
        return postRepository.getPostsArea(kw, id);
    }
    
    @Override
    @Transactional
    public List<Object[]> getAllPosts(int areaId, int majorId, BigDecimal fromSalary, BigDecimal toSalary) {
        return postRepository.getAllPosts(areaId, majorId, fromSalary, toSalary);
    }
    
    @Override
    @Transactional
    public List<Object[]> getPostsAreaMajor(int areaId, int majorId) {
        return postRepository.getPostsAreaMajor(areaId, majorId);
    }
    
    @Override
    @Transactional
    public List<Object[]> getPostsSalary(BigDecimal fromSalary, BigDecimal toSalary) {
        return postRepository.getPostsSalary(fromSalary, toSalary);
    }
    
    @Override
    @Transactional
    public List<Object[]> getPost() {
        return postRepository.getPost();
    }
    
    @Override
    @Transactional
    public void addPost(Post post) {
        postRepository.addPost(post);
    }
    
    @Override
    @Transactional
    public boolean deletePost(int PostId) {
        return this.postRepository.deletePost(PostId);
    }
    
    @Override
    @Transactional
    public List<Object[]> getPostDate(Date fromDate, Date toDate) {
        return this.postRepository.getPostDate(fromDate, toDate);
    }
    
    @Override
    @Transactional
    public List<Object[]> getPostsByAny(int areaId, int majorId, int s_jobtypeId, BigDecimal fromSalary, BigDecimal toSalary) {
        return this.postRepository.getPostsByAny(areaId, majorId, s_jobtypeId, fromSalary, toSalary);
    }
    
    @Override
    @Transactional
    public List<Object[]> getPostsBySelected(int areaId, int majorId, int s_jobtypeId) {
        return this.postRepository.getPostsBySelected(areaId, majorId, s_jobtypeId);
    }
    
    @Override
    @Transactional
    public List<Object[]> getPostsByCompanyName(String companyName) {
        return this.postRepository.getPostsByCompanyName(companyName);
    }
    
    @Override
    @Transactional
    public List<Object[]> getPostsSuggestByMajor(int majorSuggestId) {
        return this.postRepository.getPostsSuggestByMajor(majorSuggestId);
    }

    @Override
    @Transactional
    public List<Object[]> getPostsInfoEmployer(int id) {
        return this.postRepository.getPostsInfoEmployer(id);
    }

    @Override
    @Transactional
    public List<Object[]> getPostsSuggestByArea(int areaSuggestId, int majorSuggestId) {
        return this.postRepository.getPostsSuggestByArea(areaSuggestId, majorSuggestId);
    }
    
}
