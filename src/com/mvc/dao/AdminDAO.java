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
import com.mvc.dto.BlackDTO;
import com.mvc.dto.ComplainDTO;
import com.mvc.dto.KickDTO;

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

	public ArrayList<AdminDTO> memberList(int page) {
		
		int pagePerCnt = 10; // 페이지 당 보여줄 게시물의 수
		int end = page * pagePerCnt;
		int start = (end-pagePerCnt)+1;
		
		ArrayList<AdminDTO> list = new ArrayList<AdminDTO>();
		String sql = "SELECT rnum, idx, id, name FROM (SELECT ROW_NUMBER() OVER(ORDER BY idx ASC) AS rnum,"
				+ " idx, id, name FROM memberList) WHERE rnum BETWEEN ? AND ?";
		//String sql = "Select idx, id, name FROM memberList ORDER BY idx";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
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

	public AdminDTO detail(String id) {
		String sql = "select id, name, birth, email, phone, addr, blacklist FROM memberlist WHERE id=?";
		AdminDTO dto = null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			while(rs.next()) {
				dto = new AdminDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddr(rs.getString("addr"));
				dto.setBlacklist(rs.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return dto;
	}

	public boolean update(String id, String name, String birth, String email, String phone, String addr, String blacklist) {
		String sql="UPDATE memberList SET name=?, birth=?, email=?, phone=?, addr=?, blacklist=? WHERE id=?";
		boolean success = false;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, birth);
			ps.setString(3, email);
			ps.setString(4, phone);
			ps.setString(5, addr);
			ps.setString(6, blacklist);
			ps.setString(7, id);
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

	public ArrayList<ComplainDTO> report(int page) {
		int pagePerCnt = 10; // 페이지 당 보여줄 게시물의 수
		int end = page * pagePerCnt;
		int start = (end-pagePerCnt)+1;
		
		ArrayList<ComplainDTO> list = new ArrayList<ComplainDTO>();
		String sql = "SELECT rnum, repo_idx, b_idx, b_id, repo_content, repo_reg_date, repo_id "
				+ "FROM (SELECT ROW_NUMBER() OVER(ORDER BY repo_idx DESC) AS rnum,"
				+ " repo_idx, b_idx, b_id, repo_content, repo_reg_date, repo_id FROM report) WHERE rnum BETWEEN ? AND ?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				ComplainDTO dto = new ComplainDTO();
				dto.setRepo_idx(rs.getInt("repo_idx"));
				dto.setB_idx(rs.getInt("b_idx"));
				dto.setB_id(rs.getString("b_id"));
				dto.setRepo_content(rs.getString("repo_content"));
				dto.setRepo_reg_date(rs.getDate("repo_reg_date"));
				dto.setRepo_id(rs.getString("repo_id"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return list;
	}

	public ArrayList<BlackDTO> blackList(int page) {
		int pagePerCnt = 10; // 페이지 당 보여줄 게시물의 수
		int end = page * pagePerCnt;
		int start = (end-pagePerCnt)+1;
		ArrayList<BlackDTO> list = new ArrayList<BlackDTO>();
		String sql = "SELECT rnum, idx, id, repo_content FROM " 
				+ "(select row_number() OVER (PARTITION BY m.id ORDER BY m.idx ASC) AS rnum, m.idx, m.id, r.repo_content "
				+ "FROM memberList m, report r WHERE m.id=r.b_id(+) AND m.blacklist='T') WHERE rnum=1 AND rnum BETWEEN ? AND ?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			while(rs.next()) {
				BlackDTO dto = new BlackDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setId(rs.getString("id"));
				dto.setRepo_content(rs.getString("repo_content"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return list;
	}

	public ArrayList<KickDTO> kick(int page) {
		int pagePerCnt = 10; // 페이지 당 보여줄 게시물의 수
		int end = page * pagePerCnt;
		int start = (end-pagePerCnt)+1;
		ArrayList<KickDTO> list = new ArrayList<KickDTO>();
		String sql = "select rnum, k_idx, id, cause FROM(SELECT ROW_NUMBER() OVER(ORDER BY k_idx ASC) AS rnum, "
				+ "k_idx, id, cause FROM kick) WHERE rnum BETWEEN ? AND ?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			while(rs.next()) {
				KickDTO dto = new KickDTO();
				dto.setK_idx(rs.getInt("k_idx"));
				dto.setId(rs.getString("id"));
				dto.setCause(rs.getString("cause"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return list;
	}

	public boolean delete(String id) {
		//System.out.println("dao 까지 들어왔음.");
		String sql = "delete from memberList where id=?";
		boolean success = false;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			if(ps.executeUpdate()>0) {
				success = true;
			}
		} catch (SQLException e) {
		}finally {
			resClose();
		}
		//System.out.println("success 값 1차 확인 : " + success);
		return success;
	}

	public boolean kickAdd(String id, String cause) {
		String sql="INSERT INTO kick(k_idx, id, cause) VALUES(kick_seq.nextval,?,?)";
		boolean success = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, cause);
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

	public int pcMember() {
		String sql ="select count(*) as totalCount from memberList";
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

	public int pcReport() {
		String sql ="select count(*) as totalCount from report";
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

	public int pcBlack() {
		String sql ="select count(*) as totalCount from memberList where blacklist='T'";
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

	public int pcKick() {
		String sql ="select count(*) as totalCount from kick";
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
