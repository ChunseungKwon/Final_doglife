package com.doglife.db.dao;

import java.util.List;

import com.doglife.db.dto.MyOrderDto;
import com.doglife.db.dto.ProductDto;
import com.doglife.db.dto.ShopReviewDto;


public interface CustomerPageDao {
	
	//Orderlist
	public List<MyOrderDto> selectOrderedList(String sellerID);
	
	//Register
	public void productReviewRegister (ShopReviewDto review);
	
	//Getting rating
	public Double getRatingAverage(int pnum); 
	
	public int getTotalReviews(int pnum);
	
	//Review rate
	public void updateRating(ProductDto product);
	
	//update Review
	public void updateProductReview (Integer pnum);
	
	public void updateProductImage(ShopReviewDto review);
	
	public void deleteProductImage(Integer pnum);

	//delete Review
	public void deleteProductReview (Integer pnum) ;

}
