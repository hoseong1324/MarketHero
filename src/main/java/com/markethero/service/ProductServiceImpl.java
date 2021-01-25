package com.markethero.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.markethero.dao.ProductDAO;
import com.markethero.vo.MerchantVO;
import com.markethero.vo.ProductVO;
import com.markethero.vo.U_ProductVO;
import com.markethero.vo.UserVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	ProductDAO dao;

	@Override
	public void register(ProductVO vo) throws Exception {

		dao.register(vo);

	}

	@Override
	public void ProductUpdate(ProductVO vo) throws Exception {
		dao.ProductUpdate(vo);

	}

	@Override
	public int idChk(ProductVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}

	@Override
	public List<ProductVO> list(MerchantVO vo, HttpSession session) throws Exception {

		return dao.list(vo, session);
	}
	@Override
	public List<ProductVO> list(UserVO uvo, HttpSession session) throws Exception {
		return dao.list(uvo,session);
	}
	
	@Override
	public void p_request(U_ProductVO vo) throws Exception {

		dao.p_request(vo);

	}
	@Override
	public int u_idChk(U_ProductVO vo) throws Exception {
		int result = dao.u_idChk(vo);
		return result;
	}
	@Override
	public List<U_ProductVO> u_list(MerchantVO vo, HttpSession session) throws Exception {
		return dao.u_list(vo, session);
	}


}
