package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.MessageDTO;

public class MessageDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public MessageDAO() {
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

	public ArrayList<MessageDTO> messageList(String id, int page) {
		
		int pagePerCnt = 10; // 페이지 당 보여줄 게시물의 수
		int end = page * pagePerCnt;
		int start = (end-pagePerCnt)+1;
		
		String sql = "SELECT rnum, m_idx, send_id, mess_content, mess_reg_date "
				+ "FROM (SELECT ROW_NUMBER() OVER(ORDER BY m_idx DESC) AS rnum, "
				+ "m_idx, send_id, mess_content, mess_reg_date FROM message WHERE recv_id=?) "
				+ "WHERE rnum BETWEEN ? AND ?";
		ArrayList<MessageDTO> list = new ArrayList<MessageDTO>();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, start);
			ps.setInt(3, end);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				MessageDTO dto = new MessageDTO();
				dto.setM_idx(rs.getInt("m_idx"));
				dto.setSend_id(rs.getString("send_id"));
				dto.setMess_content(rs.getString("mess_content"));
				dto.setMess_reg_date(rs.getDate("mess_reg_date"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return list;
	}

	public MessageDTO messageDetail(int m_idx) {
		String sql="SELECT m_idx, send_id, mess_reg_date, mess_content FROM message where m_idx=?";
		MessageDTO dto = null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, m_idx);
			rs=ps.executeQuery();
			while(rs.next()) {
				dto = new MessageDTO();
				dto.setM_idx(rs.getInt("m_idx"));
				dto.setSend_id(rs.getString("send_id"));
				dto.setMess_reg_date(rs.getDate("mess_reg_date"));
				dto.setMess_content(rs.getString("mess_content"));
				changeMsg(dto.getM_idx());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return dto;
		
	}
	
	private void changeMsg(int m_idx) {
		String sql="UPDATE message SET mess_chk = 'T' WHERE m_idx=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, m_idx);
			int success = ps.executeUpdate();
			//System.out.println("업데이트 성공 여부 : " + success);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MessageDTO> falseMsg(String id, int page) {
		int pagePerCnt = 10; // 페이지 당 보여줄 게시물의 수
		int end = page * pagePerCnt;
		int start = (end-pagePerCnt)+1;
		
		String sql = "SELECT rnum, m_idx, send_id, mess_content, mess_reg_date "
				+ "FROM (SELECT ROW_NUMBER() OVER(ORDER BY m_idx DESC) AS rnum, "
				+ "m_idx, send_id, mess_content, mess_reg_date FROM message WHERE recv_id=? AND mess_chk='F') "
				+ "WHERE rnum BETWEEN ? AND ?";
		ArrayList<MessageDTO> list = new ArrayList<MessageDTO>();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, start);
			ps.setInt(3, end);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				MessageDTO dto = new MessageDTO();
				dto.setM_idx(rs.getInt("m_idx"));
				dto.setSend_id(rs.getString("send_id"));
				dto.setMess_content(rs.getString("mess_content"));
				dto.setMess_reg_date(rs.getDate("mess_reg_date"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return list;
	}

	public boolean messageSend(String send_id, String recv_id, String formtext) {
		String sql ="INSERT INTO message(m_idx,send_id,recv_id,mess_content) VALUES(message_seq.NEXTVAL,?,?,?)";
		boolean success =false;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, send_id);
			ps.setString(2, recv_id);
			ps.setString(3, formtext);
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

	public boolean msgIdChk(String id) {
		String sql="SELECT id FROM memberList WHERE id=?";
		boolean success = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			success = rs.next();
			//System.out.println("success 확인 : " +success);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return success;
	}

	public ArrayList<MessageDTO> sendList(String id, int page) {
		int pagePerCnt = 10; // 페이지 당 보여줄 게시물의 수
		int end = page * pagePerCnt;
		int start = (end-pagePerCnt)+1;
		
		String sql ="SELECT rnum, m_idx, recv_id, mess_content, mess_reg_date " + 
				"FROM (SELECT ROW_NUMBER() OVER(ORDER BY m_idx DESC) AS rnum, " + 
				"m_idx, recv_id, mess_content, mess_reg_date FROM message WHERE send_id=?) " + 
				"WHERE rnum BETWEEN ? AND ?";
		ArrayList<MessageDTO> list = new ArrayList<MessageDTO>();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs=ps.executeQuery();
			while(rs.next()) {
				MessageDTO dto = new MessageDTO();
				dto.setM_idx(rs.getInt("m_idx"));
				dto.setRecv_id(rs.getString("recv_id"));
				dto.setMess_content(rs.getString("mess_content"));
				dto.setMess_reg_date(rs.getDate("mess_reg_date"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return list;
	}

	public MessageDTO sendDetail(int m_idx) {
		String sql="SELECT m_idx, recv_id, mess_reg_date, mess_content FROM message where m_idx=?";
		MessageDTO dto = null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, m_idx);
			rs=ps.executeQuery();
			while(rs.next()) {
				dto = new MessageDTO();
				dto.setM_idx(rs.getInt("m_idx"));
				dto.setRecv_id(rs.getString("recv_id"));
				dto.setMess_reg_date(rs.getDate("mess_reg_date"));
				dto.setMess_content(rs.getString("mess_content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return dto;
	}

	public int msgDel(String[] delList) {
		String sql = "DELETE FROM message WHERE m_idx=?";
		int delCount=0;
		try {
			ps=conn.prepareStatement(sql);
			for(String del : delList) {
				//System.out.println("삭제할 글 번호 : " +del);
				ps.setString(1, del);
				delCount += ps.executeUpdate();
			}
			//System.out.println("삭제 성공 수 : " +delCount);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return delCount;
	}

	
	
}
