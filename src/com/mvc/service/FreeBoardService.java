package com.mvc.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.FreeBoardDAO;
import com.mvc.dto.FreeBoardDTO;

public class FreeBoardService {

	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	RequestDispatcher dis = null;
	
	public FreeBoardService(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}

	public ArrayList<FreeBoardDTO> fbList(int page) {
		FreeBoardDAO dao = new FreeBoardDAO();
		return dao.fbList(page);
	}

	public void fbdetail() throws ServletException, IOException {
		//System.out.println("서비스 들어왔음");
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		String id = (String) req.getSession().getAttribute("id");
		//System.out.println(b_idx);
		FreeBoardDAO dao = new FreeBoardDAO();
		FreeBoardDTO dto =dao.fbdetail(b_idx);
		String uploadPath = "/photo/"+dto.getNewFileName();
		//System.out.println(dto.getB_idx());
		req.setAttribute("path", uploadPath);
		req.setAttribute("bbs",dto);
		if(id==null) {
			String msg = "로그인여부를 확인해주세요.";
			req.setAttribute("msg", msg);
			RequestDispatcher dis = req.getRequestDispatcher("member01_login.jsp");
			dis.forward(req, resp);
		}
		RequestDispatcher dis = req.getRequestDispatcher("freeBoard02_Detail.jsp");
		dis.forward(req, resp);
		
	}

	public long fbwrite(){
		UploadService upload = new UploadService(req);
		FreeBoardDAO dao = new FreeBoardDAO();
		// 파일 업로드
		FreeBoardDTO dto = upload.bbs_regist();
		// 로그인 ID 값 받아오기
		String id = (String)req.getSession().getAttribute("id");
		//System.out.println(id);
		//System.out.println(dto.getSubject());
		//System.out.println(dto.getContent());
		//System.out.println("서비스 들어오고 dao 들어가기 전");
		return dao.fbwrite(dto,id);
	}

	public FreeBoardDTO fbUpdateForm() {
		FreeBoardDAO dao = new FreeBoardDAO();
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		FreeBoardDTO dto = dao.fbdetail(b_idx);
		//System.out.println(dto.getB_idx());
		return dto;
	}

	public void fbUpdate() throws IOException {
		// 업로드 부분
		UploadService upload = new UploadService(req);
		FreeBoardDTO dto = upload.bbs_regist();
		
		// 파라메터 값 받아오기
		String id = (String)req.getSession().getAttribute("id");
		String orif = dto.getOriFileName();
		String newf = dto.getNewFileName();
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		//System.out.println(id);
		//System.out.println(b_idx);
		//System.out.println(orif + " / " + newf);
		
		// 게시글 수정 부분
		FreeBoardDAO dao = new FreeBoardDAO();
		dao.fbUpdate(dto,b_idx);
		
		if(dto.getNewFileName() != null) { // 업로드 내용이 있으면
			upload = new UploadService(req);
			FreeBoardDTO dto2 = new FreeBoardDTO();
			// 수정 하기 전 파일이 있으면 전의 이름 값들 받아오고 없다면 null 이 올 것임
			dto2 = upload.bbs_getFileName(b_idx);
			String prevOrif = dto2.getOriFileName();
			String prevNewf = dto2.getNewFileName();
			
			// 이전 파일 이름들 -> 새 파일 이름들
			upload = new UploadService(req);
			upload.bbs_updateFileName(prevNewf,b_idx,orif,newf,id);
			upload.delete(prevNewf);
		}
		resp.sendRedirect("fbdetail?b_idx="+b_idx);
	
	}

	public void fbDelete() throws IOException {
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		FreeBoardDAO dao = new FreeBoardDAO();
		UploadService upload = new UploadService(req);
		FreeBoardDTO dto = upload.bbs_getFileName(b_idx);
		String fileName = dto.getNewFileName(); // 파일명 추출해서 fileName에 담기
		
		int success = dao.fbDelete(b_idx); // bbs에서 쿼리 삭제문
		if(success>0 && fileName != null){
			//System.out.println("파일 삭제");
			upload.delete(fileName);
		}
		resp.sendRedirect("fbList");
	}

	public boolean fbLike() {
		boolean success = false;
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		//System.out.println("서비스에서 확인 값 : " + b_idx);
		String id = (String)req.getSession().getAttribute("id");
		FreeBoardDAO dao = new FreeBoardDAO();
		//System.out.println(dto.getId());
		//System.out.println(id);
		if(!dao.fbLike(b_idx,id)) {
			dao = new FreeBoardDAO();
			success = dao.fbLikeInUp(b_idx,id);
		}
		return success;
	}

	public FreeBoardDTO fblikeCall() {
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		String id = req.getParameter("id");
		//System.out.println(b_idx + "/ " + id);
		FreeBoardDAO dao = new FreeBoardDAO();
		return dao.fblikeCall(b_idx,id);
	}

	public boolean fbDisLike() {
		boolean success = false;
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		String id = (String)req.getSession().getAttribute("id");
		//System.out.println(b_idx +"/"+id);
		FreeBoardDAO dao = new FreeBoardDAO();
		if(!dao.fbDisLike(b_idx,id)) {
			dao = new FreeBoardDAO();
			success = dao.fbDisLikeInUp(b_idx,id);
		}
		return success;
	}

	public FreeBoardDTO fbdisLikeCall() {
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		String id = req.getParameter("id");
		//System.out.println(b_idx + " / " + id);
		FreeBoardDAO dao = new FreeBoardDAO();
		return dao.fbdisLikeCall(b_idx,id);
	}

	public boolean reportChk() {
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		String repo_id = (String)req.getSession().getAttribute("id");
		//System.out.println(b_idx + " / " + id );
		FreeBoardDAO dao = new FreeBoardDAO();
		return dao.reportChk(b_idx,repo_id);
	}
	
	public boolean complain() {
		String comp = req.getParameter("report");
		int b_idx = Integer.parseInt(req.getParameter("b_idx"));
		String b_id = req.getParameter("b_id");
		String repo_id = req.getParameter("repo_id");
		//System.out.println(comp + "/ " + b_idx +" / " + b_id + " / " + repo_id);
		FreeBoardDAO dao = new FreeBoardDAO();
		return dao.complain(b_idx,b_id,repo_id,comp);
	}
}
