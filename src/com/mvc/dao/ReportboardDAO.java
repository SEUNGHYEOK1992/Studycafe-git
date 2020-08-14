package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.ReportboardDTO;

public class ReportboardDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ReportboardDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<ReportboardDTO> list() {
		String sql = "SELECT b_idx, id, subject, reg_date, bHit FROM bbs WHERE id='admin' AND category IN(0 ,1) ORDER BY b_idx DESC";
		ArrayList<ReportboardDTO> list = new ArrayList<ReportboardDTO>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				ReportboardDTO dto = new ReportboardDTO();
				dto.setB_idx(rs.getInt("b_idx"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setbHit(rs.getInt("bHit"));
				list.add(dto);
			}
			//System.out.println("reportboard dto 받아왓나?");
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

	public Object reportdetail(int b_idx) {
		String sql = "SELECT b_idx, id, subject, content, reg_date FROM bbs WHERE b_idx=?";
		ReportboardDTO dto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new ReportboardDTO();
				dto.setB_idx(rs.getInt("b_idx"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getDate("reg_date"));
			}System.out.println("report dto 받아옴 2");
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			resClose();
		}
		return dto;
	}

}
