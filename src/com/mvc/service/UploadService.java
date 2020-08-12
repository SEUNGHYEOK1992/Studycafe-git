package com.mvc.service;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.mvc.dto.AdminDTO;
import com.mvc.dto.FreeBoardDTO;
import com.oreilly.servlet.MultipartRequest;

public class UploadService {
	
	HttpServletRequest req = null;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public UploadService(HttpServletRequest req) {
		this.req = req;
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
	
	// 파일 업로드 수행
	public AdminDTO regist() {
		String savePath = "C:/upload/"; // 저장경로
		int maxSize = 10*1024*1024; // 용량 제한
		String oriFileName = "";
		String newFileName ="";
		AdminDTO dto = new AdminDTO(); // 파일 저장할 때 이름은 두 개 반환 시키는데 리턴은 1개만 되므로 DTO 사용
		
		try {
			MultipartRequest multi = new MultipartRequest(req,savePath,maxSize,"UTF-8"); // 파일저장
			dto.setId(multi.getParameter("id"));
			dto.setName(multi.getParameter("name"));
			dto.setBirth(multi.getParameter("birth"));
			dto.setEmail(multi.getParameter("email"));
			dto.setAddr(multi.getParameter("addr"));
			dto.setPhone(multi.getParameter("phone"));
			
			// 파일명 변경
			oriFileName = multi.getFilesystemName("photo");
			if(oriFileName != null) {
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				newFileName = System.currentTimeMillis() + ext; // 새 파일명 생성
				
				File oldFile = new File(savePath+oriFileName);
				File newFile = new File(savePath+newFileName);
				oldFile.renameTo(newFile); // 파일명 변경
				dto.setOriFileName(oriFileName);
				dto.setNewFileName(newFileName);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return dto;
	}
	/*
	public int getf_idx(String id) {
		String sql="SELECT f_idx FROM photo WHERE id=? AND file_category=1";
		int f_idx = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				f_idx = rs.getInt("f_idx");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return f_idx;
	}
	*/
	public AdminDTO getFileName(String id) {
		String newFileName = null;
		String oriFileName = null;
		AdminDTO dto = new AdminDTO();
		String sql ="SELECT oriFileName, newFileName FROM photo WHERE id=? AND file_category=1";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setOriFileName(rs.getString("oriFileName"));
				dto.setNewFileName(rs.getString("newFileName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return dto;
	}

	public void updateFileName(String prevFileName,String prevOriF,String orif, String newFileName, String id) {
		String sql="";
		try {
			if(prevFileName != null) { // 기존 파일이 있는 경우 (UPDATE)
				sql="UPDATE photo SET oriFileName =?, newFileName =? WHERE id=? AND file_category=1";
				ps = conn.prepareStatement(sql);
				ps.setString(1, orif);
				ps.setString(2, newFileName);
				ps.setString(3, id);
			}else { // 기존 파일이 없는 경우 (INSERT)
				sql="INSERT INTO photo(f_idx,id,oriFileName,newFileName,file_category) "
						+"VALUES(photo_seq.NEXTVAL,?,?,?,1)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, orif);
				ps.setString(3, newFileName);
			}
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		
	}

	public void delete(String prevFileName) {
		File file = new File("C:/upload/"+prevFileName);
		boolean success = false;
		
		if(file.exists()) { // 파일이 존재한다면
			success = file.delete();
			//System.out.println("삭제된 파일 이름 : "+prevFileName);
			//System.out.println("파일삭제 성공 여부 : " + success);
		}
	}

	public FreeBoardDTO bbs_regist() {
		String savePath ="C:/upload/"; // 저장 경로
		int maxSize = 10*1024*1024;
		String oriFileName="";
		String newFileName="";
		
		FreeBoardDTO dto = new FreeBoardDTO();
		try {
			MultipartRequest multi = new MultipartRequest(req,savePath,maxSize,"UTF-8");
			dto.setSubject(multi.getParameter("subject"));
			dto.setContent(multi.getParameter("content"));
			
			// 파일명 변경
			oriFileName = multi.getFilesystemName("photo");
			if(oriFileName != null) { // 업로드 파일이 있다면
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				newFileName = System.currentTimeMillis()+ext; // 새 파일명
				
				File oldFile = new File(savePath+oriFileName);
				File newFile = new File(savePath+newFileName);
				oldFile.renameTo(newFile);
				dto.setOriFileName(oriFileName);
				dto.setNewFileName(newFileName);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return dto;
	}

	public FreeBoardDTO bbs_getFileName(int b_idx) {
		String newFileName = null;
		String oriFileName = null;
		FreeBoardDTO dto = new FreeBoardDTO();
		String sql="SELECT oriFileName ,newFileName FROM photo WHERE b_idx=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_idx);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setOriFileName(rs.getString("oriFileName"));
				dto.setNewFileName(rs.getString("newFileName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return dto;
	}

	public void bbs_updateFileName(String prevNewf, int b_idx, String orif, String newf, String id) {
		String sql="";
		try {
			if(prevNewf != null) { // 기존 파일이 있을경우 UPDATE
				sql ="UPDATE photo SET oriFileName=?, newFileName=? WHERE b_idx=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, orif);
				ps.setString(2, newf);
				ps.setInt(3, b_idx);
			}else { // 기존 파일이 없을 경우 INSERT
				sql ="INSERT INTO photo(f_idx, id, b_idx, oriFileName, newFileName, file_category) "
						+ "VALUES(photo_seq.NEXTVAL,?,?,?,?,0)";
				
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setInt(2, b_idx);
				ps.setString(3, orif);
				ps.setString(4, newf);
			}
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
	}
	
}
