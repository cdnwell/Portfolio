package com.namweb.domain.submit.dto;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.type.Alias;
import org.json.JSONArray;
import org.json.JSONObject;

@Alias("submit")
public class SubmitDTO {
	private int seq; // sequence 번호
	private String nick;
	private String email;
	private String name;
	private String phone;
	private String content;
	private String book_date;
	private String con_address;
	private double con_latitude;
	private double con_longitude;
	private JSONArray work_date;
	private ArrayList<HashMap<String, Object>> work_list;

	public SubmitDTO() {
		super();
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public String getBook_date() {
		return book_date;
	}

	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}

	public String getCon_address() {
		return con_address;
	}

	public void setCon_address(String con_address) {
		this.con_address = con_address;
	}

	public double getCon_latitude() {
		return con_latitude;
	}

	public void setCon_latitude(double con_latitude) {
		this.con_latitude = con_latitude;
	}

	public double getCon_longitude() {
		return con_longitude;
	}

	public void setCon_longitude(double con_longitude) {
		this.con_longitude = con_longitude;
	}

	public JSONArray getWork_date() {
		return work_date;
	}

	public void setWork_date(JSONArray work_date) {
		ArrayList<HashMap<String, Object>> work_list = new ArrayList<>();
		
		for (int i = 0; i < work_date.length(); i++) {
			JSONObject obj = work_date.getJSONObject(i);
			HashMap<String, Object> tmpMap = new HashMap<>();

			boolean morning = obj.getBoolean("morning");
			boolean afternoon = obj.getBoolean("afternoon");
			boolean extra = obj.getBoolean("extra");

			// 모든 값이 false라면 db에 전달하지 않는다.
			if (!extra && !afternoon && !morning)
				continue;

			tmpMap.put("con_date", obj.getString("date_str"));
			tmpMap.put("morning", morning);
			tmpMap.put("afternoon", afternoon);
			tmpMap.put("extra", extra);

			work_list.add(tmpMap);
		}

		this.work_date = work_date;
		this.work_list = work_list;
	}

	public ArrayList<HashMap<String, Object>> getWork_list() {
		return work_list;
	}

	@Override
	public String toString() {
		return "SubmitDTO [nick=" + nick + ", email=" + email + ", name=" + name + ", phone=" + phone + ", content="
				+ content + ", book_date=" + book_date + ", con_address=" + con_address + ", con_latitude="
				+ con_latitude + ", con_longitude=" + con_longitude + ", work_date=" + work_date + ", work_list="
				+ work_list + "]";
	}

}
