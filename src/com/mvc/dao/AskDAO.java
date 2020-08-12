package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.AskDTO;

public class AskDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public AskDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}

	public ArrayList<AskDTO> list() {
		String sql = "SELECT b_idx, id, subject, content, reg_date, bhit, category FROM bbs WHERE category=1 ORDER BY b_idx DESC";
		ArrayList<AskDTO> list = new ArrayList<AskDTO>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				AskDTO dto = new AskDTO();
				dto.setB_idx(rs.getInt("b_idx")); 
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setbHit(rs.getInt("bHit"));
				list.add(dto);
			}System.out.println("받아옴");
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			resClose();
		}
		
		return list;
	}

	private void resClose() {
		try {
			if(rs!=null) {rs.close();}
			if(ps!=null) {ps.close();}
			if(conn!=null) {conn.close();}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public boolean askwrite(String id, String subject, String content) {
		String sql = "INSERT INTO bbs(b_idx,id,subject,content,category)"
				+"VALUES(bbs_seq.NEXTVAL,?,?,?,1)";
		boolean success = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, subject);
			ps.setString(3, content);
			/* ps.executeUpdate(); */
			if(ps.executeUpdate()>0) {
				success = true;
			}System.out.println("받아옴2");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return success;
	}

	public AskDTO askdetail(int b_idx) {
		String sql = "SELECT b_idx, id, subject, content, reg_date FROM bbs WHERE b_idx=?";
		AskDTO dto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new AskDTO();
				dto.setB_idx(rs.getInt("b_idx"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content")); 
				dto.setReg_date(rs.getDate("reg_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			resClose();
		}
		return dto;
	}

	public boolean askupdate(int b_idx, String subject, String content) {
		boolean result = false;
		String sql = "UPDATE bbs SET subject=?,content=?,reg_date=sysdate WHERE b_idx=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, subject);
			ps.setString(2, content);
			ps.setInt(3, b_idx);
			if(ps.executeUpdate()>0) {
				result = true;
			}System.out.println("askupdte dao입니다");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return result;
	}

	public boolean askdel(int b_idx) {
		String sql = "DELETE FROM bbs WHERE b_idx=?";
		boolean result = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
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
	
}
