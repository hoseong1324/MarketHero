package com.markethero.dao;

import com.markethero.vo.MerchantVO;

public interface AlarmDAO {
	public int neworder(MerchantVO vo) throws Exception;
}
