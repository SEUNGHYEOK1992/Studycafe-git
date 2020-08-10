package com.mvc.dto;

import java.sql.Date;

public class MessageDTO {
	private int m_idx;
	private String send_id;
	private String recv_id;
	private String mess_content;
	private Date mess_reg_date;
	private String mess_chk;
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getRecv_id() {
		return recv_id;
	}
	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}
	public String getMess_content() {
		return mess_content;
	}
	public void setMess_content(String mess_content) {
		this.mess_content = mess_content;
	}
	public Date getMess_reg_date() {
		return mess_reg_date;
	}
	public void setMess_reg_date(Date mess_reg_date) {
		this.mess_reg_date = mess_reg_date;
	}
	public String getMess_chk() {
		return mess_chk;
	}
	public void setMess_chk(String mess_chk) {
		this.mess_chk = mess_chk;
	}
	
	
}
