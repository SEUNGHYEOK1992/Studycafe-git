package com.mvc.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.AdminDAO;
import com.mvc.dto.AdminDTO;

public class AdminService {
	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	
	public AdminService(HttpServletRequest req, HttpServletResponse resp) {
		this.req =req;
		this.resp =resp;
	}

	public ArrayList<AdminDTO> memberList() {
		ArrayList<AdminDTO> list = null;
		AdminDAO dao = new AdminDAO();
		list = dao.memberList();
		return list;
	}
	
	

}
