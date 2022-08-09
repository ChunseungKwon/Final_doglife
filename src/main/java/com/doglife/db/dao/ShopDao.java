package com.doglife.db.dao;

import java.util.List;
import java.util.Map;

import com.doglife.db.dto.MyOrderDto;
import com.doglife.db.dto.ProductDto;
import com.doglife.db.dto.ProductFileDto;
import com.doglife.db.dto.ProductListDto;
import com.doglife.db.dto.ProductOptionDto;
import com.doglife.db.dto.ShopQnADto;
import com.doglife.db.dto.ShopReplyDto;
import com.doglife.db.dto.ShopReviewDto;

public interface ShopDao {

	// 신제품 목록 가져오기
	public List<ProductDto> selectNewProductList(ProductListDto pnum);

	// 베스트제품 목록 가져오기
	public List<ProductDto> selectBestProductList(ProductListDto pnum);

	// 전체 제품 목록 가져오기
	public List<ProductDto> selectProductList(ProductListDto pnum);

	// 전체 글개수 구하기
	public int bcntSelect(ProductListDto productList);

	// 제품 정보 가져오기
	public ProductDto selectProductInfo(Integer pnum);

	// 옵션 목록 가져오기
	public List<ProductOptionDto> selectProductOption(Integer pnum);

	// 파일 목록 가져오기
	public List<ProductFileDto> selectProductFile(Integer pnum);

	// Q&A 목록 가져오기
	public List<ShopQnADto> selectProductQnA(Integer pnum);

	// 후기 목록 가져오기
	public List<ShopReplyDto> selectProductReply(Integer pnum);

	// Q&A 질문 저장하기
	public void insertQuestion(ShopQnADto qna);

	// 제품 판매자 검색
	public String selectSeller(int pnum);

	public void addThumbnail(ProductDto product);

	public float getRatingAverage(int pnum);

	public void updateRating(ShopReviewDto review);

	// Review
	public void insertReview(ShopReviewDto review);

	public void insertReviewImage(Map<String, String> fmap);

	// Get one OrderDate
	public MyOrderDto getOneOrderData(String orderNum);

	// Customer's Orderlist
	public List<MyOrderDto> customerOrderList(String memberId);

}
