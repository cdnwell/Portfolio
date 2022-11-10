package com.project;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.service.ProductService;

@SpringBootTest
public class MyprojectApplicationTests {
    @Autowired
    private ProductService productService;

	@Test
	void contextLoads() {
	    String productno = "1";
	    
	    List<String> filepath = productService.selectDeleteFilePath(productno);
	    
	    for(String s : filepath)
	        System.out.println(s);
	}

}
