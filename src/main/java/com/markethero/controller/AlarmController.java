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
import org.springframework.web.bind.annotation.ResponseBody;

import com.markethero.service.AlarmService;
import com.markethero.service.DashBoardService;
import com.markethero.vo.AlarmVO;
import com.markethero.vo.MerchantVO;

@Controller
@RequestMapping("/alarm")
public class AlarmController {
	private static final Logger logger = LoggerFactory.getLogger(AlarmController.class);

	@Inject
	AlarmService alarm;
	
	@ResponseBody
	@RequestMapping(value = "/merchant", method = RequestMethod.GET)
	public String newOrder(HttpServletRequest req,Model model) throws Exception {
		logger.info("alarm");
		HttpSession session = req.getSession();
		MerchantVO login = (MerchantVO) session.getAttribute("merchant");
		String alarmok = "false";
		
		//이전 카운트
		int cnt = (Integer) session.getAttribute("newordercnt");
		System.out.println("세션 지우기 전 "+ cnt);
		//현재 카운트
		int nowcnt = alarm.neworderAlarm(login);
		System.out.println("현재 카운트 : "+ nowcnt);
		
		//새로 불러온 카운트가 더 크면 세션 값 바꿈
		if(nowcnt>cnt) {
			session.setAttribute("newordercnt", nowcnt);
//		session.removeAttribute("newordercnt");
			cnt = (Integer) session.getAttribute("newordercnt");
			System.out.println(cnt);
			alarmok = "true";
		}else {
			alarmok = "false";
		}
		
		
		
		
		
		return alarmok;
	}

	
}