package com.mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.service.ReportboardService;

@WebServlet({"/reportlist","/reportdetail"})
public class ReportboardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		String ctx = req.getContextPath();
		String  reqAddr = uri.substring(ctx.length());
		
		ReportboardService service = new ReportboardService(req,resp);
		
		switch(reqAddr) {
		case "/reportlist":
			System.out.println("공지사항 리스트 요청하기");
			service.list();
			break;
			
		case "/reportdetail":
			System.out.println("디테일 리스트 요청하기");
			service.reportdetail();
			break;
			
		}
	}

	
}
