package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("manager")
public class ManagerDTO {
	private String managerId;
	private String pw;

	public ManagerDTO() {
	}

	public ManagerDTO(String managerId, String pw) {
		super();
		this.managerId = managerId;
		this.pw = pw;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	@Override
	public String toString() {
		return "ManagerDTO [managerId=" + managerId + ", pw=" + pw + "]";
	}
	
}
