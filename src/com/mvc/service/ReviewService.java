package com.mvc.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	public void list() throws IOException {
		HashMap<String,Object> map = new HashMap<String, Object>();
		Gson gson = new Gson();
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewDTO> list = null;
		
		try {
			list = dao.list();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dao.resClose();
		}
		map.put("list", list);	
		
		String obj = gson.toJson(map);
		System.out.println(obj);
		resp.setContentType("text/html; charset=UTF-8");
		resp.getWriter().println(obj);
	}




}
