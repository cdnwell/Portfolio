package com.project;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.MemberDTO;
import com.project.service.FruitKakaoService;
import com.project.service.FruitNaverService;
import com.project.service.FruitService;

@Controller
public class MainController {
	private FruitService service;
	private FruitNaverService naverService;
	private FruitKakaoService kakaoService;

	public MainController(FruitService service, FruitNaverService naverService, FruitKakaoService kakaoService) {
		this.service = service;
		this.naverService = naverService;
		this.kakaoService = kakaoService;
	}

	@RequestMapping("/")
	public String main() {

		return "main";
	}

	@RequestMapping("/kakaoLogin")
	public String kakaoLogin(String code, HttpSession session) {
		// 전달 받은 code를 사용해서 access_token 받기
		System.out.println(code);

		// session에 필수 값인 nickname이 없는 경우에만 로그인이 가능하게 한다.
		if (session.getAttribute("nickname") == null) {
			String access_token = kakaoService.getAccessToken(code);
			System.out.println("###access_Token#### : " + access_token);

			HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_token);
			String nickname = (String) userInfo.get("nickname");
			String email = (String) userInfo.get("email");

			System.out.println("###nickname#### : " + userInfo.get("nickname"));
			System.out.println("###email#### : " + userInfo.get("email"));

			session.setAttribute("nickname", nickname);
			if (email != null) {
				session.setAttribute("email", email);
			}
			session.setAttribute("kakaoToken", access_token);
		}

		return "main";
	}

	@RequestMapping("/kakaoLogout")
	public String logout(HttpSession session) throws IOException {
		if ((String) session.getAttribute("kakaoToken") == null) {
		} else {
			kakaoService.getLogout((String) session.getAttribute("kakaoToken"));
		}
		session.setAttribute("kakaoToken", null);
		session.setAttribute("nickname", null);
		session.setAttribute("email", null);
		return "main";
	}

	@RequestMapping("/naverLogin")
	public String naverLogin(String code, HttpSession session) throws UnsupportedEncodingException {
		System.out.println("naver-code : " + code);

		if(session.getAttribute("nickname") == null) {
			String access_token = naverService.getAccessToken(code);
	
			HashMap<String, Object> userInfo = naverService.getUserInfo(access_token);
			String nickname = (String) userInfo.get("nickname");
			String email = (String) userInfo.get("email");
			session.setAttribute("nickname", nickname);
			if (email != null) {
				session.setAttribute("email", email);
			}
			session.setAttribute("naverToken", access_token);
		}
		return "main";
	}
	
	@RequestMapping("/naverLogout")
	public String naverLogout(HttpSession session) {
		if(session.getAttribute("naverToken")!=null) {
			session.setAttribute("naverToken", null);
			session.setAttribute("nickname", null);
			session.setAttribute("email", null);
		}
		
		return "main";
	}
	
	@RequestMapping("/register")
	public void register(MemberDTO member,HttpServletResponse response) throws IOException {
		int result = service.insertMember(member);
		
		response.getWriter().write(String.valueOf(result));
	}

	@RequestMapping("/login")
	public void login(String id, String pass,HttpSession session,HttpServletResponse response) throws IOException {
		MemberDTO dto = null;
		dto = service.login(id,pass);
		
		if(dto != null) {
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("nickname", dto.getNick());
			session.setAttribute("localToken",dto);
			response.getWriter().write(String.valueOf(1));
		}else {
			response.getWriter().write(String.valueOf(0));
		}
	}
	
	@RequestMapping("/localLogout")
	public void localLogout(HttpSession session,HttpServletResponse response) throws IOException {
		if(session.getAttribute("localToken") != null) {
			session.setAttribute("localToken", null);
			session.setAttribute("nickname", null);
			session.setAttribute("email", null);
		}
		
		response.getWriter().write("<script>location.href='/';</script>");
	}
	
	@RequestMapping("/idChk")
	public void idChk(HttpServletResponse response,String id) throws IOException {
		int result = 0;
		System.out.println(id);
		result = service.selectId(id);
		
		response.getWriter().write(String.valueOf(result));
	}
	
	@RequestMapping("/nickChk")
	public void nickChk(HttpServletResponse response, String nick) throws IOException {
		int result = 0;
		result = service.selectNick(nick);
		
		response.getWriter().write(String.valueOf(result));
	}
	
	
	
}
