package com.doglife.db.util;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class PagingUtil {
	private int maxNum;
	private int pageNum;
	private int listCnt;
	private int pageCnt;
	private String listName;


	public String makePaging() {
		String page = null;
		StringBuffer sb = new StringBuffer();
		//maxum 전체 페이지 // listcnt 한게시물에 보여줄 갯수 
		int totalPage = (maxNum % listCnt)>0  ? maxNum/listCnt+1: maxNum/listCnt;
		//
		int currentGroup = (pageNum % pageCnt)>0 ? pageNum/pageCnt+1: pageNum/pageCnt;
		//
		int startNum = (currentGroup * pageCnt) - (pageCnt - 1);
		//
		int endNum = (currentGroup * pageCnt) >= totalPage ? totalPage : currentGroup * pageCnt;
		sb.append("<ul class='pagination pull-right'>");
		if(startNum != 1) {
			sb.append("<li><a href='./" + listName + "pageNum=" + (startNum-1)+ "'>");
			sb.append("&nbsp;이전&nbsp;</a></li>");
		}


		for(int i = startNum; i <=endNum; i++) {
			if(pageNum != i) {
				sb.append("<li><a href='./" + listName + "pageNum=" + i  + "'>");
				sb.append("&nbsp;" + i + "&nbsp;</a></li>");
			}
			else {
				sb.append("<li><a href='#'><font style='color:red;'>");
				sb.append("&nbsp;" + i + "&nbsp;</font></a></li>");
			}

		}

		if(endNum != totalPage) {
			sb.append("<li><a href='./" + listName + "pageNum=" + (endNum + 1)+ "'>");
			sb.append("&nbsp;다음&nbsp;</a>");
		}
		
		sb.append("</ul>");
		page = sb.toString();

		return page;

	}

}
