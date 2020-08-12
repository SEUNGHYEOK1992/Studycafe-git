package com.mvc.dao;

import java.awt.image.RescaleOp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mvc.dto.ReplyDTO;

public class ReplyDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ReplyDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<ReplyDTO> list(String b_idx) {
		String sql;
		ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();		
		
		try {
			sql = "SELECT * FROM REPLY WHERE b_idx=? ORDER BY repl_idx DESC ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, b_idx);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ReplyDTO dto = new ReplyDTO();
				dto.setB_idx(rs.getString("b_idx"));
				System.out.println(dto.getB_idx());
				dto.setId(rs.getString("id"));
				System.out.println(dto.getId());
				dto.setRepl_idx(rs.getString("repl_idx"));
				System.out.println(dto.getRepl_idx());
				dto.setRepl_comment(rs.getString("repl_comment"));
				System.out.println(dto.getRepl_comment());
				list.add(dto);
			}
			System.out.println("dto받앗니");
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return list;
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

	public boolean write(String id, String comment, String b_idx) {
		String sql = "INSERT INTO REPLY(repl_idx,b_idx,id,repl_comment) VALUES(reply_seq.nextval,?,?,?)";
		boolean success = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, b_idx);
			ps.setString(2, id);
			ps.setString(3, comment);
			if(ps.executeUpdate()>0) {
				success = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return success;
	}

	public boolean del(String idx) {
		String sql = "DELETE FROM REPLY WHERE repl_idx=?";
		boolean result = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return result;
	}

	public ReplyDTO updateForm(String repl_idx) {
		String sql = "SELECT repl_idx,id,repl_comment FROM reply WHERE repl_idx=?";
		ReplyDTO dto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, repl_idx);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new ReplyDTO();
				dto.setB_idx(rs.getString("b_idx"));
				System.out.println(dto.getB_idx());
				dto.setId(rs.getString("id"));
				System.out.println(dto.getId());
				dto.setRepl_idx(rs.getString("repl_idx"));
				System.out.println(dto.getRepl_idx());
				dto.setRepl_comment(rs.getString("repl_comment"));
				System.out.println(dto.getRepl_comment());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		
		return dto;
	}
	
	
	
}
