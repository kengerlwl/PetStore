package com.csu.petstorepro.petstore.controller;

import com.alibaba.fastjson.JSONObject;
import com.csu.petstorepro.petstore.common.ReturnEntity;
import com.csu.petstorepro.petstore.entity.Account;
import com.csu.petstorepro.petstore.entity.Cart;
import com.csu.petstorepro.petstore.entity.main;
import com.csu.petstorepro.petstore.service.impl.mainServiceImpl;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class MainController {

    @Resource
    private mainServiceImpl mainService ;
    @RequestMapping(value = "/getMain",method = RequestMethod.GET)
    @ResponseBody
    public ReturnEntity getMainList()
    {
        JSONObject data = new JSONObject();

        List<main> result = mainService.getMain();

            data.put("result",result);
            return ReturnEntity.successResult(data);

    }



}
