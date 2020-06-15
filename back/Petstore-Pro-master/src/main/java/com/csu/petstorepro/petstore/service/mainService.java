package com.csu.petstorepro.petstore.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.csu.petstorepro.petstore.entity.main;

import java.util.List;

public interface mainService extends IService<main> {
    List<main> getMain();
}
