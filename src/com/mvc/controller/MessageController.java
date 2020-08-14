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
import com.mvc.dto.MessageDTO;
import com.mvc.service.MessageService;

@WebServlet({"/messageList","/messageDetail","/falseMsg","/messageSend",
	"/msgIdChk","/sendList","/sendDetail","/msgDel"})
public class MessageController extends HttpServlet {

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
		MessageService service = new MessageService(req,resp);
		
		switch(reqAddr) {
			case "/messageList":
				//System.out.println("메시지 요청");
				//String id = (String) req.getSession().getAttribute("id");
				//System.out.println(id);
				String pageParam = req.getParameter("page");
				int page = 1;
				if(pageParam != null) {
					page = Integer.parseInt(pageParam);
				}
				int totCount = service.pcMessageList();
				int listCount =10;
				int totPage = totCount/listCount;
				if(totCount % listCount > 0 ) {
					totPage ++;
				}
				ArrayList<MessageDTO> list = null;
				list = service.messageList(page);
				req.setAttribute("m_list", list);
				req.setAttribute("currPage", page);
				req.setAttribute("endPage", totPage);
				dis = req.getRequestDispatcher("message01_list.jsp");
				dis.forward(req, resp);
			break;
			
			case "/messageDetail":
				//System.out.println("상세보기 요청");
				MessageDTO dto = service.messageDetail();
				req.setAttribute("m_info", dto);
				dis = req.getRequestDispatcher("message03_ViewDetails.jsp");
				dis.forward(req, resp);
			break;
			
			case "/falseMsg":
				//System.out.println("안읽은 쪽지 요청");
				pageParam = req.getParameter("page");
				page = 1;
				if(pageParam != null) {
					page = Integer.parseInt(pageParam);
				}
				totCount = service.pcFalseMsg();
				listCount =10;
				totPage = totCount/listCount;
				if(totCount % listCount > 0 ) {
					totPage ++;
				}
				list = service.falseMsg(page);
				req.setAttribute("mchk_list", list);
				req.setAttribute("currPage", page);
				req.setAttribute("endPage", totPage);
				dis = req.getRequestDispatcher("message04_FalseChk.jsp");
				dis.forward(req, resp);
			break;
			
			case "/messageSend":
				System.out.println("메시지 작성 요청");
				boolean success =false;
				success = service.messageSend();
				HashMap<String, Object> map = new HashMap<String,Object>();
				map.put("send",success);
				Gson gson = new Gson();
				String obj =gson.toJson(map);
				System.out.println("result : " + obj);
				resp.getWriter().println(obj);
			break;
			
			case "/msgIdChk":
				//System.out.println("id check 요청");
				success =false;
				success = service.msgIdChk();
				map = new HashMap<String,Object>();
				map.put("chk_id",success);
				gson = new Gson();
				obj =gson.toJson(map);
				//System.out.println("result : " + obj);
				resp.getWriter().println(obj);
			break;
			
			case "/sendList":
				//System.out.println("보낸 메시지 리스트");
				pageParam = req.getParameter("page");
				page = 1;
				if(pageParam != null) {
					page = Integer.parseInt(pageParam);
				}
				totCount = service.pcSendList();
				listCount =10;
				totPage = totCount/listCount;
				if(totCount % listCount > 0 ) {
					totPage ++;
				}
				list = service.sendList(page);
				req.setAttribute("send_List", list);
				req.setAttribute("currPage", page);
				req.setAttribute("endPage", totPage);
				dis = req.getRequestDispatcher("message05_SendList.jsp");
				dis.forward(req, resp);
			break;
		
			case "/sendDetail":
				//System.out.println("보낸 메시지 상세보기");
				dto = service.sendDetail();
				req.setAttribute("m_sendInfo", dto);
				dis = req.getRequestDispatcher("message06_SendDetails.jsp");
				dis.forward(req, resp);
			break;
			
			case "/msgDel":
				//System.out.println("삭제 요청");
				success =false;
				success = service.msgDel();
				map = new HashMap<String, Object>();
				map.put("msgDelete",success);
				gson = new Gson();
				obj = gson.toJson(map);
				//System.out.println(obj);
				resp.getWriter().print(obj);
			break;
		
		}
	}

	
	
	
}
