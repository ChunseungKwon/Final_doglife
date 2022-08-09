package com.doglife.db;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.MyOrderDto;
import com.doglife.db.dto.ProductListDto;
import com.doglife.db.dto.ShopQnADto;
import com.doglife.db.dto.ShopReviewDto;
import com.doglife.db.service.ShopService;


@Controller
public class ShopController {
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

	@Autowired
	private ShopService shopServ;

	private ModelAndView mv;


	// ShopMainPage
	@GetMapping("toShopMain")
	public ModelAndView toShopMain(ProductListDto list, 
			HttpSession session) {
		logger.info("toShopMain()");

		//DB에서 게시글의 목록을 가져와서 페이지로 전달
		mv = shopServ.toShopMain(list, session);

		return mv;
	}
	
	@RequestMapping(value="/toProductList", method=RequestMethod.GET)
	public ModelAndView showProductList(ProductListDto productList, 
			HttpSession session) {
		logger.info("showProductList()");

		//DB에서 게시글의 목록을 가져와서 페이지로 전달
		mv = shopServ.showProductList(productList, session);

		return mv;
	}
	
	@GetMapping("/productInfo")
	public ModelAndView showProductInfo(Integer pnum) {
		logger.info("showProductInfo() : pnum - " + pnum);

		mv = shopServ.showProductInfo(pnum);

		return mv;
	}
	
	@GetMapping("/toProductInsert")
	public String toProductInsert() {
		logger.info("toProductInsert()");
		
		return "addProduct";
	}
	
	
	@GetMapping("/toProductRegister")
	public ModelAndView toProductRegister(MemberDto member, HttpSession session,
			RedirectAttributes rttr) {
		
		mv = new ModelAndView();
		
		MemberDto seller = (MemberDto)session.getAttribute("sb");
		String sellerID = seller.getMemberId();
		if(sellerID==null) sellerID = "";
					
		mv.addObject("sellerID", sellerID);
		mv.setViewName("productAdd");
		
		return mv;
	}
	
	//Q&A Insert
	@PostMapping(value = "/askQuestion", produces= "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, List<ShopQnADto>> askQuestion(ShopQnADto question, HttpSession session){
		logger.info("askQuestion()");

		Map<String, List<ShopQnADto>> qmap = shopServ.askQuestion(question, session);

		return qmap;//map -> json 변환은 jackson 라이브러리 객체가 처리

	}
	
}
