package com.namweb.domain.manager.graph.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("barGraph")
@Getter
@Setter
@ToString
public class BarGraphDTO {
	private int id;
	private String date;
	private int count;
}
