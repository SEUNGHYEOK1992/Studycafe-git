package com.mvc.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.google.gson.Gson;
import com.mvc.dao.ReviewDAO;
import com.mvc.dto.ReviewDTO;

public class ReviewService {
	
	HttpServletRequest req = null;
	HttpServletResponse resp = null;

	public ReviewService(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}

	public void list() throws ServletException, IOException {
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewDTO> list = dao.list();
		req.setAttribute("list", list);
		RequestDispatcher dis = req.getRequestDispatcher("Review01.jsp");
		dis.forward(req, resp);
	
	}
	
	public void write() throws IOException, ServletException {
		ReviewDAO dao = new ReviewDAO();
		req.setCharacterEncoding("UTF-8");
		String id = (String) req.getSession().getAttribute("id");
		//System.out.println(id);
		String content = req.getParameter("content");
		//System.out.println(content);
		dao.write(content,id);
		String page = "rvlist";
		if(id==null) {
			String msg = "로그인여부를 확인해주세요.";
			req.setAttribute("msg", msg);
			page = "member01_login.jsp";
		}
		RequestDispatcher dis = req.getRequestDispatcher(page);
		dis.forward(req, resp);
	}

	/*충돌*/
	public void del() throws ServletException, IOException {
		String idx = req.getParameter("repl_idx");
		//System.out.println("b_idx : "+idx);
		ReviewDAO dao = new ReviewDAO();
		String id = (String) req.getSession().getAttribute("id");
		String page = "/rvlist";
		boolean success = dao.del(idx);
		String msg = "삭제 성공하였습니다.";
		req.setAttribute("msg", msg);
		
		RequestDispatcher dis = req.getRequestDispatcher(page);
		dis.forward(req, resp);

		
	}

	public void updateForm() throws ServletException, IOException {
//		System.out.println("서비스 들어옴");
		String idx = req.getParameter("idx");
		ReviewDAO dao = new ReviewDAO();		
//		System.out.println("수정idx : "+idx);
		req.setAttribute("bbs", dao.updateForm(idx));
		dao = new ReviewDAO();	
		ReviewDTO dto = dao.updateForm(idx);
//		System.out.println("여기까지");
		req.setAttribute("review_bbs", dto);
		RequestDispatcher dis = req.getRequestDispatcher("revUpdateForm.jsp");
		dis.forward(req, resp);
		
		
		
		
	}

	public void update() throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		//System.out.println("서비스 들어옴");
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		String content = req.getParameter("rvcontent");
		//System.out.println(b_idx+"/"+content);
		ReviewDAO dao = new ReviewDAO();

		String page = "rvlist?idx="+b_idx;
		String msg = "수정실패";
		if(dao.update(b_idx,content)) {
			msg = "수정 성공";
		}
		req.setAttribute("msg", msg);
		RequestDispatcher dis = req.getRequestDispatcher(page);
		dis.forward(req, resp);
		
	}


	
	

	








}
