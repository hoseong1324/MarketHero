package com.markethero.vo;

import java.util.List;

public class OrderVO {
	
	
	private int id;
	private int user_id;
	private int status;
	private int order_type;
	private String pay_method;
	private String rcv_method;
	private String created_at;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id +1;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getOrder_type() {
		return order_type;
	}
	public void setOrder_type(int order_type) {
		this.order_type = order_type;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getRcv_method() {
		return rcv_method;
	}
	public void setRcv_method(String rcv_method) {
		this.rcv_method = rcv_method;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	
	
	
}
