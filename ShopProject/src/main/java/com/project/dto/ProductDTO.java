package com.project.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Alias("product")
public class ProductDTO {
	private String productno;
	private String productname;
	private String receivingdate;
	private int productstock;
	private int inquantity;
	private int cost;
	private int price;
	private String categoryno;
	private String sizename;
	private String productphotono;
	private String photopath;
	private String colors;
	private String sizes;
}