package com.doglife.db;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dto.MyOrderDto;
import com.doglife.db.service.CustomerPageService;

@Controller
public class CustomerPageController {
	private static final Logger logger = LoggerFactory.getLogger(SellerPageController.class);
	
	
	@Autowired
	private CustomerPageService custPageServ;
	
	private ModelAndView mv;
			
	
	@GetMapping("toCustomerOrders")
	public ModelAndView showOrderedList(MyOrderDto order, HttpSession session) {
		logger.info("showOrderedList()");
		//DB에서 게시글의 목록을 가져와서 페이지로 전달
		mv = custPageServ.customerOrderList(order, session);

		return mv;
	}

	@GetMapping("/productReview")
	public ModelAndView productReview(int pnum, HttpSession session) {
		
		mv = custPageServ.productReview(pnum, session);
		
		return mv;
	}

	@PostMapping("/productReviewRegister")
	public String productReviewRegister(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
        
		String view = custPageServ.productReviewRegister(multi, rttr);
		
		return view;	
	}

}//class end

