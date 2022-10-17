package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.AdminDTO;
import com.project.dto.CartDTO;
import com.project.dto.ManagerDTO;
import com.project.dto.MemberDTO;
import com.project.dto.MemberOrderDTO;
import com.project.dto.ProductDTO;
import com.project.mapper.MemberMapper;

@Service
public class MemberService {
	private MemberMapper memberMapper;

	public MemberService(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}
	
	/*
	 * 회원 로그인 
	 */
	public MemberDTO login(String id , String passwd) {
		Map<String,Object> membermap = new HashMap <String , Object>();
		membermap.put("id",id);
		membermap.put("passwd",passwd);
		return memberMapper.login(membermap);
	}

	/*
	 * 회원 정보 수정
	 */
	public int updateMember(MemberDTO memberDto) {
		return memberMapper.updateMember(memberDto);
	}
	
	/*
	 * 회원 등록
	 */
	public int insertMember(MemberDTO dto) {
		return memberMapper.insertMember(dto);
	}

	/*
	 * 관리자 로그인
	 */
	public String managerLogin(String managerId, String pw) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("managerId", managerId);
		map.put("pw", pw);
		return memberMapper.managerLogin(map);
	}

	/*
	 * 관리자 추가
	 */
	public int insertManager(String managerId, String pw) {
		int result = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("managerNo", managerId);
		map.put("managerName", pw);
		
		try {
			result = memberMapper.insertManager(map);
		} catch (Exception e) {
			//기본키 위반 시 Exception 발생
			System.out.println("관리자 등록에 실패하였습니다.");
		}
		
		return result;
	}

	/*
	 * 등록된 모든 회원 정보 조회
	 */
	public List<MemberDTO> selectAllMember() {
		return memberMapper.selectAllMember();
	}

	/*
	 * 로그인한 사용자 정보 조회
	 */
	public MemberDTO selectLoginMember(String id) {
		return memberMapper.selectLoginMember(id);
	}

	public List<ProductDTO> selectAllProduct(String memberId) {
		return memberMapper.selectAllProduct(memberId);
	}

	public int selectMemberCount() {
		return memberMapper.selectMemberCount();
	}

	public List<MemberDTO> selectMemberList(int pageNo) {
		return memberMapper.selectMemberList(pageNo);
	}

	public List<MemberDTO> selectSearchMember(String search, String type, int pageNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("search", search);
		map.put("type", type);
		map.put("pageNo",pageNo);
		return memberMapper.selectSearchMember(map);
	}

	/*
	 * 전체 주문 갯수 조회
	 */
	public int selectMemberOrderCount() {
		return memberMapper.selectMemberOrderCount();
	}

	/*
	 * 전체 주문 정보 조회
	 */
	public List<MemberDTO> selectMemberOrderList(int pageNo) {
		return memberMapper.selectMemberOrderList(pageNo);
	}

	public List<MemberDTO> selectSearchMemberOrder(int pageNo, String search, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search",search);
		map.put("type", type);
		map.put("pageNo", pageNo);
		return memberMapper.selectSearchMemberOrder(map);
	}

	public List<HashMap<String, Object>> selectLoginMemberOrderList(int pageNo, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("memberId", id);
		return memberMapper.selectLoginMemberOrderList(map);
	}

	public List<MemberDTO> selectSearchMemberProduct(String search, String type, int pageNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search",search);
		map.put("type", type);
		map.put("pageNo", pageNo);
		return memberMapper.selectSearchMemberProduct(map);
	}

	public int selectSearchMemberCount(String search, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("type", type);
		return memberMapper.selectSearchMemberCount(map);
	}

	public int selectSearchMemberOrderCount(String search, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("type", type);
		return memberMapper.selectSearchMemberOrderCount(map);
	}

	public List<MemberDTO> selectMemberListExcel() {
		return memberMapper.selectMemberListExcel();
	}

	public List<MemberDTO> selectSearchMemberExcel(String search, String type) {
		Map <String, Object> map = new HashMap<>();
		
		map.put("search", search);
		map.put("type", type);
		
		return memberMapper.selectSearchMemberExcel(map);
	}

	public List<MemberOrderDTO> selectMemberOrderListExcel() {
		return memberMapper.selectMemberOrderListExcel();
	}

	public List<MemberOrderDTO> selectSearchMemberOrderExcel(String search, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search",search);
		map.put("type", type);
		
		return memberMapper.selectSearchMemberOrderExcel(map);
	}

	public List<CartDTO> selectCartList(String id) {
		return memberMapper.selectCartList(id);
	}

	public int insertKakaoLoginInfo(String nickname, String email) {
		Map<String, Object> map = new HashMap<>();
		int result = 0;
		map.put("memberId", email);
		map.put("memberName", nickname);
		try {
			result = memberMapper.insertKakaoLoginInfo(map);
			return result;
		} catch(Exception e) {
			result = 0;
			return result;
		}
	}
	
	/*
	 * 아이디 중복 확인
	 */
	public String selectId(String memberId) {
		return memberMapper.selectId(memberId);
	}

	public int insertNaverLoginInfo(String nickname, String email) {
		Map<String, Object> map = new HashMap<>();
		int result = 0;
		map.put("memberId", email);
		map.put("memberName", nickname);
		try {
			result = memberMapper.insertNaverLoginInfo(map);
			return result;
		} catch(Exception e) {
			result = 0;
			return result;
		}
	}
	public MemberDTO selectMemberInfo(String memberId) {
		return memberMapper.selectMemberInfo(memberId);
	}

	public List<CartDTO> selectShoppingCartList(String memberId) {
		return memberMapper.selectShoppingCartList(memberId);
	}

	

	
}
