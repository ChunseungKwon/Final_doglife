package com.doglife.db.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doglife.db.dao.CartDao;
import com.doglife.db.dao.ShopDao;
import com.doglife.db.dto.DogDto;
import com.doglife.db.dto.ListDto;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.MyOrderDto;
import com.doglife.db.dto.ProductDto;
import com.doglife.db.iamport.ExecApi;
import com.doglife.db.util.PagingUtil;

import lombok.extern.java.Log;

@Service
@Log
public class CartService {

	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private ShopDao shopDao;

	private ModelAndView mv;
	
	private int listCnt = 5;
	public ModelAndView showCartList(MyOrderDto orderlist, HttpSession session, RedirectAttributes rttr) {

		mv = new ModelAndView();

		String memberId = (String) (session.getAttribute("memberId"));
		System.out.println(memberId);

		// 장바구니 목록 가져오기
		List<MyOrderDto> cartlist = cartDao.selectCartList(memberId);

		// 가져온 데이터를 mv에 추가
		mv.addObject("cartlist", cartlist);

		mv.setViewName("cart");

		return mv;
	}

	public String addCartProduct(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {

		String view = null;
		String msg = null;

		String memberId = (String) (session.getAttribute("memberId"));
		System.out.println(memberId);

		String[] oqArr = request.getParameterValues("optitle");
		String[] opArr = request.getParameterValues("poption");

		String optionStr = oqArr[0] + ": " + opArr[0] + " & " + oqArr[1] + ": " + opArr[1];
		log.info(oqArr[0] + ": " + opArr[0] + " & " + oqArr[1] + ": " + opArr[1]);

		MyOrderDto order = new MyOrderDto();

		order.setMemberId(memberId);
		order.setPnum(Integer.parseInt(request.getParameter("pnum")));
		order.setProductName(request.getParameter("pname"));
		order.setOrderPrice(Integer.parseInt(request.getParameter("pprice")));
		order.setEarnedPoint(Integer.parseInt(request.getParameter("ppoint")));
		order.setOrderQuantity(Integer.parseInt(request.getParameter("pquantity")));
		order.setOrderOption(optionStr);

		log.info("memberId : " + order.getMemberId());
		log.info("Option : " + order.getOrderOption());
		log.info(order.getProductName());
		// ProductOptionDto poption = new ProductOptionDto();

		try {
			cartDao.insertCartProduct(order);

			view = "redirect:/toCart";
			msg = "상품이 장바구니에 등록되었습니다. 장바구니로 이동합니다.";
			
        }catch(Exception e) {
			e.printStackTrace();
			view = "redirect:/productInfo";
			msg = "상품을 다시 확인하여 주십시오.";
        }
        
		rttr.addFlashAttribute("msg", msg);
        
		return view;
	}

	@Transactional
	public String deleteCartProducts(RedirectAttributes rttr,HttpSession session) {
		log.info("deleteBoards()");
		
		String view = null;
		String msg = null;
		String memberId = (String) session.getAttribute("memberId");
		try {
			// 장바구니 리스트 전체삭제
			cartDao.deleteCartProducts(memberId);

			view = "redirect:/toCart";
			msg = "Successfully deleted";

		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/toCart";
			msg = "Failed to delete";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	@Transactional
	public String deleteCartProduct(int orderNum, RedirectAttributes rttr) {
		log.info("deleteBoard()");

		String view = null;
		String msg = null;

		try {
			// 댓글 삭제
			cartDao.deleteCartProduct(orderNum);

			view = "redirect:/toCart";
			msg = "Successfully deleted";

		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:/toCart";
			msg = "Failed to delete";
		}

		rttr.addFlashAttribute("msg", msg);

		return view;
	}

	// MyOrder

	public ModelAndView showOrderList(MyOrderDto orderlist, HttpSession session, RedirectAttributes rttr,ListDto list) {

		mv = new ModelAndView();
		int pageNum = list.getPageNum();
		list.setPageNum((pageNum - 1) * listCnt);
		list.setListCnt(listCnt);
		
		String memberId = (String)session.getAttribute("memberId");
		list.setMemberId(memberId);
		List<MyOrderDto> oList = cartDao.selectOrderList(list);

		mv.addObject("oList", oList);

		list.setPageNum(pageNum);

		String pageHtml = getAdoptionPaging(list,memberId);

		mv.addObject("pageHtml", pageHtml);

		session.setAttribute("pageNum", list.getPageNum());

		mv.setViewName("myorder");

		return mv;
	}

	public String getAdoptionPaging(ListDto list,String memberId) {
		log.info("serv.getPaging()");
		
		
		String pageHtml = null;

		int maxNum = cartDao.adoptionCountSelect(memberId); // all post #

		int pageCnt = 5; // post per page

		String listName = "toMyOrder?";

		if (list.getColname() != null) {
			listName = "colname=" + list.getColname() + "&keyword=" + list.getKeyword() + "&";
		}
		PagingUtil paging = new PagingUtil(maxNum, list.getPageNum(), listCnt, pageCnt, listName);

		pageHtml = paging.makePaging();

		return pageHtml;
	}

		//Paying the bill
		public String buyProduct(String orderNumList, String mcuid, String usedPoint, HttpSession session, RedirectAttributes rttr) {

			String view = null;
			String msg = null;
					
			try {

				String[] orderNumArray = orderNumList.split(",");
				for(String orderNum : orderNumArray) {
					MyOrderDto order = shopDao.getOneOrderData(orderNum);
					order.setPaymentId(mcuid);
					MemberDto member = (MemberDto)session.getAttribute("mb");
					int addPoint = member.getMemberPoint() + order.getEarnedPoint();
					member.setMemberPoint(addPoint);
					
					//결제값 넣기 (상태 바꾸기)
					cartDao.buyProduct(order);
					//판매수 올리기
					cartDao.addProductCnt(order);
					//포인트 추가 (상품 구매 시 포인트 지급)
					cartDao.addCustomerPoint(member);

				}
				int pointused = Integer.parseInt(usedPoint);
				MemberDto member = (MemberDto)session.getAttribute("mb");					
				int mpoint = member.getMemberPoint() - pointused;
				member.setMemberPoint(mpoint);
							
				//포인트 차감 (상품 구매 시 사용한 포인트 차감)
				cartDao.useCustomerPoint(member);

				
				view = "redirect:/toCart"; // toReserverInfo?frNum=" + fdto.getFrNum();
				msg = "결제 성공입니다.";
			} catch (Exception e) {
				e.printStackTrace();

				view = "redirect:/toCart";
				msg = "결제 실패 입니다. 다시 결제해 주세요.";
			}

			rttr.addFlashAttribute("msg", msg);

			return view;
		}

		public String refundProcessing(int orderNum, String refundReason, RedirectAttributes rttr) 
				throws IOException, InterruptedException {
					
			String view = "";
			String msg = "";
			MyOrderDto order = cartDao.selectOrderInfo(orderNum);
			
			// 결제 취소용
			ExecApi execApi = new ExecApi();
			String refundResult = execApi.refundProcessing(order.getPaymentId(), order.getOrderPrice(), refundReason); 
			
			if(refundResult.equals("REFUND_SUCCESS") || refundResult.equals("REFUND_I_MEY_CHE_SO_ZU_MUN")) {
				cartDao.refundOrder(orderNum);	
				
				msg = "정상적으로 환불작업이 완료되었습니다.";
			}
			else if(refundResult.equals("REFUND_UNAUTH")){
				msg = "인증 실패했습니다.(Unauthorized)";
			}
			else {
				msg = "카카오페이 환불작업을 실패하였습니다.";
			}
			
			rttr.addFlashAttribute("msg", msg);
			view = "redirect:/toReservationFuneralList?pageNum=1";
			return view;
			
		}



}// class end
