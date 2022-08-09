package com.doglife.db.dao;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.doglife.db.dto.ListDto;
import com.doglife.db.dto.MemberDto;
import com.doglife.db.dto.MyOrderDto;
import com.doglife.db.dto.ProductDto;

public interface CartDao {

	// 장바구니 목록 가져오기
	public List<MyOrderDto> selectCartList(String memberId);

	public void insertCartProduct(MyOrderDto order);

	public void deleteCartProducts(String memberId);

	public void deleteCartProduct(int orderNum);

	// 주문목록 가져오기
	public List<MyOrderDto> selectOrderList(ListDto list);

	public void insertOrderProduct(MyOrderDto order);

	// 결제

	public void buyProduct(MyOrderDto order);

	public MyOrderDto selectOrderInfo(int orderNum);

	public void addProductCnt(MyOrderDto order);

	public void addCustomerPoint(MemberDto member);

	public void useCustomerPoint(MemberDto member);

	public void refundOrder(int orderNum);

	public void subtractPoint(MemberDto member);

	public MemberDto selectMemberInfo(String customerId);

	public int adoptionCountSelect(String memberId);


}
