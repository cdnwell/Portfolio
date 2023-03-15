package com.namweb.global.quill.dto;

import java.util.ArrayList;

import org.apache.ibatis.type.Alias;
import org.json.JSONArray;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("qlImage")
@Getter
@Setter
@ToString
public class QuillImageLinkDto {
	private int boardNo;
	@Setter(AccessLevel.NONE)
	private ArrayList<Integer> photoNo;
	
	public void setPhotoNo(JSONArray jsonArr) {
		if(jsonArr.length() == 0) return;
		
		ArrayList<Integer> list = new ArrayList<>();
		
		for(int i = 0; i < jsonArr.length();i++) {
			list.add(jsonArr.getInt(i));
		}
		
//		photoNo = new int[list.size()];
//		
//		for(int i =0; i<list.size();i++) {
//			photoNo[i] = list.get(i);
//		}
		
		this.photoNo = list;
	}
}
