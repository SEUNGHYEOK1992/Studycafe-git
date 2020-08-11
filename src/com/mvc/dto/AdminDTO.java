package com.mvc.dto;

public class AdminDTO {

	private String id;
	private int idx;
	private String name;
	private String birth;
	private String email;
	private String phone;
	private String addr;
	private String blacklist;
	private int k_idx;
	private String cause;
	
	// 프로필 사진 관련
	private int f_idx;
	private String oriFileName;
	private String newFileName;
	private String file_category;
	
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
	public String getBlacklist() {
		return blacklist;
	}
	public void setBlacklist(String string) {
		this.blacklist = string;
	}
	public int getK_idx() {
		return k_idx;
	}
	public void setK_idx(int k_idx) {
		this.k_idx = k_idx;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}
	public int getF_idx() {
		return f_idx;
	}
	public void setF_idx(int f_idx) {
		this.f_idx = f_idx;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public String getFile_category() {
		return file_category;
	}
	public void setFile_category(String file_category) {
		this.file_category = file_category;
	}
	
	
	
}
