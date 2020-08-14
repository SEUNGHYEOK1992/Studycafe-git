package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvc.dto.FreeBoardDTO;
import com.mvc.service.FreeBoardService;

import com.mvc.service.ReplyService;
@WebServlet({"/fbList","/fbdetail","/fbwrite","/fbUpdateForm","/fbUpdate","/fbDelete","/rpwrite","/rpdel","/rpupdateForm","/fbLike","/fblikeCall",
	"/fbDisLike","/fbdisLikeCall","/reportChk","/complain","/popList"})

public class FreeBoardContoller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String ctx = req.getContextPath();
		String reqAddr = uri.substring(ctx.length());
		req.setCharacterEncoding("utf-8");
		
		RequestDispatcher dis = null;
		ReplyService rpservice = new ReplyService(req, resp);
		FreeBoardService service = new FreeBoardService(req,resp);
		switch(reqAddr) {
			case "/fbList":
				String pageParam = req.getParameter("page");
				int page = 1;
				if(pageParam != null) {
					page = Integer.parseInt(pageParam);
				}
				//System.out.println("fblist 요청");
				ArrayList<FreeBoardDTO> list = null;
				list = service.fbList(page);
				req.setAttribute("list", list);
				req.setAttribute("currPage", page);
				dis = req.getRequestDispatcher("freeBoard01_List.jsp");
				dis.forward(req, resp);
			break;
			
			case "/fbdetail":
				service.fbdetail();
			break;
			
			case "/fbwrite":
				//System.out.println("작성페이지 이동");
				long pk = service.fbwrite();
				if(pk>0) {
					dis = req.getRequestDispatcher("fbdetail?b_idx="+pk);
					dis.forward(req, resp);
				}
			break;
			
			case "/fbUpdateForm":
				//System.out.println("업데이트 폼");
				req.setAttribute("bbsUp", service.fbUpdateForm());
				dis = req.getRequestDispatcher("freeBoard04_UpdateForm.jsp");
				dis.forward(req, resp);
			break;
			
			case "/fbUpdate":
				//System.out.println("수정 폼 ");
				//System.out.println(req.getParameter("b_idx"));
				service.fbUpdate();
			break;
			
			case "/fbDelete":
				//System.out.println("삭제 요청");
				service.fbDelete();
			break;
			

			//여기서 댓글 작성 줘볼게
			case"/rpwrite":
				System.out.println();
				//System.out.println("여기야 여기~~~~~~~~~~ : " +req.getParameter("b_idx"));
				rpservice.rpwrite();
			break;
			
			//이건 댓글 삭제
			case"/rpdel":
				//System.out.println("댓글 삭제");
				rpservice.rpdel();
			break;
			
			case"/rpupdateForm":
				System.out.println("댓글 수정 폼");
				//System.out.println(req.getParameter("repl_idx"));
				//System.out.println(req.getParameter("repl_comment"));
				//System.out.println(req.getParameter("b_idx"));
				String b_idx = req.getParameter("b_idx");
				boolean success = false;
				success = rpservice.rpupdateForm();
				String msg = "댓글 수정 실패";
				if(success) {
					msg = "수정 성공";
				}
				req.setAttribute("msg", msg);
				dis = req.getRequestDispatcher("fbdetail?b_idx="+b_idx);
				dis.forward(req, resp);
				break;
				
				/*충돌*/
			case "/fbLike":
				//System.out.println("추천 들어옴");
				//System.out.println(req.getParameter("b_idx"));
				success = false;
				success =service.fbLike();
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("like",success);
				Gson gson = new Gson();
				String obj = gson.toJson(map);
				resp.getWriter().println(obj);
			break;
			
			case "/fblikeCall":
				//System.out.println("라이크 콜 등장");
				map = new HashMap<String, Object>();
				FreeBoardDTO dto = new FreeBoardDTO();
				dto = service.fblikeCall();
				map.put("call",dto.getLike_count());
				gson = new Gson();
				obj = gson.toJson(map);
				resp.getWriter().println(obj);
			break;
			
			case "/fbDisLike":
				//System.out.println("싫어요 들어옴 ");
				//System.out.println(req.getParameter("b_idx"));
				success =false;
				success = service.fbDisLike();
				map = new HashMap<String, Object>();
				map.put("disLike",success);
				gson = new Gson();
				obj = gson.toJson(map);
				resp.getWriter().println(obj);
			break;
			
			case "/fbdisLikeCall":
				//System.out.println("싫어요 콜 ");
				map = new HashMap<String, Object>();
				dto = new FreeBoardDTO();
				dto = service.fbdisLikeCall();
				map.put("discall",dto.getDis_count());
				gson = new Gson();
				obj = gson.toJson(map);
				resp.getWriter().println(obj);
			break;
			
			case "/reportChk":
				//System.out.println("신고 체크");
				success = false;
				success = service.reportChk();
				map = new HashMap<String, Object>();
				map.put("reportChk",success);
				gson = new Gson();
				obj = gson.toJson(map);
				resp.getWriter().println(obj);
			break;
			
			/*충돌*/
			case "/complain":
				//System.out.println("컴플레인 등장");
				  b_idx =req.getParameter("b_idx");
				success = service.complain();
				msg = "신고 내용을 선택해주세요";
				String pageMove ="Complain01.jsp";
				if(success) {
					msg = "신고가 접수 되었습니다.";
					pageMove = "fbdetail?b_idx="+b_idx;
				}
				req.setAttribute("msg", msg);
				dis = req.getRequestDispatcher(pageMove);
				dis.forward(req, resp);
			break;
			
			case "/popList":
				//System.out.println("인기차트");
				list = new ArrayList<FreeBoardDTO>();
				list = service.popList();
				map = new HashMap<String, Object>();
				map.put("popList",list);
				gson = new Gson();
				obj = gson.toJson(map);
				resp.setContentType("text/html;charset=UTF-8");
				resp.getWriter().println(obj);
			break;

			
		}
	}
	
}
