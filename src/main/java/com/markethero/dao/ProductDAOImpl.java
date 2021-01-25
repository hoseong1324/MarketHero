package com.markethero.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.markethero.vo.MerchantVO;
import com.markethero.vo.ProductVO;
import com.markethero.vo.U_ProductVO;
import com.markethero.vo.UserVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Inject
	SqlSession sql;

	// �쉶�썝媛��엯
	@Override
	public void register(ProductVO vo) throws Exception {
		sql.insert("ProductMapper.register", vo);
	}

	@Override
	public void ProductUpdate(ProductVO vo) throws Exception {
		sql.update("ProductMapper.ProductUpdate", vo);

	}

	@Override
	public int idChk(ProductVO vo) throws Exception {
		int result = sql.selectOne("ProductMapper.idChk", vo);
		return result;
	}

	@Override
	public List<ProductVO> list(MerchantVO vo, HttpSession session) throws Exception {
		MerchantVO merchant = (MerchantVO) session.getAttribute("merchant");
		int merchant_id = merchant.getId();
		return sql.selectList("ProductMapper.product", merchant_id);
	}

	@Override
	public List<ProductVO> list(UserVO uvo, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		int user_id = user.getMerchant_id();
		return sql.selectList("ProductMapper.order",user_id);
	}

	@Override
	public void p_request(U_ProductVO vo) {
		sql.insert("U_ProductMapper.p_request", vo);
		
	}

	@Override
	public int u_idChk(U_ProductVO vo) {
		int result = sql.selectOne("U_ProductMapper.u_idChk", vo);
		return result;
	}
	@Override
	public List<U_ProductVO> u_list(MerchantVO vo, HttpSession session) throws Exception {
		MerchantVO merchant = (MerchantVO)session.getAttribute("merchant");
		int m_id = merchant.getId();
		return sql.selectList("U_ProductMapper.request_p", m_id);
	}
	

}
