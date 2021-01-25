package com.markethero.controller;


import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.markethero.service.CartService;
import com.markethero.service.MOrderService;
import com.markethero.service.ProductService;
import com.markethero.service.UOrderService;
import com.markethero.service.UserService;
import com.markethero.vo.CartVO;
import com.markethero.vo.DetailVO;
import com.markethero.vo.DetailVO2;
import com.markethero.vo.ProductVO;
import com.markethero.vo.UOrderVO;
import com.markethero.vo.UserVO;

@Controller
@RequestMapping("/user/*")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	CartService Cservice;
	
	@Inject
	UserService service;

	
	@Inject
	ProductService Pservice;

	@Inject
	UOrderService os;

	@Inject
	MOrderService Oservice;

	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET,RequestMethod.POST})
	public String login(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");
	//	System.out.println("!!!!!!!!!!"+vo.getEmail());
	//	System.out.println(vo.getPw());
		HttpSession session = req.getSession();
		UserVO login = service.login(vo);
		System.out.println(login);
		
		boolean pwdMatch = false;
		if (login != null && vo != null) {
			pwdMatch = pwdEncoder.matches(vo.getPw(), login.getPw());
		}
		if (pwdMatch == true) {
			session.setAttribute("user", login);
			rttr.addFlashAttribute("msg",true);
			
		} else {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg", false);
			
		}
		

//		if (login != null && pwdMatch == true) {
//			session.setAttribute("User", login);
//		} else {
//			session.setAttribute("User", null);
//			rttr.addFlashAttribute("msg", false);
//		}
		return "redirect:/";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		//return "/user/logout";
		return "redirect:/";
	}

	@RequestMapping(value = "/UserUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception {

		return "User/UserUpdateView";
	}

	@RequestMapping(value = "/UserUpdate", method = RequestMethod.POST)
	public String registerUpdate(UserVO vo, HttpSession session) throws Exception {
		String inputPass = vo.getPw();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setPw(pwd);
		service.UserUpdate(vo);

		session.invalidate();

		return "redirect:/";
	}

	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	public boolean passChk(UserVO vo) throws Exception {

		UserVO login = service.login(vo);
		boolean pwdChk = pwdEncoder.matches(vo.getPw(), login.getPw());
		return pwdChk;
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public String idChk(UserVO vo) throws Exception {
		logger.info("idChk" + vo.getEmail());
		int result = service.idChk(vo);
		return Integer.toString(result);
	}

	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() throws Exception {
		logger.info("get register");
		return "/user/u_register";
	}

	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(UserVO vo) throws Exception {
		logger.info("post register");
		int result = service.idChk(vo);
		System.out.println(result);
		try {
			if (result == 1) {
				return "/user/u_register";
			} else if (result == 0) {
				String inputPw = vo.getPw();
				String pwd = pwdEncoder.encode(inputPw);
				vo.setPw(pwd);

				service.register(vo);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() throws Exception {
		logger.info("get main");
		return "user/u_main";
	}
	

	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(DetailVO2 vo2, Model model ,DetailVO vo , @RequestParam("O.id") int oid) throws Exception {
		logger.info("get detail");
		System.out.println(oid);
		vo.setOid(oid);
		model.addAttribute("list", os.detail(vo));
		
		vo2.setOid(oid);
		model.addAttribute("tlist", os.detail(vo2));
		
		return "user/u_detail";
	}

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(Model model, ProductVO vo,UserVO uvo, HttpSession session) throws Exception {
		logger.info("get order");
		model.addAttribute("product", Pservice.list(uvo,session));
		return "user/u_order";
	}

	

	@RequestMapping(value = "/ordera", method = RequestMethod.GET)
	public String ordera(UOrderVO ovo,UserVO vo, HttpSession session ,Model model) throws Exception {
		logger.info("get orderList");
		
		model.addAttribute("list", os.orderList(vo, session));
		

		return "user/u_ordera";
	}
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model,CartVO cvo, UserVO uvo, HttpSession session) throws Exception {
		logger.info("get cart");
		model.addAttribute("cart", Cservice.list(uvo, session));
		
		return "user/cart";
	}
	

	
	
	@ResponseBody
	@RequestMapping(value = "/hometax", produces = "application/text; charset=utf8")
	public String hometax(UserVO vo) {
	//	System.out.println("홈택스 컨트롤러에서 받음 : "+vo.toString());
	
		String apiURL = "https://teht.hometax.go.kr/wqAction.do?actionId=ATTABZAA001R08&screenId=UTEABAAA13&popupYn=false&realScreenId="; // json
		
		String request = "<map id=\"ATTABZAA001R08\"><pubcUserNo/><mobYn>N</mobYn><inqrTrgtClCd>1</inqrTrgtClCd><txprDscmNo>" + 
						vo.getCo_reg_num().replaceAll("-", "") + "</txprDscmNo><dongCode>20</dongCode><psbSearch>Y</psbSearch><map id=\"userReqInfoVO\"/></map>";
		String ret = "";
		try {
			String responseBody = post(apiURL, request);
			ret = xmlParse(responseBody);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//System.out.println("캐치");
			e.printStackTrace();
		} 
		System.out.println(vo.getCo_reg_num() +" : " + ret);
		
		return ret;
	}

	public static String post(String apiUrl, String request) throws Exception {
		URL url = new URL(apiUrl);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setConnectTimeout(20000);
		connection.setReadTimeout(20000);
		connection.setDoOutput(true);
		connection.setUseCaches(true);
		connection.setRequestMethod("POST");
		// Set Headers
		connection.setRequestProperty("Accept", "application/xml");
		connection.setRequestProperty("Content-Type", "application/xml");
		// Write XML
		OutputStream outputStream = connection.getOutputStream();
		byte[] b = request.getBytes("UTF-8");
		outputStream.write(b);
		outputStream.flush();
		outputStream.close();
		// Read XML
		InputStream inputStream = connection.getInputStream();
		byte[] res = new byte[2048];
		int i = 0;
		StringBuilder response = new StringBuilder();
		while ((i = inputStream.read(res)) != -1) {
			response.append(new String(res, 0, i));
		}
		inputStream.close();
	//	System.out.println("포스트");
		return response.toString();
	}
	
	public static String xmlParse(String resp) throws Exception {
		String start = "<smpcBmanTrtCntn>";
		String end = "</smpcBmanTrtCntn>";
		int sidx = resp.indexOf(start);
		int eidx = resp.indexOf(end);
		String ret = resp.substring(start.length() + sidx, eidx);
	//	System.out.println("파서");
        return ret;
	}
	
}