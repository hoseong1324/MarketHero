package com.markethero.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.markethero.vo.DetailVO;
import com.markethero.vo.DetailVO2;
import com.markethero.vo.UOrderVO;
import com.markethero.vo.UserVO;

public interface UOrderService {
	

	public List<UOrderVO> orderList(UserVO vo, HttpSession session) throws Exception;
	
	public List<DetailVO> detail(DetailVO vo) throws Exception;
	
	public List<DetailVO2> detail(DetailVO2 vo) throws Exception;
	
}
