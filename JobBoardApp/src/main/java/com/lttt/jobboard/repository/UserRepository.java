/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.repository;

import com.lttt.jobboard.pojo.User;
import java.util.List;

/**
 *
 * @author Dy
 */
public interface UserRepository {

    void addUser(User user);

    List<User> getUsers(String username);

//    List<Object[]> getAllUsers(String username);
//    public List<User> getUsers();
}
