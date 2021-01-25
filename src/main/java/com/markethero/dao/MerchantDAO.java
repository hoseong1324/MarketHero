package com.markethero.dao;

import java.util.List;

import com.markethero.vo.DetailVO;
import com.markethero.vo.MerchantVO;

public interface MerchantDAO {
		// 회원가입
		public void register(MerchantVO vo) throws Exception;
		
		// 로그인
		public MerchantVO login(MerchantVO vo) throws Exception;
		
		// 회원정보 수정
		public void MerchantUpdate(MerchantVO vo)throws Exception;
		
		// 아이디 중복체크
		public int idChk(MerchantVO vo) throws Exception;
		
		
}
