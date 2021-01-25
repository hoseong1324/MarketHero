package com.markethero.controller;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.markethero.service.ProductService;
import com.markethero.vo.ProductVO;
import com.markethero.vo.U_ProductVO;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Inject
	ProductService service;

	@RequestMapping(value = "/ProductUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception {

		return "Product/ProductUpdateView";
	}

	@RequestMapping(value = "/ProductUpdate", method = RequestMethod.POST)
	public String registerUpdate(ProductVO vo, HttpSession session) throws Exception {
		service.ProductUpdate(vo);

		session.invalidate();

		return "redirect:/";
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public String idChk(ProductVO vo) throws Exception {
		logger.info("idChk" + vo.getP_name());
		int result = service.idChk(vo);
		return Integer.toString(result);
	}

	// 상품등록 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() throws Exception {
		logger.info("get register");
		return "/merchant/m_product";
	}

	// 상품등록 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(ProductVO vo) throws Exception {
		logger.info("post register");
		String fileName = null;
		MultipartFile uploadFile = vo.getUploadFile();

		System.out.println(fileName);
		int result = service.idChk(vo);
		System.out.println(result);
		try {
			if (!uploadFile.isEmpty()) {
				String originalFileName = uploadFile.getOriginalFilename();
				String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
				UUID uuid = UUID.randomUUID(); // UUID 구하기
				fileName = uuid + "." + ext;
				uploadFile.transferTo(new File(
						"C:\\Users\\hoseo\\Desktop\\MarketHero\\Market_hero\\src\\main\\webapp\\resources\\images\\uploadFile\\"
								+ fileName));

				vo.setFile_name(fileName);
				
				if (result == 1) {
					return "/merchant/m_product";
				} else if (result == 0) {
					service.register(vo);
				}
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}

		return "redirect:/";
	}

	// 상품등록 get
	@RequestMapping(value = "/p_request", method = RequestMethod.GET)
	public String getP_request() throws Exception {
		logger.info("get p_request");
		return "/user/u_order";
	}

	// 상풍요청 post
	@RequestMapping(value = "/p_request", method = RequestMethod.POST)
	public String postP_request(U_ProductVO vo) throws Exception {
		logger.info("post p_request");
		int result = service.u_idChk(vo);
		System.out.println(result);
		try {
			if (result == 1) {
				return "/user/u_order";
			} else if (result == 0) {
				service.p_request(vo);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}

		return "redirect:/";
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/u_idChk", method = RequestMethod.POST)
	public String p_idChk(U_ProductVO vo) throws Exception {
		logger.info("u_idChk" + vo.getU_p_name());
		int result = service.u_idChk(vo);
		return Integer.toString(result);
	}

}