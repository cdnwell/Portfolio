package com.project.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.MemberDTO;
import com.project.mapper.FruitMapper;

@Service
public class FruitService {
	private FruitMapper mapper;

	public FruitService(FruitMapper mapper) {
		this.mapper = mapper;
	}

	public int insertMember(MemberDTO member) {
		return mapper.insertMember(member);
	}

	public MemberDTO login(String id, String pass) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		
		return mapper.login(map);
	}

	public int selectId(String id) {
		MemberDTO dto = mapper.selectId(id);
		
		if(dto == null) return 0;
		return 1;
	}

	public int selectNick(String nick) {
		MemberDTO dto = mapper.selectNick(nick);
		
		if(dto == null) return 0;
		return 1;
	}

}
