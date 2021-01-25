package com.markethero.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.markethero.vo.MerchantVO;
import com.markethero.vo.ProductVO;
import com.markethero.vo.U_ProductVO;
import com.markethero.vo.UserVO;

public interface ProductService {
	public void register(ProductVO vo) throws Exception;


	public void ProductUpdate(ProductVO vo) throws Exception;

	public int idChk(ProductVO vo) throws Exception;


	public List<ProductVO> list(MerchantVO vo, HttpSession session) throws Exception;

	public List<ProductVO> list(UserVO uvo, HttpSession session) throws Exception;
	
	public List<U_ProductVO> u_list(MerchantVO vo, HttpSession session) throws Exception;


	public int u_idChk(U_ProductVO vo) throws Exception;
	
	public void p_request(U_ProductVO vo) throws Exception;


	
}
