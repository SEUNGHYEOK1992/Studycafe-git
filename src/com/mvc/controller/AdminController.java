package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dto.AdminDTO;
import com.mvc.service.AdminService;
import com.mvc.service.MemberService;

@WebServlet("/memberList")
public class AdminController extends HttpServlet {
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
		AdminService service = new AdminService(req,resp);
		
		switch(reqAddr) {
			case "/memberList":
				ArrayList<AdminDTO> list = null;
				System.out.println("요청");
				list = service.memberList();
				req.setAttribute("list", list);
				dis = req.getRequestDispatcher("admin01_Manage.jsp");
				dis.forward(req, resp);
			break;
		
		}
	}
}
