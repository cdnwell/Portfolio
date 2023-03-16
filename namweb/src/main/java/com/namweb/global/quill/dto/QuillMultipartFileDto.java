package com.namweb.global.quill.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Alias("qmFile")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuillMultipartFileDto {

	private MultipartFile file;
	
}
