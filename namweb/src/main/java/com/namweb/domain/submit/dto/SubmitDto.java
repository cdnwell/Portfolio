package com.namweb.domain.submit.dto;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.type.Alias;
import org.json.JSONArray;
import org.json.JSONObject;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Alias("submit")
@Getter
@Setter
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
	@Setter(AccessLevel.NONE)
	private JSONArray workDate;
	@Setter(AccessLevel.NONE)
	private ArrayList<HashMap<String, Object>> workList;
	
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
