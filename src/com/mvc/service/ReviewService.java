package com.mvc.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.google.gson.Gson;
import com.mvc.dao.ReviewDAO;
import com.mvc.dto.ReviewDTO;

public class ReviewService {
	
	HttpServletRequest req = null;
	HttpServletResponse resp = null;

	public ReviewService(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}

	public void list() throws ServletException, IOException {
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewDTO> list = dao.list();
		req.setAttribute("list", list);
		RequestDispatcher dis = req.getRequestDispatcher("Review01.jsp");
		dis.forward(req, resp);
	
	}
	
	public void write() throws IOException {  //세션확인해야됨
		ReviewDAO dao = new ReviewDAO();
		req.setCharacterEncoding("UTF-8");
		String id = (String) req.getSession().getAttribute("id");
		System.out.println(id);
		String content = req.getParameter("content");
		System.out.println(content);
		dao.write(content,id);
		String page = "Review01.jsp";
		
		resp.sendRedirect(page);
	}

	
	

//====================================================
	








}
