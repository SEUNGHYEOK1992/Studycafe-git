package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import com.mvc.dto.AdminDTO;

public class AdminDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public AdminDAO() {
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

	public ArrayList<AdminDTO> memberList() {
		ArrayList<AdminDTO> list = new ArrayList<AdminDTO>();
		String sql = "select idx, id, name from memberlist order by idx";
		try {
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				AdminDTO dto = new AdminDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return list;
	}

}
