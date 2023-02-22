package com.namweb.domain.submit.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.submit.dto.SubmitDTO;
import com.namweb.domain.submit.service.SubmitService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class SubmitController {
	private final SubmitService submitService;

	@PostMapping("/submit")
	public String submit(@RequestBody String json) throws JSONException {
		System.out.println(json);
		JSONObject jObject = new JSONObject(json);
		String name = jObject.getString("name");
		String phone = jObject.getString("phone");
		String content = jObject.getString("content");
		String address = jObject.getString("address");
		double latitude = jObject.getDouble("latitude");
		double longitude = jObject.getDouble("longitude");
		String book_date = jObject.getString("book_date");
		JSONArray work_date = jObject.getJSONArray("work_date");
		
		ArrayList<HashMap<String, Object>> work_list = new ArrayList<>();
		for (int i = 0; i < work_date.length(); i++) {
			JSONObject obj = work_date.getJSONObject(i);
			HashMap<String, Object> tmpMap = new HashMap<>();

			boolean morning = obj.getBoolean("morning");
			boolean afternoon = obj.getBoolean("afternoon");
			boolean extra = obj.getBoolean("extra");
			
			// 모든 값이 false라면 db에 전달하지 않는다.
			if(!extra && !afternoon && !morning) continue;
			
			tmpMap.put("date_str", obj.getString("date_str"));
			tmpMap.put("morning", morning);
			tmpMap.put("afternoon", afternoon);
			tmpMap.put("extra", extra);

			work_list.add(tmpMap);
		}
		
		SubmitDTO submitDTO = new SubmitDTO();
		submitDTO.setName(name);
		submitDTO.setPhone(phone);
		submitDTO.setContent(content);
		submitDTO.setAddress(address);
		submitDTO.setLatitude(latitude);
		submitDTO.setLongitude(longitude);
		submitDTO.setBook_date(book_date);

		System.out.println("name : " + name);
		System.out.println("phone : " + phone);
		System.out.println("content : " + content);
		System.out.println("latitude : " + latitude);
		System.out.println("longitude : " + longitude);
		System.out.println("address : " + address);

		int idx = 0;
		for (HashMap<String, Object> map : work_list) {
			System.out.println(++idx + "번 work_list");
			System.out.println("date_str : " + map.get("date_str"));
			System.out.println("morning: " + map.get("morning"));
			System.out.println("afternoon : " + map.get("afternoon"));
			System.out.println("extra : " + map.get("extra"));
		}
		
		int result = 0;
		result = submitService.insertBookData(submitDTO, work_list);
		
		if(result != 0) {
			return "Submit, complete";
		} else {
			return "Submit, fail";
		}
		
	}
	
}
