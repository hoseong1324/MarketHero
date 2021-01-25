package com.markethero.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.markethero.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Inject SqlSession sql;
	// �쉶�썝媛��엯
	@Override
	public void register(UserVO vo) throws Exception {
		sql.insert("UserMapper.u_register", vo);
	}
	
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return sql.selectOne("UserMapper.login", vo);
	}

	@Override
	public void UserUpdate(UserVO vo) throws Exception {
		sql.update("UserMapper.UserUpdate", vo); 
		
	}

	@Override
	public int idChk(UserVO vo) throws Exception {
		int result = sql.selectOne("UserMapper.idChk", vo);
		return result;
	}
}
