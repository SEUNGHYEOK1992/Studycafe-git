package com.mvc.dto;

import java.sql.Date;

public class ComplainDTO {
	private int repo_idx;
	private int b_idx;
	private String b_id;
	private String repo_id;
	private String repo_content;
	private Date repo_reg_date;
	public int getRepo_idx() {
		return repo_idx;
	}
	public void setRepo_idx(int repo_idx) {
		this.repo_idx = repo_idx;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public String getRepo_id() {
		return repo_id;
	}
	public void setRepo_id(String repo_id) {
		this.repo_id = repo_id;
	}
	public String getRepo_content() {
		return repo_content;
	}
	public void setRepo_content(String repo_content) {
		this.repo_content = repo_content;
	}
	public Date getRepo_reg_date() {
		return repo_reg_date;
	}
	public void setRepo_reg_date(Date repo_reg_date) {
		this.repo_reg_date = repo_reg_date;
	}
	
	
}
