package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.FreeBoardDTO;

public class FreeBoardDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public FreeBoardDAO() {
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

	public ArrayList<FreeBoardDTO> fbList(int page) {
		int pagePerCnt = 10; // 페이지 당 보여줄 게시물의 수
		int end = page * pagePerCnt;
		int start = (end-pagePerCnt)+1;
		ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
		
		String sql="select rnum, b_idx, id, subject, content, reg_date, bHit FROM(SELECT ROW_NUMBER() "
				+ "OVER(ORDER BY b_idx DESC) AS rnum, b_idx, id, subject, content, reg_date, bHit "
				+ "FROM bbs WHERE category=0) WHERE rnum BETWEEN ? AND ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				dto.setB_idx(rs.getInt("b_idx"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setbHit(rs.getInt("bHit"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return list;
	}

	public FreeBoardDTO fbdetail(int b_idx) {
		String sql="SELECT b.b_idx, b.subject, b.id, b.bHit, b.reg_date, b.content, p.oriFileName, p.newFileName "
				+ "FROM bbs b, photo p WHERE b.b_idx=p.b_idx(+) AND b.b_idx=?";
		FreeBoardDTO dto = new FreeBoardDTO();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new FreeBoardDTO();
				dto.setB_idx(rs.getInt("b_idx"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setSubject(rs.getString("subject"));
				dto.setbHit(rs.getInt("bHit"));
				dto.setOriFileName(rs.getString("oriFileName"));
				dto.setNewFileName(rs.getString("newFileName"));
				upHit(b_idx);
			}
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
			resClose();
		}
		return dto;
	}

	private void upHit(int b_idx) {
		String sql = "UPDATE bbs SET bHit = bHit+1 WHERE b_idx=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public long fbwrite(FreeBoardDTO dto, String id) {
		String sql="INSERT INTO bbs(b_idx, id, subject, content, category) "
				+ "VALUES(bbs_seq.NEXTVAL, ?,?,?,0)";
		long pk =0;
		try {
			ps = conn.prepareStatement(sql,new String[] {"b_idx"});
			ps.setString(1, id);
			ps.setString(2, dto.getSubject());
			ps.setString(3, dto.getContent());
			ps.executeUpdate();
			//System.out.println("success : " + ps.executeUpdate());
			rs = ps.getGeneratedKeys();
			
			if(rs.next()) {
				pk = rs.getLong(1);
				//System.out.println("b_idx : " +pk);
				
				if(dto.getOriFileName() != null) {
					sql ="INSERT INTO photo(f_idx,id,b_idx,oriFileName,newFileName,file_category) "
							+ "VALUES(photo_seq.NEXTVAL, ?, ?, ?, ?, 0)";
					ps = conn.prepareStatement(sql);
					ps.setString(1, id);
					ps.setLong(2, pk);
					ps.setString(3, dto.getOriFileName());
					ps.setString(4, dto.getNewFileName());
					ps.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			resClose();
			//System.out.println("dao 들어오고 반납되기 전 pk 값 : " + pk);
		}
		return pk;
	}

	public boolean fbUpdate(FreeBoardDTO dto, int b_idx) {
		String sql="UPDATE bbs SET subject=?, content=?, reg_date=SYSDATE WHERE b_idx=?";
		boolean success = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			ps.setInt(3, b_idx);
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

	public int fbDelete(int b_idx) {
		String sql = "DELETE FROM bbs WHERE b_idx=?";
		int success =0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			success = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			resClose();
		}
		return success;
	}
	
	
	
}
