/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lttt.jobboard.service.impl;

import com.lttt.jobboard.pojo.Position;
import com.lttt.jobboard.repository.PositionRepository;
import com.lttt.jobboard.service.PositionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Service
@Transactional
public class PositionServiceImpl implements PositionService {

    @Autowired
    private PositionRepository positionRepository;

    @Override
    @Transactional
    public List<Position> getPositions(String kw) {
        return positionRepository.getPositions(kw);
    }

//    @Override
//    @Transactional
//    public List<Position> getPositionsByMajor(int id) {
//        return positionRepository.getPositionsByMajor(id);
//    }
}
