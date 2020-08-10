package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dto.MessageDTO;
import com.mvc.service.MessageService;

@WebServlet({"/messageList","/messageDetail","/falseMsg","/messageSend"})
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
				ArrayList<MessageDTO> list = null;
				list = service.messageList(page);
				req.setAttribute("m_list", list);
				req.setAttribute("currPage", page);
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
				list = service.falseMsg(page);
				req.setAttribute("mchk_list", list);
				req.setAttribute("currPage", page);
				dis = req.getRequestDispatcher("message04_FalseChk.jsp");
				dis.forward(req, resp);
			break;
			
			case "/messageSend":
				System.out.println("메시지 작성 요청");
			break;
		
		}
	}

	
	
	
}
