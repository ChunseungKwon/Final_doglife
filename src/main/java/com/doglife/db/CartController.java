package com.doglife.db;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dto.MyOrderDto;
import com.doglife.db.service.CartService;

@Controller
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Autowired
	private CartService cartServ;
	
	private ModelAndView mv;
	
	// CartPage
	@GetMapping("/toCart")
	public ModelAndView toCart(MyOrderDto orderlist, HttpSession session, RedirectAttributes rttr) {
		logger.info("toCart()");

		//DB에서 게시글의 목록을 가져와서 페이지로 전달
		mv = cartServ.showCartList(orderlist, session, rttr);

		return mv;
	}
	
	
	@PostMapping("/addCartProduct")
	public String addCartProduct(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {
		logger.info("addCartProduct");
		
		String view = cartServ.addCartProduct(request, session, rttr);
		
		
		return view;
	}
	
	@GetMapping("/deleteCartProducts") 
	public String deleteCartProducts(RedirectAttributes rttr, HttpSession session) {
		logger.info("deleteCartProducts()");
		
		String view = cartServ.deleteCartProducts(rttr, session);
				
		return view;
	}
	
	@GetMapping("/deleteCartProduct") 
	public String deleteCartProduct(int orderNum, RedirectAttributes rttr) {
		logger.info("deleteCartProduct() - orderNum : " + orderNum);
		
		String view = cartServ.deleteCartProduct(orderNum, rttr);
				
		return view;
	}

	
	@PostMapping(value = "arrSend", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, String> arrSend(@RequestParam(value = "arrList[]") List<String> arrList){
		logger.info(arrList.toString());
		
		Map<String, String> rmap = new HashMap<String, String>();
		rmap.put("result", "성공");
		
		return rmap;
	}
	
	
	@GetMapping("/buyProduct")	
	//public String buyProduct(MyOrderDto order, String mcuid, HttpSession session, RedirectAttributes rttr) {	
	public String buyProduct(MyOrderDto order, String orderNumList, String mcuid, String usedPoint, HttpSession session, RedirectAttributes rttr) {
		logger.info("buyProduct.orderNum=" + orderNumList);
		
		String view = cartServ.buyProduct(orderNumList, mcuid, usedPoint, session, rttr);		
		
		return view;
	}
	
}
