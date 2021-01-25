package com.markethero.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.markethero.vo.CartVO;
import com.markethero.vo.MerchantVO;
import com.markethero.vo.OrderItemVO;
import com.markethero.vo.OrderVO;
import com.markethero.vo.ProductVO;
import com.markethero.vo.UserVO;

@Repository
public class CartDAOImpl implements CartDAO{

	@Inject
	SqlSession sql;
	
	@Override
	public void insert(CartVO vo) throws Exception {
		sql.insert("CartMapper.cart", vo);
	}
	@Override
	public void delete(CartVO vo) throws Exception {
		sql.delete("CartMapper.delete", vo);
	}
	@Override
	public void alldelete(CartVO vo) throws Exception {
		sql.delete("CartMapper.alldelete", vo);
	}
	
	@Override
	public void orders(OrderVO vo) throws Exception {
		sql.insert("CartMapper.orders", vo);
	}
	@Override
	public void orderitem(OrderItemVO vo) throws Exception {
		sql.insert("CartMapper.orderitem",vo);
	}

	@Override
	public List<CartVO> list( UserVO uvo, HttpSession session) throws Exception{
		UserVO user = (UserVO) session.getAttribute("user");
		int user_id = user.getId();
		return sql.selectList("CartMapper.list",user_id);
	}
	
	@Override
	public void select() throws Exception {
		sql.selectOne("CartMapper.Oid");
	}
//	@Override
//	public List<CartVO> list1( UserVO uvo, HttpSession session) throws Exception{
//		UserVO user = (UserVO) session.getAttribute("user");
//		int user_id = user.getId();
//		return sql.selectOne("CartMapper.list1",user_id);
//	}
	
	
//	@Override
//	public void orderitem(CartVO vo) throws Exception {
//		 sql.insert("CartMapper.orderitem", vo);
//	}
}
