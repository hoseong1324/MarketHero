package com.markethero.service;

import com.markethero.vo.UserVO;

public interface UserService {
	public void register(UserVO vo) throws Exception;

	public UserVO login(UserVO vo) throws Exception;

	public void UserUpdate(UserVO vo) throws Exception;

	public int idChk(UserVO vo) throws Exception;
	
}
