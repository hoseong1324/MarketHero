package com.markethero.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.markethero.vo.DetailVO;
import com.markethero.vo.DetailVO2;
import com.markethero.vo.MOrderVO;
import com.markethero.vo.MerchantVO;
import com.markethero.vo.UserVO;

@Repository
public class MOrderDAOImpl implements MOrderDAO {
	@Inject SqlSession sql;
	
	@Override
	public List<MOrderVO>  orderList(MerchantVO vo, HttpSession session) throws Exception {
		MerchantVO merchant = (MerchantVO)session.getAttribute("merchant");
		int id = merchant.getId();
		
		return sql.selectList("MerchantMapper.orderList", id);
	}
	
	@Override
	public List<DetailVO> detail(DetailVO vo) throws Exception {
		int oid = vo.getOid();
		return sql.selectList("DetailMapper.detail" , oid);
	}

	@Override
	public List<DetailVO2> detail(DetailVO2 vo) throws Exception{
		
		int oid = vo.getOid();
		
		return sql.selectList("DetailMapper.detail2", oid);
	}


}
