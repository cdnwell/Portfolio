package com.namweb.domain.manager.book.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("mBookStatus")
@Getter
@Setter
@ToString
public class ManagerBookStatusDTO {
	private String name;
	private String bookDate;
	private String constructorDate;
}
