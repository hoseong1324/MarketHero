package com.markethero.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.markethero.vo.MerchantVO;

@Repository
public class AlarmDAOImpl implements AlarmDAO {
	@Inject SqlSession sql;
	
	private static final String namespace = "com.markethero.mappers.dashboard.AlarmMapper";
	
	// 신규주문 카운트
	@Override
	public int neworder(MerchantVO vo) throws Exception {
		return sql.selectOne(namespace+".newOrderAlarm", vo);
	}

}
