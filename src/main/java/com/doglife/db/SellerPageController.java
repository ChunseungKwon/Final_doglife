package com.doglife.db;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dto.ProductDto;
import com.doglife.db.dto.SellerOrderListDto;
import com.doglife.db.dto.ShopQnADto;
import com.doglife.db.service.SellerPageService;


@Controller
public class SellerPageController {
	private static final Logger logger = LoggerFactory.getLogger(SellerPageController.class);

	@Autowired
	private SellerPageService sellpageServ;
		
	private ModelAndView mv;

	@GetMapping("sellerPage")
	public ModelAndView showProductList(ProductDto product, HttpSession session) {
		logger.info("showProductList()");

		//DB에서 게시글의 목록을 가져와서 페이지로 전달
		mv = sellpageServ.showProductList(product, session);

		return mv;
	}
	
	@GetMapping("toSellerOrders")
	public ModelAndView showOrderedList(SellerOrderListDto order, HttpSession session) {
		logger.info("showOrderedList()");

		//DB에서 게시글의 목록을 가져와서 페이지로 전달
		mv = sellpageServ.showOrderedList(order, session);

		return mv;
	}
	
	@GetMapping("/deliverOrder") 
	public String deliverOrder(int orderNum, RedirectAttributes rttr) {
		logger.info("deliverOrder() - orderNum : " + orderNum);
		
		String view = sellpageServ.deliverOrder(orderNum, rttr);
				
		return view;
	}
	

	@GetMapping("/refundOrder")
	public String refundOrder(int orderNum, String refundReason, HttpSession session, RedirectAttributes rttr) throws IOException, InterruptedException {
				
		String view = sellpageServ.refundProcessing(orderNum, refundReason, session, rttr);		
		
		return view;
		
	}
	
	@GetMapping("toSellerQna")
	public ModelAndView showQnaList(ShopQnADto qna, HttpSession session) {
		logger.info("showQnaList()");

		//DB에서 게시글의 목록을 가져와서 페이지로 전달
		mv = sellpageServ.showQnaList(qna, session);

		return mv;
	}

	@PostMapping("/addNewProduct")
	public String addNewProduct(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
        
	//logger.info("boardWrite()");
		
		String view = sellpageServ.addNewProduct(multi, rttr);
		
		return view;	
	}
	
	@GetMapping("/toUpdateProduct")
	public ModelAndView toUpdateProduct(int pnum, RedirectAttributes rttr) {
		logger.info("toUpdateProduct(): pnum - " + pnum);
		
		mv = sellpageServ.toUpdateProduct(pnum);
		
		return mv;
	}
	
	@PostMapping("/updateProduct")
	public String updateProduct(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		logger.info("updateProduct()");
		
		String view = sellpageServ.updateProduct(multi, rttr);
		
		return view;
	}
	
	//Q&A Insert
	@PostMapping(value = "/answerQuestion", produces= "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, ShopQnADto> answerQuestion(ShopQnADto qna, HttpSession session){
		logger.info("answerQuestion()");

		Map<String, ShopQnADto> qmap = sellpageServ.answerQuestion(qna, session);

		return qmap;

	}
	
	@GetMapping("/deleteProduct") 
	public String deleteCartProduct(int pnum, RedirectAttributes rttr) {
		logger.info("deleteCartProduct() - pnum : " + pnum);
		
		String view = sellpageServ.deleteProduct(pnum, rttr);
				
		return view;
	}
	
}//class end

