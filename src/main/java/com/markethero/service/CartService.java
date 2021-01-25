package com.markethero.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.markethero.vo.CartVO;
import com.markethero.vo.MerchantVO;
import com.markethero.vo.OrderItemVO;
import com.markethero.vo.OrderVO;
import com.markethero.vo.ProductVO;
import com.markethero.vo.UserVO;

public interface CartService {
	
	public void insert(CartVO vo) throws Exception;
	
	public void delete(CartVO vo) throws Exception;
	
	public void alldelete(CartVO vo) throws Exception;
	
	public void orders(OrderVO vo) throws Exception;
	
	public void orderitem(OrderItemVO vo) throws Exception;

	public List<CartVO> list(UserVO uvo, HttpSession session) throws Exception;
	
	public void select() throws Exception;
	
//	public List<CartVO> list1(UserVO uvo, HttpSession session) throws Exception;

//	public void orderitem(CartVO vo) throws Exception;

}
