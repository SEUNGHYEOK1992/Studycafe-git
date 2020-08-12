package com.mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.service.ReplyService;
import com.mvc.service.ReviewService;

@WebServlet({"/rplist","/rpwrite","/rpdel","/rpupdateForm","/rpupdate"})

public class replyController extends HttpServlet {

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
		ReplyService rpservice = new ReplyService(req,resp);
		
		switch(reqAddr) {
			
		case"/rplist":
			System.out.println("댓글 리스트 보기요청");
			rpservice.list();
			break;
			
		case"/rpwrite":
			System.out.println("댓글 작성");
			rpservice.write();
			break;
			
		case"/rpdel":
			System.out.println("댓글 삭제");
			rpservice.del();
			break;
			
		case"/rpupdateForm":
			System.out.println("댓글 수정 폼");
			rpservice.rpupdateForm();
			break;
		}
}
	

		
		
		
		
		
		
		
		
		
		
}
