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
import com.mvc.dto.AdminDTO;
import com.mvc.service.MemberService;

@WebServlet({"/login","/logout","/join","/overlay", "/profileDetail", "/profileUpdate", "/profileUpdateForm", "/delProfile", "/kickChk"})
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
				//System.out.println("조인 창");
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
				//System.out.println("result : "+obj);
				resp.getWriter().println(obj);
			break;
			
			case "/overlay":
				//System.out.println("중복 아이디 체크 요청");
				success = service.overlay();
				map = new HashMap<String, Object>();
				map.put("overlay", success);
				gson = new Gson();
				obj = gson.toJson(map);
				//System.out.println("result : "+obj);
				resp.getWriter().println(obj);	
			break;
			
			case "/profileDetail":
				//System.out.println("프로필 상세보기 요청");
				String detailId = req.getParameter("id");
				//System.out.println("확인할 ID : " + detailId);
				AdminDTO dto = service.profileDetail(detailId);
				String uploadPath = "/photo/" +dto.getNewFileName();
 				req.setAttribute("path", uploadPath);
				req.setAttribute("profileDetail", dto);
				dis = req.getRequestDispatcher("member03_profile.jsp");
				dis.forward(req, resp);
				break;
				
			case "/profileUpdateForm":
				//System.out.println("수정폼으로 이동 요청 발생");
				String upId = req.getParameter("id");
 				String upName = req.getParameter("name");
 				String upBirth = req.getParameter("birth");
 				String upEmail = req.getParameter("email");
 				String upAddr = req.getParameter("addr");
 				String upPhone = req.getParameter("phone");
 				//System.out.println("사용할 파라메터 값 : " + upId + " / " + upName + " / " + upBirth + " / " + upEmail + " / " + upAddr + " / " + upPhone);
 				dto = service.profileUpdateForm(upId);
 				req.setAttribute("profileUpdateForm", dto);
 				dis = req.getRequestDispatcher("member04_profileupdate.jsp");
 				dis.forward(req, resp);
				
				break;
				
			case "/profileUpdate":
				//System.out.println("수정 요청 발생");
				service.profileUpdate();
				break;
				
			case "/delProfile":
				//System.out.println("삭제 요청 발생");
				service.delProfile();
				break;
				
			case "/kickChk":
				//System.out.println("제명 확인 요청");
				success = service.kickChk();
				map = new HashMap<String, Object>();
				map.put("kickChk", success);
				gson = new Gson();
				obj = gson.toJson(map);
				//System.out.println("result : "+obj);
				resp.getWriter().println(obj);	
			break;
		}
		
		
		
	}
	
	

}
