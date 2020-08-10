package com.mvc.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.MessageDAO;
import com.mvc.dto.MessageDTO;

public class MessageService {

	HttpServletRequest req = null;
	HttpServletResponse resp = null;
	
	public MessageService(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}

	public ArrayList<MessageDTO> messageList(int page) {
		String id = (String) req.getSession().getAttribute("id");
		//System.out.println("서비스 들어와서 id : " + id);
		MessageDAO dao = new MessageDAO();
		return dao.messageList(id,page);
	}

	public MessageDTO messageDetail() {
		int m_idx = Integer.parseInt(req.getParameter("m_idx"));
		//System.out.println(m_idx);
		MessageDAO dao = new MessageDAO();
		return dao.messageDetail(m_idx);
	}

	public ArrayList<MessageDTO> falseMsg(int page) {
		String id = (String) req.getSession().getAttribute("id");
		MessageDAO dao = new MessageDAO();
		return dao.falseMsg(id, page);
	}

	public void messageSend() {
		String id = (String) req.getSession().getAttribute("id");
		System.out.println(id);
		MessageDAO dao = new MessageDAO();
		dao.messageSend(id);
	}

	public void msgSendForm() {
		
	}

}
