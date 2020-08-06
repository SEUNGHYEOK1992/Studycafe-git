package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public MemberDAO() {
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

	public boolean login(String id, String pw) {
		String sql = "SELECT id FROM memberList WHERE id=? AND pw=?";
		boolean success = false;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs=ps.executeQuery();
			success = rs.next();
			//System.out.println("success : " +success); // 확인
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return success;
	}

	public boolean join(String id, String pw, String name, String birth, String email, String phone, String addr) {
		String sql ="INSERT INTO memberList(id,idx,pw,name,birth,email,phone,addr) VALUES(?,memberList_seq.NEXTVAL,?,?,?,?,?,?)";
		boolean success = false;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setString(4, birth);
			ps.setString(5, email);
			ps.setString(6, phone);
			ps.setString(7, addr);
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

	public boolean overlay(String id) {
		boolean success =false;
		String sql="SELECT id FROM memberList WHERE id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			success = rs.next();
			System.out.println("success : " + success); // 4차 확인
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return success;
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
