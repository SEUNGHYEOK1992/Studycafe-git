package com.mvc.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.AskDAO;
import com.mvc.dto.AskDTO;

public class AskService {

	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	
	public AskService(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}

	public void list() throws ServletException, IOException {
		AskDAO dao = new AskDAO(); // DB 필요로 인한 DAO 객체화
		ArrayList<AskDTO> list = dao.list();
		System.out.println("리턴");
		req.setAttribute("list", list);
		RequestDispatcher dis = req.getRequestDispatcher("askBoard01_List.jsp");
		dis.forward(req, resp);
	}

	public void askwrite(String id) throws IOException {
		AskDAO dao = new AskDAO();
		req.setCharacterEncoding("UTF-8");
		String subject = req.getParameter("askingTypes");
		String content = req.getParameter("content");
		System.out.println(id+"/"+subject+"/"+content);
		
		String page = "askBoard04_WriteForm.jsp";
		//성공했을경우 ask로 보내고 아니면 writeform으로 보낸다.
		if(dao.askwrite(id,subject,content)) {
			page ="./ask";
		}
		
		resp.sendRedirect(page);
	}

	public void askdetail() throws ServletException, IOException {
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		System.out.println("에스크디테일 값은?"+b_idx);
		AskDAO dao = new AskDAO();
		req.setAttribute("bbs", dao.askdetail(b_idx));
		RequestDispatcher dis = req.getRequestDispatcher("askBoard02_Detail.jsp");
		dis.forward(req, resp);
		
	}

	public void askupdateform() throws ServletException, IOException {
		AskDAO dao = new AskDAO();
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		System.out.println("수정을 할 b_idx : "+b_idx);
		AskDTO dto = dao.askdetail(b_idx);
		req.setAttribute("bbs", dto);
		System.out.println("넘어갔을까?");
		RequestDispatcher dis = req.getRequestDispatcher("askBoard03_UpdateForm.jsp");
		dis.forward(req, resp);
		
	}

	public void askupdate() throws ServletException, IOException {
		System.out.println("넘어왔나?");
		req.setCharacterEncoding("UTF-8");
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		String subject = req.getParameter("askingTypes");
		String content = req.getParameter("content");
		System.out.println(b_idx+" / "+subject+" / "+content);
		AskDAO dao = new AskDAO();
		String page = "askdetail?b_idx="+b_idx;
		String msg = "수정에 실패했습니다.";
		if(dao.askupdate(b_idx,subject,content)) {
			msg = "수정에 성공하였습니다.";
		}
		req.setAttribute("msg", msg);
		RequestDispatcher dis = req.getRequestDispatcher(page);
		dis.forward(req, resp);
		
	}

	public void askdel() throws ServletException, IOException {
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		System.out.println("삭제 b_idx는?"+b_idx);
		AskDAO dao = new AskDAO();
		String page = "askdetail";
		 String msg = "삭제에  실패했습니다!"; 
		if(dao.askdel(b_idx)) {
			page = "/ask";
			 msg = "삭제에 성공했습니다!"; 
		}
		 req.setAttribute("msg", msg);
		RequestDispatcher dis = req.getRequestDispatcher(page);
		dis.forward(req, resp);		
	}

}
