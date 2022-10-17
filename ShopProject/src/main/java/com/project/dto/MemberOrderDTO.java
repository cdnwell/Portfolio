package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("memberOrder")
public class MemberOrderDTO {
	private String memberOrderNo;
	private String productNo;
	private String memberId;
	private int orderQuantity;
	private int priceSum;
	private String postNo;
	private String address;
	private String addressDetail;
	
	public MemberOrderDTO() {
	}
	
	public MemberOrderDTO(String memberOrderNo, String productNo, String memberId, int orderQuantity, int priceSum,
			String postNo, String address, String addressDetail) {
		super();
		this.memberOrderNo = memberOrderNo;
		this.productNo = productNo;
		this.memberId = memberId;
		this.orderQuantity = orderQuantity;
		this.priceSum = priceSum;
		this.postNo = postNo;
		this.address = address;
		this.addressDetail = addressDetail;
	}
	
	public String getMemberOrderNo() {
		return memberOrderNo;
	}
	public void setMemberOrderNo(String memberOrderNo) {
		this.memberOrderNo = memberOrderNo;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	public int getPriceSum() {
		return priceSum;
	}
	public void setPriceSum(int priceSum) {
		this.priceSum = priceSum;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	
	@Override
	public String toString() {
		return "MemberOrderDTO [memberOrderNo=" + memberOrderNo + ", productNo=" + productNo + ", memberId=" + memberId
				+ ", orderQuantity=" + orderQuantity + ", priceSum=" + priceSum + ", postNo=" + postNo + ", address="
				+ address + ", addressDetail=" + addressDetail + "]";
	}
	
}
