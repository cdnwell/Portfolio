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
@Alias("cart")
public class CartDTO {
	private String cartno;
	private String productno;
	private String memberid;
	private String productname;
	private String sizeno;
	private String sizekind;
	private String colorno;
	private String colorname;
	private String productphotono;
	private String photopath;
	private String cartdate;
	private int quantity;
	private int price;
	private int deliveryprice;
}
