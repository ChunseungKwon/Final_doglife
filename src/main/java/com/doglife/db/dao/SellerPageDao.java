package com.doglife.db.dao;

import java.util.List;
import java.util.Map;

import com.doglife.db.dto.ProductDto;
import com.doglife.db.dto.ProductFileDto;
import com.doglife.db.dto.ProductOptionDto;
import com.doglife.db.dto.SellerOrderListDto;
import com.doglife.db.dto.ShopQnADto;
import com.doglife.db.dto.ShopReviewDto;


public interface SellerPageDao {

	//게시글 목록 가져오기
	public List<ProductDto> selectProductList(String sellerID);
	//게시글 목록 가져오기
	public List<SellerOrderListDto> selectOrderedList(String sellerID);
	//배송 목록 가져오기
	public List<SellerOrderListDto> selectDeliveredList(String sellerID);
	//환불 목록 가져오기
	public List<SellerOrderListDto> selectRefundList(String sellerID);
	//주문 상태 수정
	public void deliverProduct(int orderNum);

	public void refundProduct(int orderNum);
	//제품 등록하기
	public void insertProduct(ProductDto product);
	//옵션 등록하기
	public void insertOption(ProductOptionDto productOption);
	//파일(제품사진) 등록하기
	public void insertProductImage(Map<String, String> fmap);
	//thumbnail 등록하기
	public void addThumbnail(ProductDto product);
	
	public ProductDto getProductList(Integer pnum);

	public List<ProductFileDto> getProductImage(Integer pnum);
	
	public List<ProductOptionDto> getProductOption(Integer pnum);
	
	public void updateProductInfo(ProductDto product);
	
	public void updateProductOption(ProductOptionDto poption);
	
	public void updateProductImage(ProductFileDto pfile);
	
	public void deleteProduct(Integer pnum);
		
	public void deleteProductOption(Integer pnum);
	
	public void deleteProductImage(Integer pnum);
	//Q&A List
	public List<ShopQnADto> selectQnaList(String sellerID);
	//Q&A Answer (update)
	public void insertAnswer(ShopQnADto qna);
	//Q&A List
	public ShopQnADto selectQnaAnswer(int i);
	
	public void deleteProductQnA(int pnum);
	
	public void deleteProductReview(int pnum);


}
