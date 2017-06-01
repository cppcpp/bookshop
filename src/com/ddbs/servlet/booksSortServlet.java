package com.ddbs.servlet;

import java.io.IOException;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddbs.dao.imple.BookDaoImpl;
import com.ddbs.model.Books;
import com.ddbs.util.Page;

@WebServlet(name="sortServlet",urlPatterns={"/sort"})
public class booksSortServlet extends HttpServlet{
	BookDaoImpl bdi=new BookDaoImpl();
	Vector<Books> vec=new Vector();
	Map map=null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cat=request.getParameter("cat");
		String sortCat=request.getParameter("sortCat");
		String whichSort=request.getParameter("whichSort");
		String minPriceS=request.getParameter("minPrice");
		String maxPriceS=request.getParameter("maxPrice");
		int minPrice;
		int maxPrice;
		
		if(whichSort==null||whichSort.equals("")){
			whichSort="desc";
		}
		
		if(minPriceS==null||minPriceS.equals("")){
			minPrice=-1;
		}else{
			 minPrice=Integer.parseInt(minPriceS);
		}
		if(maxPriceS==null||maxPriceS.equals("")){
			maxPrice=999;
		}else{
			maxPrice=Integer.parseInt(maxPriceS);
		}
		
		System.out.println("++cat:"+cat+"+++sortCat:"+sortCat+"+++whichSort++"+whichSort);
		int curPage=1;//默认当前页数为1
		int pageSize;
		//int pageSize=10;//默认每页显示10条记录
		String tempCurPage=request.getParameter("curPage");
		String tempPageSize=request.getParameter("pageSize");
		System.out.println("tempPageSize::"+tempPageSize);
		if(tempPageSize==null ||"".equals(tempPageSize)){
			pageSize=9;//默认10条
		}else{
			int tempPageSize2=Integer.parseInt(tempPageSize);
			request.getSession().setAttribute("pageSize",tempPageSize2);
			pageSize=Integer.parseInt(String.valueOf(request.getSession().getAttribute("pageSize")));
		}
		
		if(tempCurPage!=null){
			curPage=Integer.parseInt(tempCurPage);
		}
		
		
			map= bdi.sort(cat, sortCat,whichSort,curPage,pageSize,minPrice,maxPrice);
			vec=(Vector<Books>) map.get("vec");
		
		for(int i=0;i<vec.size();i++){
			Books book2=vec.get(i);
			System.out.println("价格++"+book2.getB_price());
		}
		Page page=(Page) map.get("page");
		if(vec!=null){
			request.getSession().setAttribute("booksList",vec);
			request.getSession().setAttribute("curPage", page.getCurPage());//向显示页传递当前页页码
	  		request.getSession().setAttribute("pageCount",page.getPageCount());//向显示页传递总页数
		}
	}
}
