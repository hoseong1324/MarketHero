package com.markethero.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.markethero.dao.CartDAO;
import com.markethero.vo.CartVO;
import com.markethero.vo.MerchantVO;
import com.markethero.vo.OrderItemVO;
import com.markethero.vo.OrderVO;
import com.markethero.vo.ProductVO;
import com.markethero.vo.UserVO;

@Service
public class CartServiceImpl implements CartService{
	
	@Inject
	CartDAO dao;
	
	@Override
	public void insert(CartVO vo) throws Exception {

		dao.insert(vo);

	}
	@Override
	public void orderitem(OrderItemVO vo) throws Exception {

		dao.orderitem(vo);

	}
	public void delete(CartVO vo) throws Exception {

		dao.delete(vo);

	}
	public void alldelete(CartVO vo) throws Exception {

		dao.alldelete(vo);

	}
	@Override
	public List<CartVO> list( UserVO uvo, HttpSession session) throws Exception {

		return dao.list( uvo, session);
	}
	@Override
	public void orders(OrderVO vo) throws Exception {

		dao.orders(vo);

	}
	@Override
	public void select() throws Exception {

		dao.select();

	}
//	@Override
//	public List<CartVO> list1( UserVO uvo, HttpSession session) throws Exception {
//
//		return dao.list( uvo, session);
//	}
	
	
//	public void orderitem(CartVO vo) throws Exception {
//		
//		dao.orderitem(vo);
//	}
	
}
