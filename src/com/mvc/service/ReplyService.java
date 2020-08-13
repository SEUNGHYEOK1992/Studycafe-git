package com.mvc.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvc.dao.FreeBoardDAO;
import com.mvc.dao.ReplyDAO;
import com.mvc.dto.ReplyDTO;

public class ReplyService  {
	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	
	public ReplyService(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}

	public void rpdel() throws IOException, ServletException {
		ReplyDAO dao = new ReplyDAO();
		String repl_idx = req.getParameter("repl_idx");
//		System.out.println("repl_idx : "+repl_idx);
		String b_idx = req.getParameter("b_idx");
//		System.out.println(req.getParameter("b_idx"));
		//ReplyDAO dao = new ReplyDAO();
		String page = "fbdetail";

		if(dao.rpdel(repl_idx)) {
			String msg = "삭제 성공하였습니다.";
			req.setAttribute("msg", msg);			
		}
		RequestDispatcher dis = req.getRequestDispatcher(page+"?b_idx="+b_idx);
		dis.forward(req, resp);

	}
	
	//여기 댓글 작성	
	public void rpwrite() throws IOException, ServletException {
		ReplyDAO dao = new ReplyDAO();
		//ReplyDAO dao2 = new ReplyDAO();
		req.setCharacterEncoding("UTF-8");
		String id = (String)req.getSession().getAttribute("id");
		System.out.println(id);
		String comment = req.getParameter("comment");
		System.out.println(comment);
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		System.out.println("여기야 여기~~~~~~~~ : " +b_idx);
		
		dao.write(id, comment, b_idx);
		//String page = "/fbdetail";
		
		if(id==null) {
			String msg = "로그인여부를 확인해주세요.";
			req.setAttribute("msg", msg);
			RequestDispatcher dis = req.getRequestDispatcher("member01_login.jsp");
			dis.forward(req, resp);
		}
		
		resp.sendRedirect("fbdetail?b_idx="+b_idx);
	}
	
	public boolean rpupdateForm() throws IOException {	
		ReplyDAO dao = new ReplyDAO();
		int repl_idx = Integer.parseInt(req.getParameter("repl_idx"));
		String comm = req.getParameter("repl_comment");
		//System.out.println("수정 idx : "+repl_idx);
		//System.out.println("수정 내용 : " +comm);
		ReplyDTO dto = null;
		return dao.rpupdateForm(repl_idx,comm);
	}
	
	
}
