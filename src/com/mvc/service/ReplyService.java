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
import com.mvc.dao.ReplyDAO;
import com.mvc.dto.ReplyDTO;

public class ReplyService  {
	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	
	public ReplyService(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}

	public void list() throws ServletException, IOException {
		ReplyDAO dao = new ReplyDAO();
		String b_idx = req.getParameter("b_idx");
		ArrayList<ReplyDTO> list = dao.list(b_idx);
		req.setAttribute("list", list);
		RequestDispatcher dis = req.getRequestDispatcher("Reply.jsp");
		dis.forward(req, resp);
		
	}

	public void write() throws IOException, ServletException {
		ReplyDAO dao = new ReplyDAO();
		req.setCharacterEncoding("UTF-8");
		String id = (String)req.getSession().getAttribute("id");
		System.out.println(id);
		String comment = req.getParameter("repl_comment");
		System.out.println(comment);
		String b_idx = req.getParameter("b_idx");
		System.out.println(b_idx);
		
		dao.write(id,comment,b_idx);
		String page = "rplist";
		
		if(id==null) {
			String msg = "로그인여부를 확인해주세요.";
			req.setAttribute("msg", msg);
			RequestDispatcher dis = req.getRequestDispatcher("member01_login.jsp");
			dis.forward(req, resp);
		}
		resp.sendRedirect(page);
	}

	public void del() throws ServletException, IOException {
		String idx = req.getParameter("repl_idx");
		System.out.println("repl_idx : "+idx);
		ReplyDAO dao = new ReplyDAO();
		String id = (String) req.getSession().getAttribute("id");
		String page = "/fbdetail";
		boolean success = dao.del(idx);
		String msg = "삭제 성공하였습니다.";
		req.setAttribute("msg", msg);
		
		RequestDispatcher dis = req.getRequestDispatcher(page);
		dis.forward(req, resp);
		
		
	}

	public void rpupdateForm() throws IOException {	
		ReplyDAO dao = new ReplyDAO();
		String repl_idx = (String)req.getSession().getAttribute("repl_idx");
		System.out.println("수정 idx : "+repl_idx);
		ReplyDTO dto = null;
		
		dto = dao.updateForm(repl_idx);
		dao.resClose();
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(dto!=null) {
			map.put("success",true);
			map.put("info", dto);
		}else {
			map.put("success", false);
		}
		Gson gson = new Gson();
		String obj = gson.toJson(map);
		resp.setContentType("text/html; charset=UTF-8");
		resp.getWriter().println(obj);
		
		
//		req.setAttribute("rply",dao.updateForm(repl_idx) );
//		dao = new ReplyDAO();
//		ReplyDTO dto =  dao.updateForm(repl_idx);
//		System.out.println("찍힙니까 낙낙");
//		req.setAttribute("rply2", dto);
//		RequestDispatcher dis = req.getRequestDispatcher("그 히든으로 줄 div를 못넣나");
		

	}
	
	
	
}
