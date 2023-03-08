package com.namweb.domain.google.email.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GoogleEmailMapper {

	String selectEmailCheck(String email);

}
