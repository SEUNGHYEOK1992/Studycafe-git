package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.sql.DataSource;

import com.mvc.dto.ComplainDTO;
import com.mvc.dto.FreeBoardDTO;
import com.mvc.dto.ReplyDTO;

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

		

public ArrayList<ReplyDTO> list(int b_idx) {
	String sql;
	ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();		
	
	try {
		sql = "SELECT * FROM REPLY WHERE b_idx=? ORDER BY repl_idx DESC ";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, b_idx);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			ReplyDTO dto = new ReplyDTO();
			dto.setB_idx(rs.getInt("b_idx"));
			//System.out.println(dto.getB_idx());
			dto.setId(rs.getString("id"));
			//System.out.println(dto.getId());
			dto.setRepl_idx(rs.getString("repl_idx"));
			//System.out.println(dto.getRepl_idx());
			dto.setRepl_comment(rs.getString("repl_comment"));
			//System.out.println(dto.getRepl_comment());
			list.add(dto);
		}
		//System.out.println("dto받앗니");
					
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		resClose();
	}
	return list;
}
						

	/*충돌*/
	public boolean fbLike(int b_idx, String id) {
		String sql ="SELECT id FROM recommend WHERE b_idx=? AND id=?";
		boolean success =false;
		FreeBoardDTO dto = new FreeBoardDTO();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			ps.setString(2, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				success = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}

		//return list;

		return success;
	}
	
	public boolean fbLikeInUp(int b_idx, String id) {
		String sql="INSERT INTO recommend(b_idx, id) VALUES(?, ?)";
		boolean success =false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			ps.setString(2, id);
			if(ps.executeUpdate()>0) {
				success = true;
				upLike(b_idx,id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return success;
	}
	
	private void upLike(int b_idx, String id) {
		String sql = "UPDATE recommend SET like_count = 1 WHERE b_idx=? AND id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			ps.setString(2, id);
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public FreeBoardDTO fblikeCall(int b_idx, String id) {
		String sql="select count(like_count) FROM recommend WHERE b_idx = ?";
		FreeBoardDTO dto = new FreeBoardDTO();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setLike_count(rs.getInt("count(like_count)"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return dto;
	}

	public boolean fbDisLike(int b_idx, String id) {
		String sql = "SELECT id FROM recommend WHERE b_idx=? AND id=?";
		boolean success =false;
		FreeBoardDTO dto = new FreeBoardDTO();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			ps.setString(2, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				success = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return success;
	}

	/*충돌*/
	public boolean fbDisLikeInUp(int b_idx, String id) {
		String sql="INSERT INTO recommend(b_idx, id) VALUES(?, ?)";
		boolean success =false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			ps.setString(2, id);
			if(ps.executeUpdate()>0) {
				success = true;
				disupLike(b_idx,id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return success;

	}
	
	private void disupLike(int b_idx, String id) {
		String sql = "UPDATE recommend SET dis_count = 1 WHERE b_idx=? AND id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			ps.setString(2, id);
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public FreeBoardDTO fbdisLikeCall(int b_idx, String id) {
		String sql="select count(dis_count) FROM recommend WHERE b_idx = ?";
		FreeBoardDTO dto = new FreeBoardDTO();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setDis_count(rs.getInt("count(dis_count)"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return dto;
	}

	public boolean reportChk(int b_idx, String repo_id) {
		String sql = "SELECT repo_idx FROM report WHERE b_idx=? AND repo_id=?";
		boolean success =false;
		ComplainDTO dto = new ComplainDTO();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			ps.setString(2, repo_id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setRepo_idx(rs.getInt("repo_idx"));
				success = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return success;
	}

	public boolean complain(int b_idx, String b_id, String repo_id, String comp) {
		String sql="INSERT INTO report(repo_idx,b_idx,b_id,repo_id,repo_content) VALUES(report_seq.NEXTVAL,?,?,?,?)";
		boolean success =false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			ps.setString(2, b_id);
			ps.setString(3, repo_id);
			ps.setString(4, comp);
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

	public ArrayList<FreeBoardDTO> popList() {
		String sql = "select rnum, b_idx, id, subject, bHit from(select ROW_NUMBER() OVER(ORDER BY bHit DESC) AS rnum, "
					+ "b_idx, id, subject, bHit FROM bbs) WHERE rnum BETWEEN 1 AND 5";
		ArrayList<FreeBoardDTO> poplist = new ArrayList<FreeBoardDTO>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setbHit(rs.getInt("bHit"));
				dto.setB_idx(rs.getInt("b_idx"));
				poplist.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
	  return poplist;

	}

	public int pcfbList() {
		String sql="select count(*) as totalCount from bbs where category=0";
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
	
