package com.markethero.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.markethero.vo.MerchantVO;
import com.markethero.vo.ProductVO;
import com.markethero.vo.U_ProductVO;
import com.markethero.vo.UserVO;

public interface ProductDAO {
		// 상품 등록
		public void register(ProductVO vo) throws Exception;
		
		
		// 회원정보 수정
		public void ProductUpdate(ProductVO vo)throws Exception;
		
		// 아이디 중복체크
		public int idChk(ProductVO vo) throws Exception;

		public List<ProductVO> list(MerchantVO vo, HttpSession session) throws Exception;


		public List<ProductVO> list(UserVO uvo, HttpSession session) throws Exception;
		
	
		public List<U_ProductVO> u_list(MerchantVO vo, HttpSession session) throws Exception;


		public void p_request(U_ProductVO vo);


		public int u_idChk(U_ProductVO vo);


		





		

}
