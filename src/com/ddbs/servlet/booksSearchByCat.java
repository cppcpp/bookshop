package com.ddbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(name="booksSearchByCat",urlPatterns={"/booksSearchByCat","/booksSearchByCat2"})
public class booksSearchByCat extends HttpServlet{
	BookDaoImpl bdi=new BookDaoImpl();
	Vector<Books> vec=null;
	Map map=null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		//System.out.println("请求地址："+uri);	
		PrintWriter out=response.getWriter();
		String category=request.getParameter("category");
		//System.out.println("catgory::"+category);
		
		int curPage=1;//默认当前页数为1
		int pageSize;
		//int pageSize=10;//默认每页显示10条记录
		String tempCurPage=request.getParameter("curPage");
		String tempPageSize=request.getParameter("pageSize");
		System.out.println("tempPageSize::"+tempPageSize);
		if(tempPageSize==null ||"".equals(tempPageSize)){
			pageSize=8;//默认9条
		}else{
			int tempPageSize2=Integer.parseInt(tempPageSize);
			request.getSession().setAttribute("pageSize",tempPageSize2);
			pageSize=Integer.parseInt(String.valueOf(request.getSession().getAttribute("pageSize")));
		}
		
		if(tempCurPage!=null){
			curPage=Integer.parseInt(tempCurPage);
		}
		map=bdi.CheckBookByCat(category,curPage,pageSize);
		vec=(Vector<Books>) map.get("vec");
		Page page=(Page) map.get("page");
		//System.out.println("当前页数："+curPage);
		//System.out.println("page的总页数："+page.getPageCount());
		if(vec!=null){
			request.getSession().setAttribute("booksList",vec);
			request.getSession().setAttribute("curPage", page.getCurPage());//向显示页传递当前页页码
	  		request.getSession().setAttribute("pageCount",page.getPageCount());//向显示页传递总页数
			if(uri.equals("/bookshop/booksSearchByCat")){
				String flag=(String) request.getSession().getAttribute("flag");
				if(flag!=null){
					response.sendRedirect("booksCart.jsp");
					request.getSession().setAttribute("flag", null);
				}
				out.write("booksCart.jsp");
			}
			if(uri.equals("/bookshop/booksSearchByCat2")){
				out.write("category1.jsp");
			}
		}else{
			out.write("fail");
		}
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
