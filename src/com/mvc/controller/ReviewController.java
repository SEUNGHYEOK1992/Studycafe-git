package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.ReviewDAO;
import com.mvc.service.ReviewService;

@WebServlet({"/rvlist","/rvwrite","/rvdel","/rvupdateForm","/rvupdate"})
public class ReviewController extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//URI-CONTEXT = ReqAddr
		String uri = req.getRequestURI();
		String ctx = req.getContextPath();
		String reqAddr = uri.substring(ctx.length());
		ReviewService revservice = new ReviewService(req,resp);
		
		
		switch(reqAddr) {
		
		case"/rvlist":
			System.out.println("글 리스트 보기 요청");			
			revservice.list();
			break;
						
		case"/rvwrite":
			System.out.println("글쓰기요청");
			revservice.write();
			break;
			
		case"/rvdel":
			System.out.println("삭제요청");
			revservice.del();
			break;
		
			
		case"/rvupdateForm":
			System.out.println("수정 폼 이동 요청");
			revservice.updateForm();
			break;
		}

	}
}
