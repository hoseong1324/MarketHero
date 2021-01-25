package com.markethero.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.markethero.dao.UserDAO;
import com.markethero.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO dao;

	@Override
	public void register(UserVO vo) throws Exception {

		dao.register(vo);

	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public void UserUpdate(UserVO vo) throws Exception {
		dao.UserUpdate(vo);

	}

	@Override
	public int idChk(UserVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
}
