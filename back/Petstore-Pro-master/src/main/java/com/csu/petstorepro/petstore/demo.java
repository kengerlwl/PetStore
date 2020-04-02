package com.csu.petstorepro.petstore;

import com.csu.petstorepro.petstore.entity.Supplier;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;

public class demo {

    @Test
    public void test () throws JsonProcessingException {
        Supplier supplier = new Supplier();
        supplier.setSuppid("5");

        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(supplier);
        System.out.println(json);
    }



}
