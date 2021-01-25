package com.markethero.vo;

public class UserVO {
	private int merchant_id;
	private int id;
	private String email;
	private String pw;
	private String name;
	private String tel;
	private String addr;
	private String co_reg_num;
	private String m_name;
	private String file_name;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getMerchant_id() {
		return merchant_id;
	}
	public void setMerchant_id(int merchant_id) {
		this.merchant_id = merchant_id;
	}
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCo_reg_num() {
		return co_reg_num;
	}
	public void setCo_reg_num(String co_reg_num) {
		this.co_reg_num = co_reg_num;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
//	@Override
//	public String toString() {
//		return "UserVO [merchant_id=" + merchant_id + ", id=" + id + ", email=" + email + ", pw=" + pw + ", name="
//				+ name + ", tel=" + tel + ", addr=" + addr + ", co_reg_num=" + co_reg_num + ", m_name=" + m_name + "]";
//	}
	
	
}
