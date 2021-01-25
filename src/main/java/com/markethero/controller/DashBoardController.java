package com.markethero.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.markethero.service.AlarmService;
import com.markethero.service.DashBoardService;
import com.markethero.vo.AlarmVO;
import com.markethero.vo.MerchantVO;

@Controller
@RequestMapping("/dashboard/*")
public class DashBoardController {
	private static final Logger logger = LoggerFactory.getLogger(DashBoardController.class);

	@Inject
	DashBoardService service;
	@Inject
	AlarmService alarm;
	
	@RequestMapping(value = "/merchant", method = RequestMethod.GET)
	public String newOrder(HttpServletRequest req,Model model) throws Exception {
		logger.info("dashboard");
		HttpSession session = req.getSession();
		MerchantVO login = (MerchantVO) session.getAttribute("merchant");
		
		//신규주문 수 세션 생성
		int count = alarm.neworderAlarm(login);
		session.setAttribute("newordercnt", count);			

	    //신규 주문
		model.addAttribute("neworder",service.newOrder(login));
		//주문 현황
		model.addAttribute("orderlist",service.orderList(login));
		
		
//		List<OrderItemVO> testvo1 = service.newOrder(login);
//		List<OrderItemVO> testvo = service.orderList(login);
//		OrderItemVO tlqkf = testvo.get(1);
//		OrderItemVO tlqkf1 = testvo1.get(1);
//		System.out.println("주문내역:"+tlqkf.getStatus());
//		System.out.println("신규주문:"+tlqkf1.getStatus());
		
		
		return "merchant/m_main";
	}
	
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String charttest(HttpServletRequest req,Model model) throws Exception {
		
		return "include/chart";
	}

	
}