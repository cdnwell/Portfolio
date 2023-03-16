package com.namweb.global.login.dto;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.type.Alias;
import org.springframework.lang.Nullable;
import org.springframework.web.multipart.MultipartFile;

@Alias("cmFile")
public class CustomMultipartFile implements MultipartFile {
	
	private final byte[] bytes;
	String name;
	String originalFilename;
	String contentType;
	boolean isEmpty;
	long size;
	
	

	public CustomMultipartFile(byte[] bytes, String name, String originalFilename, String contentType, long size) {
		super();
		this.bytes = bytes;
		this.name = name;
		this.originalFilename = originalFilename;
		this.contentType = contentType;
		this.size = size;
		this.isEmpty = false;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Nullable
	public String getOriginalFilename() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Nullable
	public String getContentType() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public long getSize() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public byte[] getBytes() throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public InputStream getInputStream() throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void transferTo(File dest) throws IOException, IllegalStateException {
		// TODO Auto-generated method stub
		
	}

}
