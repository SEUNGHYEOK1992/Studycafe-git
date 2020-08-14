package com.mvc.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.mvc.dao.AdminDAO;
import com.mvc.dto.AdminDTO;
import com.mvc.dto.BlackDTO;
import com.mvc.dto.ComplainDTO;
import com.mvc.dto.KickDTO;

public class AdminService {
	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	
	public AdminService(HttpServletRequest req, HttpServletResponse resp) {
		this.req =req;
		this.resp =resp;
	}

	public ArrayList<AdminDTO> memberList(int page) {
		ArrayList<AdminDTO> list = null;
		AdminDAO dao = new AdminDAO();
		list = dao.memberList(page);
		return list;
	}

	public AdminDTO detail() {
		String id = req.getParameter("id");
		//System.out.println(id);
		AdminDAO dao = new AdminDAO();
		return dao.detail(id);
	}

	public boolean update() {
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String addr = req.getParameter("addr");
		String blacklist = req.getParameter("blacklist");
		//System.out.println(id+" / "+name+" / "+birth+" / "+email+" / "+phone+" / "+addr+" / "+blacklist);
		AdminDAO dao = new AdminDAO();
		return dao.update(id,name,birth,email,phone,addr,blacklist);
		
	}

	public ArrayList<ComplainDTO> report(int page) {
		ArrayList<ComplainDTO> list = null;
		AdminDAO dao = new AdminDAO();
		list = dao.report(page);
		return list;
	}

	public ArrayList<BlackDTO> blackList(int page) {
		ArrayList<BlackDTO> list = null;
		AdminDAO dao = new AdminDAO();
		list = dao.blackList(page);
		return list;
	}

	public ArrayList<KickDTO> kick(int page) {
		AdminDAO dao = new AdminDAO();
		return dao.kick(page);
	}

	public boolean delete() {
		String id = req.getParameter("id");
		//System.out.println(id);
		boolean success =false;
		AdminDAO dao = new AdminDAO();
		success = dao.delete(id);
		//System.out.println("success 값 2차 확인 : " + success);
		return success;
	}

	public boolean kickAdd(String id, String cause) {
		//System.out.println("서비스 등장");
		AdminDAO dao = new AdminDAO();
		return dao.kickAdd(id,cause);
	}

	public int pcMember() {
		AdminDAO dao = new AdminDAO();
		return dao.pcMember();
	}

	public int pcReport() {
		AdminDAO dao = new AdminDAO();
		return dao.pcReport();
	}

	public int pcBlack() {
		AdminDAO dao = new AdminDAO();
		return dao.pcBlack();
	}

	public int pcKick() {
		AdminDAO dao = new AdminDAO();
		return dao.pcKick();
	}
	
	

}
