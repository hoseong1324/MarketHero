package com.markethero.service;


import com.markethero.vo.MerchantVO;

public interface MerchantService {
	public void register(MerchantVO vo) throws Exception;

	public MerchantVO login(MerchantVO vo) throws Exception;

	public void MerchantUpdate(MerchantVO vo) throws Exception;

	public int idChk(MerchantVO vo) throws Exception;
	
	
}
