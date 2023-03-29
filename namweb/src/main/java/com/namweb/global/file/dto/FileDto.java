package com.namweb.global.file.dto;

import java.io.File;

import org.apache.ibatis.type.Alias;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("file")
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class FileDto {
	@Setter(AccessLevel.NONE)
	private String filePath;
	private String fileName;
	private String type;
	private int fileNo;
	private int bno;
	
	public FileDto(File file, int fileNo) {
		this.filePath = file.getAbsolutePath();
		this.fileName = file.getName();
		switch(fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase()) {
		case "png":
		case "bmp":
		case "jpg":
		case "gif":
			this.type = "image";
			break;
		default:
			this.type = "normal";
		}
		this.fileNo = fileNo;
	}


	public void setFilePath(String filePath) {
		File file = new File(filePath);
		this.fileName = file.getName();
		switch(fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase()) {
		case "png":
		case "bmp":
		case "jpg":
		case "gif":
			this.type = "image";
			break;
		default:
			this.type = "normal";
		}
		this.filePath = filePath;
	}

}
