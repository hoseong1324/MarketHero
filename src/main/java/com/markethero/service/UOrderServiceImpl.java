package com.markethero.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.markethero.dao.UOrderDAO;
import com.markethero.vo.DetailVO;
import com.markethero.vo.DetailVO2;
import com.markethero.vo.UOrderVO;
import com.markethero.vo.UserVO;

@Service
public class UOrderServiceImpl implements UOrderService {

	@Inject
	UOrderDAO dao;
	
	@Override
	public List<UOrderVO> orderList(UserVO vo, HttpSession session) throws Exception {
		
		return dao.orderList(vo, session);
	}
	
	@Override
	public List<DetailVO> detail(DetailVO vo) throws Exception{
		
		return dao.detail(vo);
	}
	
	@Override
	public List<DetailVO2> detail(DetailVO2 vo) throws Exception{
		
		return dao.detail(vo);
	}
	
}
