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
	
	public ArrayList<ReportboardDTO> list(int page) {
		int pagePerCnt = 10; // 페이지 당 보여줄 게시물의 수
		int end = page * pagePerCnt;
		int start = (end-pagePerCnt)+1;
		String sql = "SELECT rnum, b_idx, id, subject, reg_date, bHit FROM(SELECT ROW_NUMBER() OVER(ORDER BY b_idx DESC) AS rnum, " 
				+"b_idx, id, subject, reg_date, bHit FROM bbs WHERE id='admin' AND category IN(0 ,1)) WHERE rnum BETWEEN ? AND ?";
		ArrayList<ReportboardDTO> list = new ArrayList<ReportboardDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
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

	public ReportboardDTO reportdetail(int b_idx) {
		String sql = "SELECT b_idx, id, subject, content, reg_date, category FROM bbs WHERE b_idx=?";
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
				dto.setCategory(rs.getInt("category"));
			}
			//System.out.println("report dto 받아옴 2");
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			resClose();
		}
		return dto;
	}

	public int pcrepoList() {
		String sql="select count(*) as totalCount from bbs where category IN(0,1) AND id='admin'";
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
