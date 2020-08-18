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
	String id;
	
	public ReviewDAO() {
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ReviewDTO> list(int page) {
		String sql;
		int pagePerCnt = 10; // 페이지 당 보여줄 게시물의 수
		int end = page * pagePerCnt;
		int start = (end-pagePerCnt)+1;
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		try {
			sql = "SELECT rnum, b_idx, id, content FROM (SELECT ROW_NUMBER() OVER(ORDER BY b_idx DESC) AS rnum, "
					+ "b_idx, id, content FROM bbs WHERE category=2) WHERE rnum BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setB_idx(rs.getString("b_idx"));
//				System.out.println(dto.getB_idx());
				dto.setId(rs.getString("id"));
//				System.out.println(dto.getId());
				dto.setContent(rs.getString("content"));
//				System.out.println(dto.getContent());
				list.add(dto);
		}
//			System.out.println("dto받아왔냐?");
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return list;
	}
	
	public boolean write(String content, String id) {
		String sql = "INSERT INTO bbs (b_idx,id,content,category) VALUES(bbs_seq.NEXTVAL,?,?,2)";
		boolean success = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, content);
			if(ps.executeUpdate()>0){
				success = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return success;
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

	public boolean del(String b_idx) {
		String sql = "DELETE FROM bbs WHERE category=2 AND b_idx=?";
		boolean result = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, b_idx);
			int success = ps.executeUpdate();
			
			if(success>0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return result;
	}

	public ReviewDTO updateForm(String b_idx) {
		String sql = "SELECT b_idx,id,content FROM bbs WHERE b_idx=?";
		ReviewDTO dto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, b_idx);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new ReviewDTO();
				dto.setB_idx(rs.getString("b_idx"));
				//System.out.println(dto.getB_idx());
				dto.setId(rs.getString("id"));
				//System.out.println(dto.getId());
				dto.setContent(rs.getString("content"));
				//System.out.println(dto.getContent());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return dto;
	}

	public boolean update(int b_idx, String content) {
		boolean result = false;
		String sql = "UPDATE bbs SET content=? WHERE b_idx=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, content);
			ps.setInt(2, b_idx);
			
			if(ps.executeUpdate()>0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return result;
		
			
	}

	public int pcrvlist() {
		String sql ="select count(*) as totalCount from bbs where category=2";
		int count = 0;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("totalCount");
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}finally {
			resClose();
		}	
		return count;
	}




	


}
