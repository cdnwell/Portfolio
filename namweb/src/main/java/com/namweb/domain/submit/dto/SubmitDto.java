package com.namweb.domain.submit.dto;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.type.Alias;
import org.json.JSONArray;
import org.json.JSONObject;

@Alias("submit")
public class SubmitDto {
	private int idx; // index 번호
	private String nick;
	private String email;
	private String name;
	private String phone;
	private String content;
	private String bookDate;
	private String conAddress;
	private double conLatitude;
	private double conLongitude;
	private JSONArray workDate;
	private ArrayList<HashMap<String, Object>> workList;

	public SubmitDto() {
		super();
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBookDate() {
		return bookDate;
	}

	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}

	public String getConAddress() {
		return conAddress;
	}

	public void setConAddress(String conAddress) {
		this.conAddress = conAddress;
	}

	public double getConLatitude() {
		return conLatitude;
	}

	public void setConLatitude(double conLatitude) {
		this.conLatitude = conLatitude;
	}

	public double getConLongitude() {
		return conLongitude;
	}

	public void setConLongitude(double conLongitude) {
		this.conLongitude = conLongitude;
	}

	public ArrayList<HashMap<String, Object>> getWorkList() {
		return workList;
	}

	public JSONArray getWorkDate() {
		return workDate;
	}

	public void setWorkDate(JSONArray workDate) {
		ArrayList<HashMap<String, Object>> workList = new ArrayList<>();

		for (int i = 0; i < workDate.length(); i++) {
			JSONObject obj = workDate.getJSONObject(i);
			HashMap<String, Object> tmpMap = new HashMap<>();

			boolean morning = obj.getBoolean("morning");
			boolean afternoon = obj.getBoolean("afternoon");
			boolean extra = obj.getBoolean("extra");

			// 모든 값이 false라면 db에 전달하지 않는다.
			if (!extra && !afternoon && !morning)
				continue;

			tmpMap.put("conDate", obj.getString("dateStr"));
			tmpMap.put("morning", morning);
			tmpMap.put("afternoon", afternoon);
			tmpMap.put("extra", extra);

			workList.add(tmpMap);
		}

		this.workDate = workDate;
		this.workList = workList;
	}

}
