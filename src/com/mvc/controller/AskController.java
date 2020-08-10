package com.mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.service.AskService;

@WebServlet({"/ask","/askwrite","/askdetail","/askupdateform","/askupdate","/askdel"})
public class AskController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		proccess(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		proccess(req,resp);
	}

	private void proccess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		String ctx = req.getContextPath();
		String reqAddr = uri.substring(ctx.length());
		
		AskService service = new AskService(req,resp);
		
		switch(reqAddr) {
		
			case "/ask":
				System.out.println("문의사항 리스트 요청");
				service.list();
				break;
				
			case "/askwrite":
				System.out.println("글 쓰기 요청");
				String id = (String) req.getSession().getAttribute("id");
				System.out.println(id);
				service.askwrite(id);
				break;
				
			case "/askdetail":
				System.out.println("글 상세보기 요청");
				service.askdetail();
				break;
				
			case "/askupdateform":
				System.out.println("수정 폼으로 이동 요청");
				service.askupdateform();
				break;
				
			case "/askupdate":
				System.out.println("수정!");
				service.askupdate();
				break;
				
			case "/askdel":
				System.out.println("삭제 요청!!!!");
				service.askdel();
				break;
		}
	}

}
