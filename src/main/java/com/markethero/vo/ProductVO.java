package com.markethero.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {

	private int id;
	private String p_name;
	private int price;
	private int merchant_id;
	private String created_at;
	private String file_name;
	private MultipartFile uploadFile;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMerchant_id() {
		return merchant_id;
	}
	public void setMerchant_id(int merchant_id) {
		this.merchant_id = merchant_id;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	
	
	
	
	
}
