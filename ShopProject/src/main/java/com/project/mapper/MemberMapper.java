package com.project.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.AdminDTO;
import com.project.dto.CartDTO;
import com.project.dto.ManagerDTO;
import com.project.dto.MemberDTO;
import com.project.dto.MemberOrderDTO;
import com.project.dto.ProductDTO;

@Mapper
public interface MemberMapper {
	
	MemberDTO login(Map<String, Object> membermap);
	String managerLogin(Map<String, Object> map);
	int insertManager(Map<String, Object> map);
	int insertMember(MemberDTO dto);
	int updateMember(MemberDTO memberDto);
	MemberDTO selectLoginMember(String id);
	List<ProductDTO> selectAllProduct(String memberId);
	List<MemberDTO> selectAllMember();
	int selectMemberCount();
	List<MemberDTO> selectMemberList(int pageNo);
	List<MemberDTO> selectSearchMember(Map<String, Object> map);
	int selectMemberOrderCount();
	List<MemberDTO> selectMemberOrderList(int pageNo);
	List<MemberDTO> selectSearchMemberOrder(Map<String, Object> map);
	List<HashMap<String, Object>> selectLoginMemberOrderList(Map<String, Object> map);
	List<MemberDTO> selectSearchMemberProduct(Map<String, Object> map);
	int selectSearchMemberCount(Map<String, Object> map);
	int selectSearchMemberOrderCount(Map<String, Object> map);
	List<MemberDTO> selectMemberListExcel();
	List<MemberDTO> selectSearchMemberExcel(Map<String, Object> map);
	List<MemberOrderDTO> selectMemberOrderListExcel();
	List<MemberOrderDTO> selectSearchMemberOrderExcel(Map<String, Object> map);
	List<CartDTO> selectCartList(String id);
	int insertKakaoLoginInfo(Map<String, Object> map);
	String selectId(String memberId);
	int insertNaverLoginInfo(Map<String, Object> map);
	MemberDTO selectMemberInfo(String memberId);
	List<CartDTO> selectShoppingCartList(String memberId);
}
