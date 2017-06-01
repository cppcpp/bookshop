package com.ddbs.util;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Page {
	private int pageSize;//每页显示的记录数
	private int pageCount;//总页数
	private int curPage;//当前页
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	//计算总页数
	public void setPageCount(ResultSet rs) {
		try {
			rs.last();//将游标移动到最后一行
			int lastrow=rs.getRow();//显示当前行号：从一开始
			if(lastrow%pageSize==0){
				pageCount=lastrow/pageSize;
			}else{
				pageCount=lastrow/pageSize+1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public int getPageCount() {
		return pageCount;
	}
	
	//设置要显示的页
	public void setCurPage(int row) {
		if (row<=1)
			curPage=1;
		else if(row>=pageCount){
			curPage=pageCount;
		}else{
			curPage=row;
		}
	}
	
	public int getCurPage() {
		return curPage;
	}
	
	//根据页数设置结果集
	public ResultSet setResultset(ResultSet rs){
		try {
			//System.out.println("根据页数设置结果集:"+(curPage-1)*pageSize+1+"curPage,,pageSize::"+curPage+"--"+pageSize);
			rs.absolute((curPage-1)*pageSize+1);//将游标移动到指定行
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
}
