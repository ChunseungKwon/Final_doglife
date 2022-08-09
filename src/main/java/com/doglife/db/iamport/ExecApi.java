package com.doglife.db.iamport;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashMap;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ExecApi {

	final String impKey = "7418989901133790";	
	final String impSecret = "006fad038c91c05395dcabf54664c4a70e88cb85a54584dd291338a7ec39cd6ba23991469aa8e288";
	final String getTokenURI = "https://api.iamport.kr/users/getToken";
	final String refundURI = "https://api.iamport.kr/payments/cancel";
	
	public String refundProcessing(String mcid, int price, String reason) 
			throws IOException, InterruptedException {

		// API 토큰 생성
		@SuppressWarnings("serial")
		var values = new HashMap<String, String>() {
			{
				put("imp_key", impKey);
				put("imp_secret", impSecret);
			}
		};
		
		var objectMapper = new ObjectMapper();
		String requestBody = objectMapper.writeValueAsString(values);
		
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest
				.newBuilder()
				.setHeader("Content-Type", "application/json")
				.uri(URI.create(getTokenURI))
				.POST(HttpRequest.BodyPublishers.ofString(requestBody))
				.build();
		
		HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
		String rsTokenJson = response.body();	
		//System.out.println("rsTokenJson=[" + rsTokenJson + "]");
		
		JSONObject json1 = new JSONObject(rsTokenJson);
		JSONObject json2 = (JSONObject) json1.get("response");
		String rsToken = json2.getString("access_token");
		System.out.println("Token=[" + rsToken + "]");
		
		// 취소 진행
		String resultMsg = "";
		@SuppressWarnings("serial")
		var values2 = new HashMap<String, String>() {
			{
				put("merchant_uid", mcid);	
				put("cancel_request_amount", Integer.toString(price));
				put("reason", reason);
			}
		};

		var objectMapper2 = new ObjectMapper();
		requestBody = objectMapper2.writeValueAsString(values2);

		HttpClient client2 = HttpClient.newHttpClient();
		HttpRequest request2 = HttpRequest
				.newBuilder()
				.setHeader("Content-Type", "application/json")
				.setHeader("Authorization", rsToken)
				.uri(URI.create(refundURI))
				.POST(HttpRequest.BodyPublishers.ofString(requestBody))
				.build();

		HttpResponse<String> response2 = client2.send(request2, HttpResponse.BodyHandlers.ofString());

		String rsData = response2.body();
		rsData = convertString(rsData);
		System.out.println("refund.result= " + rsData);
		
		json1 = new JSONObject(rsData);

		String returnCode = "";
		try {
			json2 = (JSONObject) json1.get("response");
			resultMsg = json2.getString("status");	
			
			if(resultMsg.equals("cancelled")) {
				returnCode = "REFUND_SUCCESS";
			}else {
				returnCode = "REFUND_FAILED";
			}
		}catch(Exception e) {
			resultMsg = json1.getString("message");
			if(resultMsg.equals(null)) {
				resultMsg = "";
				System.out.println("message is null");
			}else {
				System.out.println("message=["+resultMsg+"]");
			}
			
			if(resultMsg.equals("이미 전액취소된 주문입니다.")) {
				returnCode = "REFUND_I_MEY_CHE_SO_ZU_MUN";
			}else if(resultMsg.equals("Unauthorized")) {
				returnCode = "REFUND_UNAUTH";
			}
		}
		
		return returnCode;
		
	}
	
	public String convertString(String val) {  
			
		String returnVal = "";
		try {
			StringBuffer sb = new StringBuffer();  	
			for (int i = 0; i < val.length(); i++) {   				
				if ('\\' == val.charAt(i) && 'u' == val.charAt(i + 1)) {      
					// 네글자는 유니코드의 16진수 코드이다. int형으로 바꾸어서 다시 char 타입으로 강제 변환한다.      
					Character r = (char) Integer.parseInt(val.substring(i + 2, i + 6), 16);      
					// 변환된 글자를 버퍼에 넣는다.      
					sb.append(r);      
					// for의 증가 값 1과 5를 합해 6글자를 점프      
					i += 5;    
				} else {      
					// ascii코드면 그대로 버퍼에 넣는다.      
					sb.append(val.charAt(i));    
				}  
			}  
			returnVal = sb.toString();
		}catch(Exception e) {
			returnVal = val;
		}

		return returnVal;			
	}

}
