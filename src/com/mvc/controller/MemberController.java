package com.mvc.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.mvc.service.MemberService;

@WebServlet({"/login","/logout","/join","/overlay"})
public class MemberController extends HttpServlet {
	
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
		MemberService service = new MemberService(req,resp);
		
		switch(reqAddr) {
			case "/login":
				//System.out.println("로그인 요청");
				boolean success = service.login();
				String page = "member01_login.jsp";
				String msg = "로그인에 실패 하였습니다.";
				String id=req.getParameter("id");
				String admin = "admin";
				if(success) {
					if(id.equals(admin)) {
						page="admin00_Main.jsp";
						msg="관리자 페이지입니다.";
					}else {
						page = "index.jsp";
						msg = "환영합니다.";
					}
					req.getSession().setAttribute("id", id);
				}
				req.setAttribute("msg", msg);
				req.setAttribute("id", id);
				dis=req.getRequestDispatcher(page);
				dis.forward(req, resp);
			break;
			
			case "/logout":
				//System.out.println("로그아웃 접속");
				req.getSession().removeAttribute("id");
				resp.sendRedirect("index.jsp");
			break;
			
		
			case "/join":
				System.out.println("조인 창");
				success = service.join();
				/*page = "member02_join.jsp";
				msg="회원가입 실패";
				if(success) {
					page = "member01_login.jsp";
					msg = "회원가입 성공";
				}
				req.setAttribute("msg", msg);
				dis=req.getRequestDispatcher(page);
				dis.forward(req, resp);*/
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("join", success);
				Gson gson = new Gson();
				String obj = gson.toJson(map);
				System.out.println("result : "+obj);
				resp.getWriter().println(obj);
			break;
			
			case "/overlay":
				System.out.println("중복 아이디 체크 요청");
				success = service.overlay();
				map = new HashMap<String, Object>();
				map.put("overlay", success);
				gson = new Gson();
				obj = gson.toJson(map);
				System.out.println("result : "+obj);
				resp.getWriter().println(obj);	
			break;
		}
		
		
		
	}
	
	

}
