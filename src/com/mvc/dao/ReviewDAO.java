package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

import com.mvc.dto.ReviewDTO;

public class ReviewDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ReviewDAO() {
		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void resClose() {
		try {
			if(rs!=null) {rs.close();}
			if(ps!=null) {ps.close();}
			if(conn!=null) {conn.close();}
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}

	public ArrayList<ReviewDTO> list() throws SQLException {
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		String sql = "Select b_idx,id,content FROM revtest WHERE category=2 ORDER BY b_idx DESC; ";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			ReviewDTO dto = new ReviewDTO();
			dto.setB_idx(rs.getInt("b_idx"));
			dto.setId(rs.getString("id"));
			dto.setContent(rs.getString("content"));
			list.add(dto);
		}
		return list;
		
	}


}
