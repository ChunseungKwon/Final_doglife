	var nowDate = new Date();
	function calendarMaker(target, date) {
	    if (date == null || date == undefined) {
	        date = new Date();
	    }
	    nowDate = date;
	    if ($(target).length > 0) {
	        var year = nowDate.getFullYear();
	        var month = nowDate.getMonth() + 1;
	        $(target).empty().append(assembly(year, month));
	    } else {
	        console.error("custom_calendar Target is empty!!!");
	        return;
	    }
	
	    var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
	    var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);
	
	
	    var tag = "<tr>";
	    var cnt = 0;
	    //빈 공백 만들어주기
	    for (i = 0; i < thisMonth.getDay(); i++) {
	        tag += "<td></td>";
	        cnt++;
	    }
	
	    //날짜 채우기
	    for (i = 1; i <= thisLastDay.getDate(); i++) {
	        if (cnt % 7 == 0) { tag += "<tr>"; }
			if(nowDate.getFullYear()==(new Date()).getFullYear() &&
				nowDate.getMonth()==(new Date()).getMonth() &&
				nowDate.getDate()==i){
				
				if(cnt%7 == 0 || cnt%7 ==6){
					tag += "<td class='check_today free_day' tdata='" + cnt + "' style='position:relative'><div></div>" + i + "</td>";
				}else{
					tag += "<td class='check_today' tdata='" + cnt + "' style='position:relative'><div></div>" + i + "</td>";
				}
	        }else if(nowDate.getFullYear()==(new Date()).getFullYear() &&
				nowDate.getMonth()==(new Date()).getMonth() &&
				i < (new Date().getDate())){
	        	tag += "<td class='old_day'>" + i + "</td>";
	        }else{
	        
	        	// tag += "<td tdata='" + cnt + "'>" + i + "</td>";	        	
	        	if(cnt%7 == 0 || cnt%7 ==6){
	        		tag += "<td class='free_day'>" + i + "</td>";
	        	}else{
	        		tag += "<td>" + i + "</td>";
	        	}	
	        }
	        cnt++;
	        if (cnt % 7 == 0) {
	            tag += "</tr>";
	        } 
	    }
	    $(target).find("#custom_set_date").append(tag);
	    calMoveEvtFn();
	    
	
	    function assembly(year, month) {
	    
	   		let todayBtnStyle = 'width: 80px; ';
		    todayBtnStyle += 'height: 38px; ';
		    todayBtnStyle += 'background: #656565; ';
		    todayBtnStyle += 'color: #fff; ';
		    todayBtnStyle += 'font-size: 16px; ';
		    todayBtnStyle += 'font-weight: bold; ';
		    todayBtnStyle += 'border-radius: 7px; ';
		    todayBtnStyle += 'cursor: pointer; ';
		    
		    let prevBtnStyle = 'width: 42px; ';
		    prevBtnStyle += 'height: 38px; ';
		    prevBtnStyle += 'background: #2C3E50; ';
		    prevBtnStyle += 'color: #fff; ';
		    prevBtnStyle += 'border-radius: 7px 0px 0px 7px; ';
		    prevBtnStyle += 'margin: 6px -8px 2px 2px; ';
		    prevBtnStyle += 'cursor: pointer; ';
		    
		    let nxtBtnStyle = 'width: 42px; ';
		    nxtBtnStyle += 'height: 38px; ';
		    nxtBtnStyle += 'background: #2C3E50; ';
		    nxtBtnStyle += 'color: #fff; ';
		    nxtBtnStyle += 'border-radius: 0px 7px 7px 0px; ';
		    nxtBtnStyle += 'cursor: pointer; ';
		    
	        var calendar_html_code =
	            "<table class='custom_calendar_table'>" +
	            "<colgroup>" +
	            "<col style='width:81px'/>" +
	            "<col style='width:81px'/>" +
	            "<col style='width:81px'/>" +
	            "<col style='width:81px'/>" +
	            "<col style='width:81px'/>" +
	            "<col style='width:81px'/>" +
	            "<col style='width:81px'/>" +
	            "</colgroup>" +
	            "<thead class='cal_date'>" +
	            "<th colspan='5'><span style='margin-left: 40px'>" + year + "</span>년 <span>" + month + "</span>월</th>" +
	            "<th colspan='2'>" +
	            "	<div style='display: inline-block; margin: 7px 41px;'>"+
	            "		<button type='button' class='gotoday' style='"+todayBtnStyle+"'>Today</button>"+
	            "	</div>" +
	            "	<div style='display: inline-block; position:relative; top:3px'>"+
	            "		<button type='button' class='prev' style='"+prevBtnStyle+"'><</button>" +
	            "		<button type='button' class='next' style='"+nxtBtnStyle+"'>></button>"+
	            "	</div></th>" +
	            "</thead>" +
	            "<thead  class='cal_week'>" +
	            "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
	            "</thead>" +
	            "<tbody id='custom_set_date'>" +
	            "</tbody>" +
	            "</table>";
	        return calendar_html_code;
	    }
	
	    function calMoveEvtFn() {
	        //전달 클릭
	        $(".custom_calendar_table").on("click", ".prev", function () {
	        	if(nowDate.getMonth()>(new Date()).getMonth()){
	            	nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
	            	calendarMaker($(target), nowDate);
	            }else{
	            	alert("지난달은 이동할 수 없습니다.");
	            }
	        });
	        //다음날 클릭
	        $(".custom_calendar_table").on("click", ".next", function () {
	            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
	            calendarMaker($(target), nowDate);
	        });
	        //일자 선택 클릭
	        $(".custom_calendar_table").on("click", "td", function () {
			    
			    $(".timeselect").remove();
	        
	            if($(this).attr("class")=="old_day"){
	            	//
	            }else{
	            	let clickYeak = nowDate.getFullYear();
			        let clickMonth = nowDate.getMonth() + 1;
			        let clickDay = $(this).text();
	            
					//let sday1 = $(this).attr("tdata");			      
			        //sday1 = sday1 % 7;
					//if(sday1 == 0 || sday1 == 6) {
					if($(this).attr("class")=="free_day"){	
						//alert("휴일입니다.");						
					}else{
			            $(".custom_calendar_table .select_day").removeClass("select_day");
			            $(this).removeClass("select_day").addClass("select_day");
			            
			            let clickDate = clickYeak + "-" +(clickMonth>9?clickMonth:"0"+clickMonth) + "-" + (clickDay>9?clickDay:"0"+clickDay);
			            //alert(clickDate+" 선택");
			            $(".f_reservation1_sel_date").val(clickDate);
			            selectinfo();
			            
					}
					
		        }
	        });
	        
	        
	        // Today 클릭
	        $(".custom_calendar_table").on("click", ".gotoday", function () {
	            $(".custom_calendar_table .select_day").removeClass("select_day");
	            calendarMaker($(target), (new Date()));
	        }); 
	      
	      
	      
	    }
	}