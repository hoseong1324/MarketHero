package com.markethero.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.markethero.service.CartService;
import com.markethero.vo.CartVO;
import com.markethero.vo.MerchantVO;
import com.markethero.vo.OrderItemVO;
import com.markethero.vo.OrderVO;
import com.markethero.vo.UserVO;


@Controller
@RequestMapping("/cart/*")
public class CartController {
	@Inject
	CartService service;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() throws Exception {
		logger.info("get main");
		return "user/cart";
	}
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(CartVO vo) throws Exception {
		logger.info("get insert");
		service.insert(vo);
		
		return "redirect:/user/order";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(CartVO vo) throws Exception {
		logger.info("get delete");
		service.delete(vo);
		
		return "redirect:/user/cart";
	}
	@RequestMapping(value = "/orders", method = RequestMethod.POST)
	public String orders(OrderVO vo, OrderItemVO ovo, UserVO uvo, HttpSession session ) throws Exception {
		logger.info("get orders");
		service.select();
		List<CartVO> l = service.list(uvo, session);
		int order_id = vo.getId();
		service.orders(vo);
		for (CartVO cartVO : l) {
			ovo.setOrder_id(order_id);
			ovo.setProduct_id(cartVO.getP_id());
			ovo.setQuantity(cartVO.getQuantity());
			System.out.println(cartVO.getP_id());
			service.orderitem(ovo);
		} 
		
		
		return "redirect:/cart/alldelete";
	}
	@RequestMapping(value = "/alldelete", method = RequestMethod.GET)
	public String alldelete(CartVO vo) throws Exception {
		logger.info("get alldelete");
		service.alldelete(vo);
		
		return "redirect:/user/cart";
	}



}
