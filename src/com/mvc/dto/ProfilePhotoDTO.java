package com.mvc.dto;

public class ProfilePhotoDTO {
	
	/* 프로필 관련 DTO */
	private String id;
	private int idx;
	private String name;
	private String birth;
	private String email;
	private String phone;
	private String addr;
	private char blacklist;
	
	/* 프로필 사진 관련 DTO */
	
	private int f_idx;
	private int b_idx;
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
	public char getBlacklist() {
		return blacklist;
	}
	public void setBlacklist(char blacklist) {
		this.blacklist = blacklist;
	}
	public int getF_idx() {
		return f_idx;
	}
	public void setF_idx(int f_idx) {
		this.f_idx = f_idx;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
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
