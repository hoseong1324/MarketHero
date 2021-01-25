package com.markethero.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.markethero.vo.DetailVO;
import com.markethero.vo.DetailVO2;
import com.markethero.vo.UOrderVO;
import com.markethero.vo.UserVO;

@Repository
public class UOrderDAOImpl implements UOrderDAO {
	@Inject SqlSession sql;
	
	@Override
	public List<UOrderVO>  orderList(UserVO vo, HttpSession session) throws Exception {
		UserVO user = (UserVO)session.getAttribute("user");
		String email = user.getEmail();
		
		return sql.selectList("UserMapper.orderList", email);
	}
	
	@Override
	public List<DetailVO> detail(DetailVO vo) throws Exception{
		
		int oid = vo.getOid();
		
		return sql.selectList("DetailMapper.detail", oid);
	}
	
	@Override
	public List<DetailVO2> detail(DetailVO2 vo) throws Exception{
		
		int oid = vo.getOid();
		
		return sql.selectList("DetailMapper.detail2", oid);
	}
}
