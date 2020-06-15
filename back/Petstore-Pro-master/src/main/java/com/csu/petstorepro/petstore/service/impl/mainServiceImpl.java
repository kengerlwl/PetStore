package com.csu.petstorepro.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.csu.petstorepro.petstore.entity.main;
import com.csu.petstorepro.petstore.mapper.mainMapper;
import com.csu.petstorepro.petstore.service.mainService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;


@Service
public class mainServiceImpl implements mainService {

    @Resource
    private mainMapper MainMapper ;

    @Override
    public List<main> getMain() {
       return MainMapper.getMainList();
    }

    @Override
    public boolean saveBatch(Collection<main> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<main> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<main> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(main entity) {
        return false;
    }

    @Override
    public main getOne(Wrapper<main> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<main> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<main> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public BaseMapper<main> getBaseMapper() {
        return null;
    }
}
