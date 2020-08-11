package com.mvc.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvc.dao.MemberDAO;
import com.mvc.dto.AdminDTO;

public class MemberService {

	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	RequestDispatcher dis = null;
	
	public MemberService(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}

	public boolean login() {
		//System.out.println("서비스 요청");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		//System.out.println(id+" / " + pw);
		MemberDAO dao = new MemberDAO();
		boolean success = dao.login(id,pw);
		//System.out.println("로그인 결과 : " +success); //재 확인
		return success;
	}

	public boolean join() {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String email = req.getParameter("email") +"@" +req.getParameter("email2");
		String phone = req.getParameter("phone");
		String addr = req.getParameter("addr");
		//System.out.println(id +" / "+pw+" / "+name+" / "+birth+" / "+email+" / "+phone+" / "+addr);
		//System.out.println("서비스 창");
		boolean success = false;
		MemberDAO dao = new MemberDAO();
		success = dao.join(id,pw,name,birth,email,phone,addr);
		return success;
	}

	public boolean overlay() {
		String id = req.getParameter("id");
		boolean success = false; // 아이디가 중복되면 (있으면) true -> 가입할 수 없음.
		//System.out.println("id : " + id);
		MemberDAO dao = new MemberDAO();
		success = dao.overlay(id);
		return success;
	}

	public AdminDTO profileDetail(String detailId) {
		MemberDAO dao = new MemberDAO();
		return dao.profileDetail(detailId);
	}

	public AdminDTO profileUpdateForm(String upId) {
		MemberDAO dao = new MemberDAO();
		// 가져오는 내용이 profileDetail() 과 동일 
		return dao.profileDetail(upId);
	}
	/*
	public void profileUpdate() throws ServletException, IOException { 
	    req.setCharacterEncoding("UTF-8");
	    String id = req.getParameter("id");
	    String name = req.getParameter("name");
	    String birth = req.getParameter("birth");
	    String email = req.getParameter("email");
	    String phone = req.getParameter("phone");
	    String addr = req.getParameter("addr");
	    System.out.println("수정 할 파라미터 값 : " + id + " / " + name + " 기타등등");
	    
	    String page = "profileDetail?id="+id;
	    String msg = "수정에 실패했습니다";
	    
	    MemberDAO dao = new MemberDAO();
	    if(dao.profileUpdate(id, name, birth, email, phone, addr)) {
	    	msg = "수정 성공";
	    }
	    
	    req.setAttribute("msg", msg);
	    RequestDispatcher dis = req.getRequestDispatcher(page);
	    dis.forward(req, resp);
	    
	}
*/
	
	public void delProfile() throws ServletException, IOException {
		String id = req.getParameter("id");
		//System.out.println("삭제할 아이디는 " + id + "입니다.");
		String page = "/";
		String msg = "탈퇴 실패";
		MemberDAO dao = new MemberDAO();
		if(dao.delProfile(id)) {
			msg = "탈퇴가 완료되었습니다";
		}
		req.setAttribute("msg", msg);
		req.getSession().removeAttribute("id");
		RequestDispatcher dis = req.getRequestDispatcher(page);
		dis.forward(req, resp);
	}

	public void profileUpdate() throws IOException {
		// 업로드 부분
		UploadService upload = new UploadService(req);
		boolean success = false;
		AdminDTO dto = upload.regist();
		String id = dto.getId();
		String orif = dto.getOriFileName();
		String newf = dto.getNewFileName();
		//System.out.println(id +" / " + orif + " / " + newf);
		
		// 프로필 수정 부분
		MemberDAO dao = new MemberDAO();
		int suc_cnt = dao.profileUpdate(dto);
		//System.out.println("서비스로 돌아온 성공 수 : " + suc_cnt);
		
		if(dto.getNewFileName() != null) { // 업로드 내용이 있으면
			upload = new UploadService(req); // 이전 이름을 가져와야 함
			// 이전 파일 이름을 가져온다.
			AdminDTO dto2 = new AdminDTO();
			dto2 = upload.getFileName(id);
			String prevOriF = dto2.getOriFileName();
			String prevNewF = dto2.getNewFileName();
			// 이전 파일 이름-> 새 파일 이름
			upload = new UploadService(req);
			upload.updateFileName(prevNewF,prevOriF,orif,newf,id);
			upload.delete(prevNewF); // 이전 이름의 파일을 삭제
			
		}
		resp.sendRedirect("profileDetail?id="+id);
	}
	

}
