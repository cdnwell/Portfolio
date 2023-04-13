package com.namweb.domain.manager.book.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("mBookInfo")
@Getter
@Setter
@ToString
public class ManagerBookInfoDTO {
	private String date;
	private boolean morning;
	private boolean afternoon;
	private boolean extra;
}
