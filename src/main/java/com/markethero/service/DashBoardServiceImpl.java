package com.markethero.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.markethero.dao.DashBoardDAO;
import com.markethero.vo.MerchantVO;
import com.markethero.vo.OrderItemVO;

@Service
public class DashBoardServiceImpl implements DashBoardService {
	@Inject
	private DashBoardDAO dao;

	@Override
	public List<OrderItemVO> newOrder(MerchantVO vo) throws Exception {
		return dao.newOrder(vo);
	}

	@Override
	public List<OrderItemVO> orderList(MerchantVO vo) throws Exception {
		return dao.orderList(vo);
	}

}
