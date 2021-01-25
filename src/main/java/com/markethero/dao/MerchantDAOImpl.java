package com.markethero.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.markethero.vo.DetailVO;
import com.markethero.vo.MerchantVO;

@Repository
public class MerchantDAOImpl implements MerchantDAO {
	@Inject SqlSession sql;
	// 회원가입
	@Override
	public void register(MerchantVO vo) throws Exception {
		sql.insert("MerchantMapper.m_register", vo);
	}
	
	@Override
	public MerchantVO login(MerchantVO vo) throws Exception {
		return sql.selectOne("MerchantMapper.login", vo);
	}

	@Override
	public void MerchantUpdate(MerchantVO vo) throws Exception {
		sql.update("MerchantMapper.MerchantUpdate", vo); 
		
	}

	@Override
	public int idChk(MerchantVO vo) throws Exception {
		int result = sql.selectOne("MerchantMapper.idChk", vo);
		return result;
	}

	
}
