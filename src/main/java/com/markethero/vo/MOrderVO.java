package com.markethero.vo;


public class MOrderVO {
	

	//order.id 주문번호
	private int id;
	
	//order.status 주문상태
	private int status;
	
	//users.name 사용자 이름
	private String user_name;
	
	//order.created_at 주문시간
	private String created_at;
	
	//order_items.product_id 상품명
	private String product_name;
	

	
	

	//order.order_type 주문종류
	private int order_type;
	
	private int count;
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count -1;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	
	public String getProduct_name() {
		return product_name;
	}
	
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getOrder_type() {
		return order_type;
	}

	public void setOrder_type(int order_type) {
		this.order_type = order_type;
	}

	
	
}
