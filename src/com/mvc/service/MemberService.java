package com.mvc.service;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvc.dao.MemberDAO;

public class MemberService {

	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	
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
		System.out.println(id +" / "+pw+" / "+name+" / "+birth+" / "+email+" / "+phone+" / "+addr);
		//System.out.println("서비스 창");
		boolean success = false;
		MemberDAO dao = new MemberDAO();
		success = dao.join(id,pw,name,birth,email,phone,addr);
		return success;
	}

	public boolean overlay() {
		String id = req.getParameter("id");
		boolean success = false; // 아이디가 중복되면 (있으면) true -> 가입할 수 없음.
		System.out.println("id : " + id);
		MemberDAO dao = new MemberDAO();
		success = dao.overlay(id);
		return success;
	}

}
