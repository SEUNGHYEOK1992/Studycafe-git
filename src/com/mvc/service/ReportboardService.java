package com.mvc.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		ReportboardDAO dao = new ReportboardDAO();
		ArrayList<ReportboardDTO> list = dao.list();
		System.out.println("공지사항 리턴");
		req.setAttribute("list", list);
		RequestDispatcher dis = req.getRequestDispatcher("reportBoard01_List.jsp");
		dis.forward(req, resp);
	}

}
