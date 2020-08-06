package com.mvc.dto;

public class AdminDTO {

	private String id;
	private int idx;
	private String name;
	private String birth;
	private String email;
	private String phone;
	private String addr;
	private char blacklist;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public char getBlacklist() {
		return blacklist;
	}
	public void setBlacklist(char blacklist) {
		this.blacklist = blacklist;
	}
	
	
	
}
