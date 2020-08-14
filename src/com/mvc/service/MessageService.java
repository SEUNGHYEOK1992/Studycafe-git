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

	public boolean messageSend() {
		String send_id = (String) req.getSession().getAttribute("id");
		String recv_id = req.getParameter("recv_id");
		String formtext = req.getParameter("formtext");
		System.out.println(send_id);
		System.out.println(recv_id +" / "+formtext );
		MessageDAO dao = new MessageDAO();
		return dao.messageSend(send_id,recv_id,formtext);
	}

	public boolean msgIdChk() {
		String id = req.getParameter("chk_id");
		//System.out.println(id);
		MessageDAO dao = new MessageDAO();
		return dao.msgIdChk(id);
	}

	public ArrayList<MessageDTO> sendList(int page) {
		String id = (String) req.getSession().getAttribute("id");
		MessageDAO dao = new MessageDAO();
		return dao.sendList(id,page);
	}

	public MessageDTO sendDetail() {
		int m_idx = Integer.parseInt(req.getParameter("m_idx"));
		//System.out.println(m_idx);
		MessageDAO dao = new MessageDAO();
		return dao.sendDetail(m_idx);
	}

	public boolean msgDel() {
		String[] delList = req.getParameterValues("delList[]");
		//System.out.println("length : " + delList.length);
		boolean success = false;
		MessageDAO dao = new MessageDAO();
		if(dao.msgDel(delList) == delList.length) {
			success = true;
		}
		return success;
	}

	public int pcMessageList() {
		MessageDAO dao = new MessageDAO();
		String id = (String) req.getSession().getAttribute("id");
		return dao.pcMessageList(id);
	}

	public int pcFalseMsg() {
		MessageDAO dao = new MessageDAO();
		String id = (String) req.getSession().getAttribute("id");
		return dao.pcFalseMsg(id);
	}

	public int pcSendList() {
		MessageDAO dao = new MessageDAO();
		String id = (String) req.getSession().getAttribute("id");
		return dao.pcSendList(id);
	}


}
