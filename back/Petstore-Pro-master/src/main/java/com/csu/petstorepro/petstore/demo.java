package com.csu.petstorepro.petstore;

import com.csu.petstorepro.petstore.entity.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class demo {

    @Test
    public void test () throws JsonProcessingException {
        Account account = new Account();

        //账号不能更改
        account.setUserid("666");

        account.setEmail("666");
        account.setFirstname("777");
        account.setLastname("888");
        account.setStatus("OK");
        account.setAddr1("jjj2");
        account.setAddr2("lll2");
        account.setCity("Tokyo");
        account.setState("WWF");
        account.setZip("zero");
        account.setCountry("Japan");
        account.setPhone("1530080");

        //密码不能更改
        account.setPassword("999");

        account.setLangpref("chinese6");
        account.setFavcategory("fish");
        account.setMylistopt(2);
        account.setBanneropt(3);


        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(account);
        System.out.println(json);
    }



}
