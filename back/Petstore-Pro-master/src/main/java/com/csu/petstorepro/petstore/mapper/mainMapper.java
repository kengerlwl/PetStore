package com.csu.petstorepro.petstore.mapper;

import com.csu.petstorepro.petstore.entity.Item;
import com.csu.petstorepro.petstore.entity.Lineitem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.csu.petstorepro.petstore.entity.main;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author lgx
 * @since 2020-03-10
 */

@Repository
public interface mainMapper{
    List<main> getMainList();
}
