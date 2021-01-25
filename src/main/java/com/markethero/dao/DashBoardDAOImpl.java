package com.markethero.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.markethero.vo.MerchantVO;
import com.markethero.vo.OrderItemVO;
@Repository
public class DashBoardDAOImpl implements DashBoardDAO{
	
	@Inject
	private SqlSession sql;
	
	private static final String namespace = "com.markethero.mappers.dashboard.MorderMapper";

	@Override
	public List<OrderItemVO> newOrder(MerchantVO vo) throws Exception {
		return sql.selectList(namespace+".newOrder", vo);		
	}

	@Override
	public List<OrderItemVO> orderList(MerchantVO vo) throws Exception {
		return sql.selectList(namespace+".orderList", vo);
	}

}
