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
import com.mvc.dto.BlackDTO;
import com.mvc.dto.ComplainDTO;
import com.mvc.dto.KickDTO;
import com.mvc.service.AdminService;

@WebServlet({"/memberList","/detail","/update","/report","/blackList","/kick","/delete","/kickAdd"})
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
				
				String pageParam = req.getParameter("page");
				int page = 1;
				if(pageParam != null) {
					page = Integer.parseInt(pageParam);
				}
				
				int totCount = service.pcMember();
				int listCount =10;
				int totPage = totCount/listCount;
				if(totCount % listCount > 0 ) {
					totPage ++;
				}
				//System.out.println(totCount);
				//System.out.println(totPage);
				ArrayList<AdminDTO> list = null;
				//System.out.println("요청");
				list = service.memberList(page);
				req.setAttribute("list", list);
				req.setAttribute("currPage", page);
				req.setAttribute("endPage", totPage);
				dis = req.getRequestDispatcher("admin01_Manage.jsp");
				dis.forward(req, resp);
			break;
			
			case "/detail":
				//System.out.println("디테일 요청");
				AdminDTO dto = service.detail();
				req.setAttribute("info", dto);
				dis=req.getRequestDispatcher("admin02_View.jsp");
				dis.forward(req, resp);
			break;
			
			case "/update":
				//System.out.println("수정 요청");
				boolean success = false;
				success = service.update();
				String msg = "수정 실패";
				if(success) {
					msg = "수정 성공";
				}
				req.setAttribute("msg", msg);
				dis = req.getRequestDispatcher("detail");
				dis.forward(req, resp);
			break;
			
			case "/report":
				//System.out.println("신고 요청");
				pageParam = req.getParameter("page");
				page = 1;
				if(pageParam != null) {
					page = Integer.parseInt(pageParam);
				}
				totCount = service.pcReport();
				listCount =10;
				totPage = totCount/listCount;
				if(totCount % listCount > 0 ) {
					totPage ++;
				}
				
				ArrayList<ComplainDTO> r_list = service.report(page);
				req.setAttribute("r_list", r_list);
				req.setAttribute("currPage", page);
				req.setAttribute("endPage", totPage);
				dis = req.getRequestDispatcher("admin03_Report.jsp");
				dis.forward(req, resp);
			break;
		
			case "/blackList":
				//System.out.println("블랙리스트 요청");
				pageParam = req.getParameter("page");
				page = 1;
				if(pageParam != null) {
					page = Integer.parseInt(pageParam);
				}
				totCount = service.pcBlack();
				listCount =10;
				totPage = totCount/listCount;
				if(totCount % listCount > 0 ) {
					totPage ++;
				}
				ArrayList<BlackDTO> b_list = null;
				b_list = service.blackList(page);
				req.setAttribute("b_list", b_list);
				req.setAttribute("currPage", page);
				req.setAttribute("endPage", totPage);
				dis=req.getRequestDispatcher("admin04_Black.jsp");
				dis.forward(req, resp);
			break;
			
			case "/kick":
				//System.out.println("킥 확인");
				pageParam = req.getParameter("page");
				page = 1;
				if(pageParam != null) {
					page = Integer.parseInt(pageParam);
				}
				totCount = service.pcKick();
				listCount =10;
				totPage = totCount/listCount;
				if(totCount % listCount > 0 ) {
					totPage ++;
				}
				ArrayList<KickDTO> k_list = null;
				k_list = service.kick(page);
				req.setAttribute("k_list", k_list);
				req.setAttribute("currPage", page);
				req.setAttribute("endPage", totPage);
				dis=req.getRequestDispatcher("admin05_Kick.jsp");
				dis.forward(req, resp);
			break;
			
			case "/delete":
				//System.out.println("delete 요청");
				String id = req.getParameter("id");
				success = false;
				success = service.delete();
				msg = "삭제 실패";
				if(success) {
					msg = "제명 목록에 추가하실거면 작성해주시고 추가하지 않을거면 취소를 눌러주세요.";
				}
				req.setAttribute("msg", msg);
				req.setAttribute("delete_id", id);
				dis = req.getRequestDispatcher("admin06_KickAdd.jsp");
				dis.forward(req, resp);
			break;
			
			case "/kickAdd":
				//System.out.println("제명 추가");
				String cause = req.getParameter("cause");
				id = req.getParameter("id");
				//System.out.println(id+"/"+cause);
				success = false;
				success = service.kickAdd(id,cause);
				msg = "제명 목록 추가 실패";
				if(success) {
					msg="제명 목록 추가 성공";
				}
				req.setAttribute("msg", msg);
				dis = req.getRequestDispatcher("kick");
				dis.forward(req, resp);
			break;
			
		}
	}
}
