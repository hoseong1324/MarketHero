package com.markethero.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.markethero.service.UserService;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String order() throws Exception {
		return "order";
	}

}
