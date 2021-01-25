package com.markethero.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.markethero.dao.MerchantDAO;
import com.markethero.vo.DetailVO;
import com.markethero.vo.MerchantVO;

@Service
public class MerchantServiceImpl implements MerchantService {

	@Inject
	MerchantDAO dao;

	@Override
	public void register(MerchantVO vo) throws Exception {

		dao.register(vo);

	}

	@Override
	public MerchantVO login(MerchantVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public void MerchantUpdate(MerchantVO vo) throws Exception {
		dao.MerchantUpdate(vo);

	}

	@Override
	public int idChk(MerchantVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}

	
}
