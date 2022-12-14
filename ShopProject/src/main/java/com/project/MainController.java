package com.project;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.app.MemberExcel;
import com.project.dto.CartDTO;
import com.project.dto.CategoryDTO;
import com.project.dto.ColorDTO;
import com.project.dto.FileDTO;
import com.project.dto.FileImageDTO;
import com.project.dto.FileUploadDTO;
import com.project.dto.MemberDTO;
import com.project.dto.MemberOrderDTO;
import com.project.dto.NoticeDTO;
import com.project.dto.NoticeMainDTO;
import com.project.dto.NoticeReplyDTO;
import com.project.dto.ProductDTO;
import com.project.dto.QnADTO;
import com.project.dto.QnareplyDTO;
import com.project.dto.SizesDTO;
import com.project.service.BoardService;
import com.project.service.KakaoService;
import com.project.service.MemberService;
import com.project.service.NaverService;
import com.project.service.ProductService;
import com.project.service.QnaService;
import com.project.vo.PagingVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MainController {
	private final MemberService memberService;
	private final ProductService productService;
	private final KakaoService kakaoService;
	private final BoardService boardService;
	private final QnaService qnaService;
	private final NaverService naverService;

	// ------------------------- ?????????, ?????????, ????????? ---------------------------//

	/*
	 * ?????? ????????? ??????
	 */
	@RequestMapping("/")
	public String main(Model model, HttpSession session) {
		List<ProductDTO> productpreview = productService.selectProductList();
		model.addAttribute("productpreview", productpreview);

		return "index";
	}

	/*
	 * index.do ?????? ????????? ??????
	 */
	@RequestMapping("/index.do")
	public String index(Model model, HttpSession session) {
		List<ProductDTO> productpreview = productService.selectProductList();
		model.addAttribute("productpreview", productpreview);

		return "index";
	}

	/*
	 * ?????? ?????? ????????????(?????? ???????????? ??????)
	 */
	@RequestMapping("/category_simple_view.do")
	public String categorySimpleView(Model model, HttpSession session, String categoryno,
			@RequestParam(name = "pageNo", defaultValue = "1") String pageNo) {
		List<ProductDTO> productlist = productService.selectProductSimpleList(categoryno); /* ??????????????? ????????? ?????? ?????? */
		model.addAttribute("productlist", productlist);

		int count = productService.selectProductSimpleCount(categoryno);
		PagingVO vo = new PagingVO(count, Integer.parseInt(pageNo), 12, 5);
		model.addAttribute("paging", vo);
		
		return "shop-fullwidth";
	}
	
	/*
	 * ?????? ?????? ????????????(?????? ???????????? ??????)
	 */
	@RequestMapping("/category_detail_view.do")
	public String categoryDetailView(Model model, HttpSession session, String categoryno,
			@RequestParam(name = "pageNo", defaultValue = "1") String pageNo) {
		List<ProductDTO> productlist = productService.selectProductDetailList(categoryno); /* ??????????????? ????????? ?????? ?????? */
		model.addAttribute("productlist", productlist);
		
		int count = productService.selectProductSimpleCount(categoryno);
		PagingVO vo = new PagingVO(count, Integer.parseInt(pageNo), 12, 5);
		model.addAttribute("paging", vo);

		return "shop-fullwidth";
	}

	// ------------------------- ?????????, ?????????, ????????? ---------------------------//

	// ------------------------------- ????????? ---------------------------------//

	@RequestMapping("/shop-fullwidth.do")
	public String shopfullwidthnew(Model model, HttpSession session, String productno, ProductDTO productdto) {

		List<ProductDTO> shopNewProductList = productService.shopNewProductList(productno);
		model.addAttribute("shopNewProductList", shopNewProductList);
		return "shop-fullwidth-new";
	}

	@RequestMapping("/shop-fullwidth-best.do")
	public String shopfullwidthbest(Model model, HttpSession session, String productno, ProductDTO productdto,
			@RequestParam(name = "pageNo", defaultValue = "1") String pageNo) {
		List<ProductDTO> shopBestProductList = productService.shopBestProductList(productno);
		model.addAttribute("shopBestProductList", shopBestProductList);
		return "shop-fullwidth-best";
	}

	// ------------------------------- ????????? ---------------------------------//

	// ------------------------------- ????????? ---------------------------------//

	/*
	 * ????????? ????????? ??????
	 */
	@RequestMapping("/login-page.do")
	public String login_page(Model model, HttpSession session) {

		return "login";
	}

	/*
	 * ???????????? ?????? ??????
	 */
	@RequestMapping("/member-update.do")
	public void updateMember(MemberDTO memberDto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");

		int result = 0;

		result = memberService.updateMember(memberDto);
		response.getWriter().write("<script>alert('?????? ?????? ?????? ??????.');location.href='/';</script>");
	}

	/*
	 * ????????? ??????
	 */
	@RequestMapping("login.do")
	public void login(String id, String passwd, HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		MemberDTO dto = memberService.login(id, passwd);

		if (dto != null) {
			session.setAttribute("login", true);
			session.setAttribute("id", dto.getMemberId());
			session.setAttribute("name", dto.getMemberName());
			System.out.println("????????? ??????");
			response.getWriter().write("<script>location.href='/';</script>");
		} else {
			session.setAttribute("login", false);
			System.out.println("????????? ??????");
			response.getWriter().write("<script>alert('????????? ?????? ??????????????? ???????????????.');history.back();</script>");
		}
	}

	/*
	 * ???????????? ??????
	 */
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}

	/*
	 * ?????? ?????? ????????? ??????
	 */
	@RequestMapping("/register-page.do")
	public String register(Model model) {
		return "register";
	}

	/*
	 * ???????????? ??????
	 */
	@RequestMapping("/register.do")
	public void insertMember(MemberDTO dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		int result = 0;
		result = memberService.insertMember(dto);
		
		if(result == 1)
			response.getWriter().write("<script>alert('???????????? ?????????????????????.');location.href='/';</script>");
		else
			response.getWriter().write("<script>alert('??????????????? ?????????????????????.');history.back();");
	}

	/*
	 * ????????? ?????? ?????? ??????
	 */
	@RequestMapping("/idCheck.do")
	public void idCheck(HttpServletResponse response, String memberId) throws IOException {
		//id??? ??? ???????????? ?????? 2??? ????????????.
		if(memberId.equals("")) { 
			response.getWriter().write("2");
			return;
		}
		
		String id_cmp = memberService.selectId(memberId);
		
		if (memberId.equals(id_cmp)) {
			response.getWriter().write("0");
		} else {
			response.getWriter().write("1");
		}
	}

	/*
	 * qna ????????? ??????!
	 */
	@RequestMapping("/qna_page.do")
	public String qna_page() {
		return "qna";
	}

	/*
	 * ?????? ????????? ??????
	 */
	@RequestMapping("/qnalist.do")
	public String qna_page(Model model) {
		return "qnalist";
	}

	/*
	 * ????????? ??????
	 */
	@RequestMapping("/boardWrite.do")
	public String boardWrite(QnADTO qnadto, MultipartHttpServletRequest request) throws UnsupportedEncodingException {
		int qno = qnaService.insertBoard(qnadto);

		String root = "c:\\fileUpload\\";
		File userRoot = new File(root);
		if (!userRoot.exists())
			userRoot.mkdirs();

		List<MultipartFile> fileList = request.getFiles("file");
		int i = 1;
		for (MultipartFile f : fileList) {
			String originalFileName = f.getOriginalFilename();
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
			String date = sdf.format(Calendar.getInstance().getTime());
			String filename = date + "_fl" + originalFileName;
			
			if (f.getSize() == 0)
				continue;
			
			File uploadFile = new File(root + "\\" + filename);
			qnaService.insertFileList(new FileImageDTO(uploadFile, qno, i));
			i++;
			try {
				// ????????? ??????
				f.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return "redirect:/Allqnalist.do";
	}

	/*
	 * qna ??????
	 */
	@RequestMapping("/Allqnalist.do")
	public String Allqnalist(HttpSession session, QnADTO qnadto, Model model) {

		List<QnADTO> qnalist = qnaService.Allqnalist();
		model.addAttribute("list", qnalist);

		return "qnalist";
	}

	/*
	 * qan ?????? ??????
	 */
	@RequestMapping("/qnaview_page.do")
	public String boardView(int qno, Model model, HttpSession session) {

		QnADTO dto = qnaService.serqnaview(String.valueOf(qno));
		List<QnareplyDTO> qnacomment = qnaService.selectqnarepiyDTO(qno);
		model.addAttribute("qna", dto);
		model.addAttribute("qnacomment", qnacomment);
		return "qnaview";
	}

	/*
	 * ?????? ??????
	 */
	@RequestMapping("qnareply.do")
	public String qnareply(Model model, HttpSession session, QnareplyDTO qnareplydto) {

		qnaService.insertqnaDTO(qnareplydto);
		return "redirect:/qnaview_page.do?qno=" + qnareplydto.getQno();
	}

	/*
	 * ?????? ??????
	 */
	@RequestMapping("/insertComment.do")
	public void insertComment(String qno, String writer, String qnarecontent, HttpServletResponse response) {
		QnareplyDTO dto = new QnareplyDTO(qno, qnarecontent, writer);
		int result = qnaService.insertqnaComment(dto);
		try {
			response.getWriter().write(String.valueOf(result));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// ------------------------------- ????????? ---------------------------------//

	// ------------------------------- ????????? ---------------------------------//

	/*
	 * ???????????? ?????? ????????? ??????
	 */
	@RequestMapping("/about-page.do")
	public String about_page(Model model, HttpSession session) {

		return "about";
	}
	
	/*
	 * ?????? ????????? ???????????? ????????????
	 */
	@RequestMapping("/category-list.do")
	public ResponseEntity<List<CategoryDTO>> categoryList() {
		List<CategoryDTO> categoryList = boardService.selectCategoryList();

		return ResponseEntity.ok(categoryList);
	}
	
	/*
	 * ?????? ?????? ???????????? ?????? ????????? ?????? ????????????
	 */
	@RequestMapping("/category-all-list.do")
	public ResponseEntity<List<CategoryDTO>> categoryAllList(){
		List<CategoryDTO> categoryList = boardService.selectCategoryAllList();
		
		return ResponseEntity.ok(categoryList);
	}

	/*
	 * ???????????? ?????? ?????? ??????
	 */
	@RequestMapping("/cart_list.do")
	public void selectCartList(HttpServletResponse response, HttpSession session) throws IOException {
		response.setCharacterEncoding("UTF-8");
		JSONObject json = new JSONObject();
		String id = (String) session.getAttribute("id");
		List<CartDTO> list = null;

		try {
			if (id != null) {
				list = memberService.selectCartList(id);
			}
			JSONArray arr = new JSONArray(list);
			json.put("list", arr);

		} catch (Exception e) {
			json.put("message", "????????? ?????? ????????? ????????????.");
		}

		response.getWriter().write(json.toString());
	}

	/*
	 * ?????? ????????? ??????
	 */
	@RequestMapping("/cart_delete.do")
	public void deleteCartList(String cartno, HttpServletResponse response, HttpSession session) throws IOException {

		int result = 0;
		result = boardService.deleteCartList(cartno);

		if (result == 0) {
			response.getWriter().write("0");
		} else {
			response.getWriter().write("1");
		}

	}

	/*
	 * ???????????? ????????? ??????
	 */
	@RequestMapping("/notice.do")
	public String selectNoticeContent(Model model, HttpSession session,
			@RequestParam(name = "pageNo", defaultValue = "1") int pageNo) {
		int pageNoLimit = (pageNo-1)*5;
		List<NoticeMainDTO> list = boardService.selectNoticeContent(pageNoLimit);
		List<NoticeReplyDTO> reDto3 = boardService.selectNoticeRecent3Reply();
		List<NoticeDTO> reNotice3 = boardService.selectNoticeRecent3();

		model.addAttribute("list", list);
		model.addAttribute("recent3re", reDto3);
		model.addAttribute("recent3no", reNotice3);

		int count = boardService.selectNoticeCount();
		PagingVO vo = new PagingVO(count, pageNo, 5, 5);
		model.addAttribute("paging", vo);

		return "notice";
	}

	/*
	 * ???????????? ??? ????????? ??????
	 */
	@RequestMapping("/notice_detail.do")
	public String selectNoticeDetail(Model model, String noticeno, HttpSession session) {
		if (noticeno == null)
			noticeno = (String) session.getAttribute("noticeno");

		NoticeDTO dto = boardService.selectNoticeDetail(noticeno);
		List<FileUploadDTO> flist = boardService.selectFileList(noticeno);
		List<NoticeReplyDTO> reDto = boardService.selectNoticeReply(noticeno);
		List<NoticeReplyDTO> reDto3 = boardService.selectNoticeRecent3Reply();
		List<NoticeDTO> reNotice3 = boardService.selectNoticeRecent3();

		model.addAttribute("notice", dto);
		model.addAttribute("flist", flist);
		model.addAttribute("noticeRe", reDto);
		model.addAttribute("recent3re", reDto3);
		model.addAttribute("recent3no", reNotice3);
		session.setAttribute("noticeno", noticeno);

		return "notice_details";
	}

	/*
	 * ???????????? ?????? ????????????
	 */
	@RequestMapping("/noFileDown.do")
	public void noFileDown(int fno, String noticeno, HttpServletResponse response) throws IOException {
		String path = boardService.selectNoFile(noticeno, fno);
		File file = new File(path);
		response.setHeader("Content-Disposition", "attachement;fileName=" + file.getName());
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentLength((int) file.length());

		FileInputStream fis = new FileInputStream(file);
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buffer = new byte[1024 * 1024];
		while (true) {
			int size = fis.read(buffer);
			if (size == -1)
				break;
			bos.write(buffer, 0, size);
			bos.flush();
		}
		bos.close();
		fis.close();
	}

	/*
	 * ???????????? ??? ???????????? ??? ??? ??????
	 */
	@RequestMapping("/notice_updateView.do")
	public String selectNoticeView(Model model, String noticeno, HttpSession session) {
		NoticeDTO dto = boardService.selectNoticeDetail(noticeno);

		model.addAttribute("notice", dto);
		session.setAttribute("noticeno", noticeno);

		return "manager_notice_write_update";
	}

	/*
	 * ???????????? ??? ?????? ??????
	 */
	@RequestMapping("/noticeDelete.do")
	public String deleteNoticeContent(Model model, HttpSession session, String noticeno) {

		String memberId = (String) session.getAttribute("id");
		// ????????? ?????? ??????
		// ?????? ????????? ??????(?????????) ????????????
		List<Integer> list = boardService.selectAllImgNo(noticeno);

		// db?????? ????????? ?????? ?????? ?????? ????????? ?????? ????????? ????????????
		ArrayList<String> fileList = new ArrayList<>();

		for (int i : list) {
			String fileLoc = boardService.selectNotUploadFileLoc(i);
			fileList.add(fileLoc);
		}

		// db?????? ????????? ??????????????? ?????? ??????
		if (!fileList.isEmpty()) {
			for (String s : fileList) {
				File file = new File(s);
				file.delete();
			}
		}

		// db - ????????? ?????? ??????
		boardService.deleteNoticeImgLoc(noticeno);

		// db - ?????? ??????
		int result = 0;
		result = boardService.deleteNoticeContent(noticeno);

		return "redirect:/notice.do";
	}

	/*
	 * ???????????? ??? ????????????
	 */
	@RequestMapping("/managerBoardUpdate.do")
	public String updateNoticeContent(Model model, HttpSession session, NoticeDTO notice,
			MultipartHttpServletRequest request) {
		String memberId = (String) session.getAttribute("id");

		int result = 0;
		String noticeno = notice.getNoticeno();
		result = boardService.updateNoticeContent(notice);

		// ????????? ??????
		String root = "c:\\fileUpload\\";
		File userRoot = new File(root);
		if (!userRoot.exists())
			userRoot.mkdirs();

		List<MultipartFile> fileList = request.getFiles("file");
		int i = 1;
		for (MultipartFile f : fileList) {
			String originalFileName = f.getOriginalFilename();
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
			String date = sdf.format(Calendar.getInstance().getTime());
			String filename = date + "_fl" + originalFileName;

			if (f.getSize() == 0)
				continue;
			File uploadFile = new File(root + "\\" + filename);
			boardService.insertNoticeFileList(new FileDTO(uploadFile, noticeno, i));
			i++;
			// ?????? ???????????? ??????
			try {
				f.transferTo(uploadFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

		}

		return "redirect:/managerImageSort.do?noticeno=" + noticeno;
	}

	/*
	 * ?????? ????????? ?????? ??? ???????????? ??????
	 */
	@RequestMapping("/my-account-access.do")
	public String my_account_access() {
		return "my_account_access";
	}
	
	/*
	 * ?????? ????????? ?????? ?????? ???????????? ??????
	 */
	@RequestMapping("/my_account_check.do")
	public String my_account_check(HttpSession session,Model model, String passwd) {
		String id = (String)session.getAttribute("id");
		
		try {
			MemberDTO member = memberService.login(id, passwd);
			
			if(member != null) {
				return "redirect:/my-account.do";
			}
		} catch(Exception e) {
		}
		
		model.addAttribute("login_fail",true);
		return "my_account_access";
	}
	
	/*
	 * ?????? ????????? ??????
	 */
	@RequestMapping("/my-account.do")
	public String my_account_page(Model model, HttpSession session) {
		return "my_account";
	}
	
	/*
	 * ?????? ????????? ????????? ???????????? ?????? ??????
	 */
	@RequestMapping("/my-account-info.do")
	public void selectLoginMember(HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html;charset=utf-8;");
		String id = (String) session.getAttribute("id");
		JSONObject obj = null;

		MemberDTO dto = memberService.selectLoginMember(id);

		obj = new JSONObject(dto);

		response.getWriter().write(obj.toString());
	}

	/*
	 * ????????? ??? ????????? ??????
	 */
	@RequestMapping("/contact.do")
	public String contact_page() {
		return "contact";
	}

	/*
	 * ????????? ????????? ??????
	 */
	@RequestMapping("/manager.do")
	public String manager_page(Model model) {
		return "manager";
	}

	/*
	 * ????????? ????????? ??????
	 */
	@RequestMapping("/manager-login.do")
	public String manager_login(String managerId, String pw, HttpSession session) {
		String id = memberService.managerLogin(managerId, pw);

		if (id != null) {
			session.setAttribute("mLogin", true);
			session.setAttribute("managerId", id);
			return "redirect:/member-list.do";
		} else {
			session.setAttribute("mLogin", false);
			return "redirect:/manager.do";
		}

	}

	/*
	 * ????????? ????????????
	 */
	@RequestMapping("/manager-logout.do")
	public String manager_logout(HttpSession session) {
		session.invalidate();

		return "redirect:/manager.do";
	}

	/*
	 * ????????? ????????? - ???????????? ????????? ????????? ??????
	 */
	@RequestMapping("/manager_notice_write.do")
	public String manager_notice_write(HttpSession session) {
		String noticeno = boardService.selectNoticeNo();

		session.setAttribute("noticeno", noticeno);

		return "manager_notice_write";
	}

	/*
	 * ????????? ????????? - ???????????? ?????????
	 */
	@RequestMapping("/managerBoardWrite.do")
	public String boardWrite(NoticeDTO dto, MultipartHttpServletRequest request, HttpSession session) {
		String noticeno = (String) session.getAttribute("noticeno");

		boardService.insertNoticeBoard(dto, noticeno);

		// ?????? ?????????
		// ????????? ??????
		String root = "c:\\fileUpload\\";
		File userRoot = new File(root);
		if (!userRoot.exists())
			userRoot.mkdirs();

		List<MultipartFile> fileList = request.getFiles("file");
		int i = 1;
		for (MultipartFile f : fileList) {
			String originalFileName = f.getOriginalFilename();
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
			String date = sdf.format(Calendar.getInstance().getTime());
			String filename = date + "_fl" + originalFileName;
			
			if (f.getSize() == 0)
				continue;
			File uploadFile = new File(root + "\\" + filename);
			boardService.insertNoticeFileList(new FileDTO(uploadFile, noticeno, i));
			i++;
			// ?????? ???????????? ??????
			try {
				f.transferTo(uploadFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

		}

		return "redirect:/managerImageSort.do?noticeno=" + noticeno;
	}

	/*
	 * ????????? - ???????????? ????????? ?????? ?????? ????????? ?????? ??????, ??????
	 */
	@RequestMapping("/managerImageSort.do")
	public String sortManagerImage(String noticeno) {
		NoticeDTO dto = boardService.selectNoticeDetail(noticeno);

		String imgSrc = "<img src=\"imageDown.do?photono=";
		String content = dto.getContent();
		int index = 0;
		ArrayList<String> imgTag = new ArrayList<>();

		// ??? ???????????? <img src...> ?????? ????????? arraylist??? ????????????
		while (true) {
			int indexNo = content.indexOf(imgSrc, index);
			if (indexNo == -1)
				break;
			int indexNoLast = content.indexOf(">", indexNo);

			String subStr = content.substring(indexNo, indexNoLast + 1);
			index = indexNoLast;

			imgTag.add(subStr);
		}

		int[] imgNo = new int[imgTag.size()];

		int indexInt = 0;
		// ??????????????? ??? ????????? ????????? ???????????? ????????? ??????
		for (String s : imgTag) {
			s = s.replaceAll("[^\\d]", "");
			imgNo[indexInt++] = Integer.parseInt(s);
		}

		// ?????? ????????? ??????(?????????) ????????????
		List<Integer> list = boardService.selectAllImgNo(noticeno);

		// remove ????????? Object ?????? ???????????? ?????? Integer?????? ????????? ?????????.
		// list?????? db??? ????????? ?????? ??????(?????????)?????? ????????? ?????? ?????? ??????(??? ?????? ?????????
		// ????????? ????????? ???????????? ??????)
		for (Integer i : imgNo) {
			list.remove(i);
		}

		// db?????? ????????? ?????? ?????? ?????? ????????? ?????? ????????? ????????????
		ArrayList<String> fileList = new ArrayList<>();

		for (int i : list) {
			String fileLoc = boardService.selectNotUploadFileLoc(i);
			fileList.add(fileLoc);
		}

		// db?????? ????????? ??????????????? ?????? ??????
		if (!fileList.isEmpty()) {
			for (String s : fileList) {
				File file = new File(s);
				file.delete();
			}
		}

		// db?????? ???????????? ?????? ?????? ??????
		if (!list.isEmpty()) {
			for (int i : list) {
				boardService.deleteNotUploadImg(i);
			}
		}

		// db?????? ?????? ??????
		return "redirect:/notice_detail.do?noticeno=" + noticeno;
	}

	/*
	 * ????????? ????????? - ???????????? ????????? ?????? ?????????
	 */
	@RequestMapping("/fileUpload.do")
	public void fileUpload(@RequestParam(value = "upload") MultipartFile fileload, HttpServletResponse response,
			HttpSession session) {
		// ????????? ????????? ????????? ????????? ???????????? ??????????????? ??????
		// DB??? ????????? ????????? ?????? ???????????? ???????????? ?????? ??????
		// filename ??????
		String noticeno = (String) session.getAttribute("noticeno");
		String originFileName = fileload.getOriginalFilename();
		
		// upload ?????? ??????(????????????)
		 String root = "c:\\fileUpload\\notice";
//		String root = session.getServletContext().getRealPath("/") + "img\\notice\\";

		File rootFile = new File(root);
		if (!rootFile.exists()) {
			rootFile.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss");
		String date = sdf.format(Calendar.getInstance().getTime());

		String fileName = date + "_" + session.getAttribute("managerId")
				+ originFileName.substring(originFileName.indexOf("."));
		File file = new File(root + "\\" + fileName);

		String photono = boardService.uploadImage(file.getAbsolutePath(), noticeno);
//		String photono = boardService.uploadImage("img/notice/"+fileName, noticeno);
		try {
			PrintWriter pw = response.getWriter();
			fileload.transferTo(file);
			JSONObject obj = new JSONObject();
			obj.put("uploaded", true);
			obj.put("url", "imageDown.do?photono=" + photono);
			pw.write(obj.toString());
		} catch (IOException e) {
			JSONObject obj = new JSONObject();
			obj.put("uploaded", false);
			JSONObject msg = new JSONObject();
			msg.put("message", "?????? ????????? ??? ?????? ??????");
			obj.put("error", msg);
		}
	}

	/*
	 * ????????? ????????? - ???????????? ????????? ????????? ?????????
	 */
	@RequestMapping("/imageDown.do")
	public void imageLoad(String photono, HttpServletResponse response) {

		String path = boardService.selectImageFile(photono);

		File file = new File(path);

		response.setHeader("Content-Disposition", "attachment;fileName=" + file.getName());
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentLength((int) file.length());

		try {
			FileInputStream fis = new FileInputStream(file);

			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buffer = new byte[1024 * 1024];

			while (true) {
				int size = fis.read(buffer);
				if (size == -1)
					break;
				bos.write(buffer, 0, size);
				bos.flush();
			}
			fis.close();
			bos.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	/*
	 * ?????? ????????? ????????????
	 */
	@RequestMapping("/prImageDown.do")
	public void prImageDown(String productno, HttpServletResponse response) {
		String path = boardService.selectPrImageFile(productno);

		File file = new File(path);

		response.setHeader("Content-Disposition", "attachment;fileName=" + file.getName());
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentLength((int) file.length());

		try {
			FileInputStream fis = new FileInputStream(file);

			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buffer = new byte[1024 * 1024];

			while (true) {
				int size = fis.read(buffer);
				if (size == -1)
					break;
				bos.write(buffer, 0, size);
				bos.flush();
			}
			fis.close();
			bos.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/*
	 * ???????????? ?????? ??????
	 */
	@RequestMapping("/insertNoticeReply.do")
	public String insertNoticeReply(NoticeReplyDTO dto, HttpSession session) {
		String noticeno = (String) session.getAttribute("noticeno");

		int result = 0;
		dto.setNoticeno(noticeno);
		result = boardService.insertNoticeReply(dto);

		return "redirect:/notice_detail.do?noticeno=" + noticeno;
	}

	/*
	 * ???????????? ????????? ??????
	 */
	@RequestMapping("/insertNoticeReplyRe.do")
	public void insertNoticeReplyRe(NoticeReplyDTO dto, HttpServletResponse response) throws IOException {

		int result = 0;
		result = boardService.insertNoticeReplyRe(dto);

		if (result != 0) {
			response.getWriter().write(dto.getNoticeno());
		} else {
			response.getWriter().write(String.valueOf(0));
		}
	}

	/*
	 * ???????????? ?????? ??????
	 */
	@RequestMapping("/deleteReply.do")
	public String deleteReply(String replyno) {
		int result = 0;
		result = boardService.deleteNoticeReply(replyno);

		if (result == 1) {
			return "redirect:/notice_detail.do";
		} else {
			return "redirect:/notice_detail.do";
		}
	}

	/*
	 * ???????????? ?????? ??????
	 */
	@RequestMapping("/searchNotice.do")
	public String searchNotice(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, String search,
			Model model) {
		int pageNoLimit = (pageNo-1)*15;
		List<NoticeMainDTO> list = boardService.selectNoticeSearch(pageNoLimit, search);
		List<NoticeReplyDTO> reDto3 = boardService.selectNoticeRecent3Reply();
		List<NoticeDTO> reNotice3 = boardService.selectNoticeRecent3();

		model.addAttribute("recent3re", reDto3);
		model.addAttribute("recent3no", reNotice3);
		model.addAttribute("list", list);

		int count = boardService.selectNoticeSearchCount(search);
		PagingVO vo = new PagingVO(count, pageNo, 5, 5);
		model.addAttribute("paging", vo);

		model.addAttribute("search", search);

		return "notice_search";
	}

	/*
	 * ????????? ?????? ?????? ?????? ?????? ??? ??????
	 */
	@RequestMapping("/member-list.do")
	public String selectAllMember(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, String search,
			String type, Model model) {
		List<MemberDTO> list = null;
		
		int count = 0;
		int pageNoLimit = (pageNo-1)*15;
		
		if (search == null || type == null || search.equals("") || type.equals("")) {
			list = memberService.selectMemberList(pageNoLimit);
			model.addAttribute("member", list);

			count = memberService.selectMemberCount();
		} else {
			list = memberService.selectSearchMember(search, type, pageNoLimit);
			model.addAttribute("search", search);
			model.addAttribute("type", type);
			model.addAttribute("member", list);

			count = memberService.selectSearchMemberCount(search, type);
		}

		PagingVO vo = new PagingVO(count, pageNo, 15, 5);
		model.addAttribute("paging", vo);

		return "manager_member";
	}

	/*
	 * ?????? ???????????? ?????? ??? ?????? ?????? ??????
	 */
	@RequestMapping("/manager-member-detail.do")
	public String selectMemberOrderDetail(Model model, String memberId) {
		return "forward:/member-order-list.do?type=memberId&search=" + memberId;
	}

	/*
	 * ?????? ?????? ?????? ?????? ??????
	 */
	@RequestMapping("/member-list-excel.do")
	public void createMemberExcel(Model model,HttpServletResponse response, String search, String type) throws IOException {
		response.setCharacterEncoding("euc-kr");
		MemberExcel memberExcel = new MemberExcel();
		
		List<MemberDTO> list = null;
		if (search == null || type == null || search.equals("") || type.equals("")) {
			list = memberService.selectMemberListExcel();
		} else {
			list = memberService.selectSearchMemberExcel(search, type);
		}

		memberExcel.memberExcelCreator(list);

		response.getWriter().write("<script>alert('?????? ????????? ?????? ???????????????.');location.href='member-list.do?search=" + search + "&type=" + type+"';</script>");
	}

	/*
	 * ?????? ?????? ?????? ??????
	 */
	@RequestMapping("/member-order-list.do")
	public String selectProductList(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, String search,
			String type, Model model, HttpSession session) {
		String memberId = (String) session.getAttribute("id");
		int pageNoLimit = (pageNo-1)*15;
		List<MemberDTO> list = null;
		int count = 0;

		if (search == null || type == null || search.equals("") || type.equals("")) {
			list = memberService.selectMemberOrderList(pageNoLimit);
			model.addAttribute("product", list);

			count = memberService.selectMemberOrderCount();
		} else {
			list = memberService.selectSearchMemberOrder(pageNoLimit, search, type);
			model.addAttribute("product", list);
			model.addAttribute("search", search);
			model.addAttribute("type", type);

			count = memberService.selectSearchMemberOrderCount(search, type);
		}

		PagingVO vo = new PagingVO(count, pageNo, 15, 5);
		model.addAttribute("paging", vo);

		return "manager_member_product";
	}

	/*
	 * ?????? ?????? ?????? ??????
	 */
	@RequestMapping("/member-product-search.do")
	public String selectSearchMemberProduct(String search, String type, Model model, HttpServletResponse response)
			throws IOException {
		int pageNo = 1;
		List<MemberDTO> list = memberService.selectSearchMemberProduct(search, type, pageNo);
		model.addAttribute("member", list);

		int count = memberService.selectMemberCount();
		PagingVO vo = new PagingVO(count, pageNo, 15, 5);
		model.addAttribute("paging", vo);

		return "manager_member_product";
	}

	/*
	 * ?????? ?????? ?????? ?????? ?????? ??????
	 */
	@RequestMapping("/member-ordre-list-excel.do")
	public void createMemberOrderExcel(Model model, HttpServletResponse response, String search, String type) throws IOException {
		response.setCharacterEncoding("euc-kr");
		MemberExcel memberExcel = new MemberExcel();

		List<MemberOrderDTO> list = null;
		if (search == null || type == null || search.equals("") || type.equals("")) {
			list = memberService.selectMemberOrderListExcel();
		} else {
			list = memberService.selectSearchMemberOrderExcel(search, type);
		}

		memberExcel.memberOrderExcelCreator(list);
		response.getWriter().write("<script>alert('?????? ????????? ?????? ???????????????.');location.href='member-order-list.do?search="+ search +"&type="+ type +"';</script>");
	}

	/*
	 * ????????? ????????? ??????
	 */
	@RequestMapping("/kakaoLogin.do")
	public String kakaoLogin(String code, HttpSession session) {
		// ?????? ?????? code??? ???????????? access_token ??????
		// login, id, name

		// session??? ?????? ?????? nickname??? ?????? ???????????? ???????????? ???????????? ??????.
		String access_token = kakaoService.getAccessToken(code);

		HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_token);
		String nickname = (String) userInfo.get("nickname");
		String email = (String) userInfo.get("email");

		System.out.println("????????? ?????????");
		System.out.println("nickname : " + nickname);
		System.out.println("email : " + email);
		
		session.setAttribute("login", true);
		session.setAttribute("name", nickname);
		session.setAttribute("id", email);

		session.setAttribute("kakaoToken", access_token);

//		int result = memberService.insertKakaoLoginInfo(nickname, email);
//
//		if (result == 0) {
//			System.out.println("????????? ????????? - ?????? ????????? ??????????????????.");
//		}

		return "redirect:/";
	}

	/*
	 * ????????? ?????????
	 */
	@RequestMapping("/naverLogin.do")
	public String naverLogin(String code, HttpSession session) throws UnsupportedEncodingException {

		String access_token = naverService.getAccessToken(code);

		HashMap<String, Object> userInfo = naverService.getUserInfo(access_token);
		String nickname = (String) userInfo.get("nickname");
		String email = (String) userInfo.get("email");

		session.setAttribute("login", true);
		session.setAttribute("name", nickname);
		session.setAttribute("id", email);

		session.setAttribute("naverToken", access_token);

		System.out.println("????????? ?????????");
		System.out.println("nickname : " + nickname);
		System.out.println("email : " + email);

//		int result = memberService.insertNaverLoginInfo(nickname, email);
//
//		if (result == 0) {
//			System.out.println("????????? ????????? - ?????? ????????? ??????????????????.");
//		}

		return "redirect:/";

	}

	// ------------------------------- ????????? ---------------------------------//

	// ------------------------------- ????????? ---------------------------------//

	@RequestMapping("/manager_productList.do")
	public String manegement_productList(Model model, HttpSession session) {
		List<ProductDTO> productlist = productService.selectProduct();
		model.addAttribute("productlist", productlist);
		return "manager_productList";
	}

	@RequestMapping("/deleteproduct.do")
	public String deleteproduct(Model model, String productno) {
		String[] index = productno.split(",");
		productService.deleteProduct(index);
		return "redirect:manager_productList.do";
	}

	@RequestMapping("/manager-insertproduct.do")
	public String manager_insertproduct(Model model, String productno) {
		List<ColorDTO> colorlist = productService.selectColorList();
		List<SizesDTO> sizelist = productService.selectSizeList();
		List<CategoryDTO> categoryList = boardService.selectCategoryList();
		
		model.addAttribute("colorlist", colorlist);
		model.addAttribute("sizelist", sizelist);
		model.addAttribute("categorylist", categoryList);
		return "manager_insertproduct";
	}

	@RequestMapping("/insertproduct.do")
	public String insertproduct(Model model, ProductDTO productdto,
	        int color0, int color1, int color2, int color3, int color4,
	        MultipartHttpServletRequest request) {
	    ArrayList<Integer> color = new ArrayList<>();
	    
	    if(color0 != -1)
	        color.add(color0);
	    if(color0 != -1)
	        color.add(color1);
	    if(color0 != -1)
	        color.add(color2);
	    if(color0 != -1)
	        color.add(color3);
	    if(color0 != -1)
	        color.add(color4);
	    
		String productno = productService.insertproduct(productdto);
		
		String root = "c:\\fileUpload\\";
		File userRoot = new File(root);
		if (!userRoot.exists())
			userRoot.mkdirs();

		int color_idx = 0;
		
		List<MultipartFile> fileList = request.getFiles("file");
		for (MultipartFile f : fileList) {
			String originalFileName = f.getOriginalFilename();
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
			String date = sdf.format(Calendar.getInstance().getTime());
			String imagefilename = date + "_img" + originalFileName;
			
			if (f.getSize() == 0)
				continue;
			
			File uploadFile = new File(root + "\\" + imagefilename + "");
			FileDTO file = new FileDTO(uploadFile, productno, 0, color.get(color_idx));
			
			productService.insertFileListAddColor(file);
			color_idx++;
			
			try {
				f.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:manager_productList.do";
	}

	@RequestMapping("/productView.do")
	public String manager_productView(Model model, String productno) {
		ProductDTO dto = productService.selectProductDTO(productno);
		List<FileDTO> Filelist = productService.selectFilePathAddColor(productno);
		List<SizesDTO> sizelist = productService.selectSizesSelectList(productno);
		List<ColorDTO> colorlist = productService.selectColorSelectList(productno);
		
		model.addAttribute("product", dto);
		model.addAttribute("Filepath", Filelist);
		model.addAttribute("sizelist", sizelist);
		model.addAttribute("colorlist", colorlist);
		
		return "manager_productView";
	}

	@RequestMapping("fileDown.do")
	public void fileDown(int productphotono, String productno, HttpServletResponse response) throws IOException {
		String path = productService.selectFile(productno, productphotono);
		File file = new File(path);
		response.setHeader("Content-Disposition", "attachement;fileName=" + file.getName());
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentLength((int) file.length());
		FileInputStream fis = new FileInputStream(file);
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buffer = new byte[1024 * 1024];
		while (true) {
			int size = fis.read(buffer);
			if (size == -1)
				break;
			bos.write(buffer, 0, size);
			bos.flush();
		}
		bos.close();
		fis.close();
	}
	
	/*
	 * ?????? ?????? ????????? - ?????? ????????????
	 */
	@RequestMapping("/updateProduct.do")
	public String updateProduct(ProductDTO productDto, MultipartHttpServletRequest request,
	        int color0, int color1, int color2, int color3, int color4) {
	    ArrayList<Integer> color = new ArrayList<>();
		
	    if(color0 != -1)
	        color.add(color0);
	    if(color0 != -1)
	        color.add(color1);
	    if(color0 != -1)
	        color.add(color2);
	    if(color0 != -1)
	        color.add(color3);
	    if(color0 != -1)
	        color.add(color4);
	    
	    productService.updateProduct(productDto);
	    String productno = productDto.getProductno();
        
		String root = "c:\\fileUpload\\";
		File userRoot = new File(root);
		if (!userRoot.exists())
			userRoot.mkdirs();

		List<MultipartFile> fileList = request.getFiles("file");
		
		// ?????? ???????????? ????????? ?????? ????????????.
	    List<String> filepath = productService.selectDeleteFilePath(productno);
	    for(String filepathEa : filepath) {
	        File delFile = new File(filepathEa);
	        delFile.delete();
	    }
        productService.deletePrevFile(productno);
        
        int color_idx = 0;
        // ?????? ?????? ???????????? ???????????????.
		for (MultipartFile f : fileList) {
			String originalFileName = f.getOriginalFilename();
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
			String date = sdf.format(Calendar.getInstance().getTime());
			String imagefilename = date + "_img" + originalFileName;
			
			if (f.getSize() == 0)
				continue;
			File uploadFile = new File(root + "\\" + imagefilename);
			FileDTO file = new FileDTO(uploadFile, productno, 0, color.get(color_idx));
			//productService.insertFileList(new FileDTO(uploadFile, productno, 0));
			productService.insertFileListAddColor(file);
			color_idx++;
			try {
				f.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
		return "redirect:/productView.do?productno="+productno;
	}

	// ------------------------------- ????????? ---------------------------------//

	// ------------------------------- ????????? ---------------------------------//

	@RequestMapping("/test.do")
	public String insertCartProduct(Model model, HttpSession session) {
		return "test";
	}

	@RequestMapping("/checkcartpop.do")
	public String checkcartpop(Model model, HttpSession session, CartDTO cdto) {
		return "checkcartpop";
	}

	@RequestMapping("/shopfullwidth.do")
	public String shopfullwidht(Model model, HttpSession session, CartDTO cdto) {

		return "shop-fullwidth";
	}

	@RequestMapping("/insert-cart.do")
	public ResponseEntity<CartDTO> insertCartProduct(String productname, Model model, HttpSession session,
			String memberId, CartDTO cdto) {
		memberId = (String) session.getAttribute("id");
		cdto.setMemberid(memberId);
		int count = productService.selectCart(cdto);
		
		if (count != 0) {
			int quantity = cdto.getQuantity();
			count = productService.updateQuantity(cdto);
			CartDTO cdto1 = productService.selectCartDTO(cdto);
			cdto1.setQuantity(quantity);
			return ResponseEntity.ok(cdto1);
		}
		
		productService.insertCartProduct(cdto);
		CartDTO cdto1 = productService.selectCartDTO(cdto);

		return ResponseEntity.ok(cdto1);
	}

	@RequestMapping("/shoping-cart.do")
	public String shoping_cart(Model model, HttpSession session, String productno, String memberId) {
		memberId = (String) session.getAttribute("id");
		List<CartDTO> cartlist = memberService.selectShoppingCartList(memberId);
		
		model.addAttribute("cartlist", cartlist);
		return "shoping-cart";
	}

	@RequestMapping("/deletecart.do")
	public String deleteCart(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response,
			String memberId, String productno) {
		memberId = (String) session.getAttribute("id");

		productService.deleteCart(memberId,productno);

		return "redirect:/shoping-cart.do";
	}

	@RequestMapping("/productdetailview.do")
	public String ProductDetailView(Model model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, String memberId, String productno, String productname) {
		List<FileDTO> filelist = productService.selectFilePath(productno);

		ProductDTO productdto = productService.ProductDetailView(productname);
		List<ColorDTO> colorlist = productService.selectProductColorList(productno);
		List<SizesDTO> sizeslist = productService.selectProductSizesList(productno);
		List<ProductDTO> productlist = productService.selectProductListCategory(productno);
		
		memberId = (String) session.getAttribute("id");
		model.addAttribute("productdto", productdto);
		model.addAttribute("colorlist", colorlist);
		model.addAttribute("sizeslist", sizeslist);
		model.addAttribute("filelist", filelist);
		model.addAttribute("productlist", productlist);
		model.addAttribute("memberId", memberId);
		
		return "product_detailview";
	}

	@RequestMapping("/checkout.do")
	public String checkout(Model model, String memberId, HttpSession session, CartDTO cdto) {
		memberId = (String) session.getAttribute("id");

		List<CartDTO> cartlist = productService.selectCartProduct(memberId);
		MemberDTO mdto = memberService.selectMemberInfo(memberId);
		
		model.addAttribute("cartlist", cartlist);
		model.addAttribute("mdto", mdto);

		return "checkout";
	}

	@RequestMapping("/selectproductsizelist.do")
	public ResponseEntity<List<SizesDTO>> selectproductsizelist(Model model, ProductDTO pdto) {
		List<SizesDTO> sdto = productService.selectproductsizelist(pdto);
		return ResponseEntity.ok(sdto);
	}

	// ------------------------------- ????????? ---------------------------------//

}