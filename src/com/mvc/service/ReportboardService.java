package com.mvc.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.AskDAO;
import com.mvc.dao.ReportboardDAO;
import com.mvc.dto.ReportboardDTO;

public class ReportboardService {
	
	HttpServletRequest req = null;
	HttpServletResponse resp = null;

	public ReportboardService(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}

	public void list() throws ServletException, IOException {
		String pageParam = req.getParameter("page");
		int page = 1;
		if(pageParam != null) {
			page = Integer.parseInt(pageParam);
		}
		ReportboardDAO dao = new ReportboardDAO();
		int totCount = dao.pcrepoList();
		int listCount =10;
		int totPage = totCount/listCount;
		if(totCount % listCount > 0 ) {
			totPage ++;
		}
		if(totPage ==0) {
			totPage=1;
		}
		dao = new ReportboardDAO();
		ArrayList<ReportboardDTO> list = dao.list(page);
		//System.out.println("공지사항 리턴");
		req.setAttribute("list", list);
		req.setAttribute("currPage", page);
		req.setAttribute("endPage", totPage);
		RequestDispatcher dis = req.getRequestDispatcher("reportBoard01_List.jsp");
		dis.forward(req, resp);
	}

	public void reportdetail() throws ServletException, IOException {
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		//System.out.println("리포트 디테일 값 받아오기"+b_idx);
		ReportboardDAO dao = new ReportboardDAO();
		ReportboardDTO dto = new ReportboardDTO(); 
		dto = dao.reportdetail(b_idx);
		req.setAttribute("bbs", dto);
		String page= "fbdetail";
		if(dto.getCategory() == 1) {
			page = "askdetail";
		}
		RequestDispatcher dis = req.getRequestDispatcher(page+"?b_idx="+b_idx);
		dis.forward(req, resp);
		
	}

}
