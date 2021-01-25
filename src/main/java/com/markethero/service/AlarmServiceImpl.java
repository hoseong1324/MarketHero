package com.markethero.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.markethero.dao.AlarmDAO;
import com.markethero.vo.MerchantVO;

@Service
public class AlarmServiceImpl implements AlarmService {
	@Inject
	private AlarmDAO dao;

	@Override
	public int neworderAlarm(MerchantVO vo) throws Exception {

		return dao.neworder(vo);
	}

}
