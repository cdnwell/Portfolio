package com.namweb.global.file.dto;

import java.io.File;

import org.apache.ibatis.type.Alias;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("image")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class FileImageDto {
	private int bno; // 이미지가 속한 게시글 시퀀스 번호
	private int photoNo; // 이미지의 개별 시퀀스 번호
	@Setter(AccessLevel.NONE)
	private String photoPath;
	private String fileName;
	private String type;

	public FileImageDto(File file, int photoNo) {
		this.photoPath = file.getAbsolutePath();
		this.fileName = file.getName();

		switch (fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase()) {
		case "png":
		case "bmp":
		case "jpg":
		case "gif":
			this.type = "image";
			break;
		default:
			this.type = "normal";
		}

		this.photoNo = photoNo;
	}

	public void setPhotoPath(String photoPath) {
		File file = new File(photoPath);
		this.fileName = file.getName();

		switch (fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase()) {
		case "png":
		case "bmp":
		case "jpg":
		case "gif":
			this.type = "image";
			break;
		default:
			this.type = "normal";
		}

		this.photoPath = photoPath;
	}

}
