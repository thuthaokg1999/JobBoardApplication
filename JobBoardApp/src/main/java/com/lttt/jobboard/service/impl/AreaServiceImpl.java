/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.service.impl;

import com.lttt.jobboard.pojo.Area;
import com.lttt.jobboard.pojo.Post;
import com.lttt.jobboard.repository.AreaRepository;
import com.lttt.jobboard.service.AreaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Service
public class AreaServiceImpl implements AreaService {

    @Autowired
    private AreaRepository areaRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Area> getAreas() {
        return this.areaRepository.getAreas();
    }

    @Override
    public List<Post> getPostsByArea(int id) {
        return this.areaRepository.getPostsByArea(id);
    }

}
