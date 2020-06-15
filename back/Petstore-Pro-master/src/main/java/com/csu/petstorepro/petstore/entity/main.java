package com.csu.petstorepro.petstore.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class main implements Serializable {
    private static final long serialVersionUID = 1L;

    private String mainT;
    private String littleT;


}
