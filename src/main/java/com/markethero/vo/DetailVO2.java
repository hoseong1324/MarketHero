package com.markethero.vo;

public class DetailVO2 {
	
	private int oid;
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	private String name; // 이름
	private String tel; // 전화번호
	private String addr; // 주소
	private String order_type; // 주문종류
	private String pay_method; // 결제방법
	private int status; // 주문상태
	private String rcv_method; // 상품 수령 방법
	
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
	public String getOrder_type() {
		return order_type;
	}
	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getRcv_method() {
		return rcv_method;
	}
	public void setRcv_method(String rcv_method) {
		this.rcv_method = rcv_method;
	}
	
}
