package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dto.FreeBoardDTO;
import com.mvc.service.FreeBoardService;
@WebServlet({"/fbList","/fbdetail","/fbwrite","/fbUpdateForm","/fbUpdate","/fbDelete"})
public class FreeBoardContoller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String ctx = req.getContextPath();
		String reqAddr = uri.substring(ctx.length());
		req.setCharacterEncoding("utf-8");
		
		RequestDispatcher dis = null;
		FreeBoardService service = new FreeBoardService(req,resp);
		switch(reqAddr) {
			case "/fbList":
				String pageParam = req.getParameter("page");
				int page = 1;
				if(pageParam != null) {
					page = Integer.parseInt(pageParam);
				}
				//System.out.println("fblist 요청");
				ArrayList<FreeBoardDTO> list = null;
				list = service.fbList(page);
				req.setAttribute("list", list);
				req.setAttribute("currPage", page);
				dis = req.getRequestDispatcher("freeBoard01_List.jsp");
				dis.forward(req, resp);
			break;
			
			case "/fbdetail":
				service.fbdetail();
			break;
			
			case "/fbwrite":
				//System.out.println("작성페이지 이동");
				long pk = service.fbwrite();
				if(pk>0) {
					dis = req.getRequestDispatcher("fbdetail?b_idx="+pk);
					dis.forward(req, resp);
				}
			break;
			
			case "/fbUpdateForm":
				//System.out.println("업데이트 폼");
				req.setAttribute("bbsUp", service.fbUpdateForm());
				dis = req.getRequestDispatcher("freeBoard04_UpdateForm.jsp");
				dis.forward(req, resp);
			break;
			
			case "/fbUpdate":
				//System.out.println("수정 폼 ");
				//System.out.println(req.getParameter("b_idx"));
				service.fbUpdate();
			break;
			
			case "/fbDelete":
				//System.out.println("삭제 요청");
				service.fbDelete();
			break;
		}
	}
	
}
