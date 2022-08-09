package com.doglife.db;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import com.doglife.db.service.FueneralService;

import lombok.extern.java.Log;

@RestController
@Log
public class RestFuneralinfoController {
	
	
	@Autowired 
	private FueneralService fServ;
		
	@PostMapping(value = "/frTimeSelect", produces = "application/json; charset=UTF-8")
	public List<String> fr_time_select(String date) {				
		List<String> frTimeList = fServ.fr_time_select(date);
		
		log.info("frTimeList.count="+frTimeList.size());
		
		List<String> rmap = new ArrayList<String>();
		
		for(int i=0; i<frTimeList.size(); i++) {
			String time = frTimeList.get(i);
			log.info("time="+time);
			
			rmap.add(time);
		}	
		return rmap;
	}
	
}//class end




