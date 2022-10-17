package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("admin")
public class AdminDTO {
	private String managerNo;
	private String managerName;
	
	public AdminDTO(String managerNo, String managerName) {
		super();
		this.managerNo = managerNo;
		this.managerName = managerName;
	}
	
	public AdminDTO() {
	}
	
	public String getManagerNo() {
		return managerNo;
	}
	public void setManagerNo(String managerNo) {
		this.managerNo = managerNo;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	
	@Override
	public String toString() {
		return "AdminDTO [managerNo=" + managerNo + ", managerName=" + managerName + "]";
	}
	
}
