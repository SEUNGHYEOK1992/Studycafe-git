package com.mvc.service;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.ReplyDAO;

public class ReplyService  {
	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	
	public ReplyService(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}

	public void list() {
		ReplyDAO dao = new ReplyDAO();
		
		
	}
	
	
	
}
