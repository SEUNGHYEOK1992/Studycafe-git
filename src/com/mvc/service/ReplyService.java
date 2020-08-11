package com.mvc.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.ReplyDAO;
import com.mvc.dto.ReplyDTO;

public class ReplyService  {
	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	
	public ReplyService(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}

	public void list() {
		ReplyDAO dao = new ReplyDAO();
		ArrayList<ReplyDTO> list = dao.list();
		
		
		
	}
	
	
	
}
