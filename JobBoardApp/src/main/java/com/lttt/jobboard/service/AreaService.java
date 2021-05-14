/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.service;

import com.lttt.jobboard.pojo.Area;
import com.lttt.jobboard.pojo.Post;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface AreaService {

    List<Area> getAreas();

    List<Post> getPostsByArea(int areaId);
}
