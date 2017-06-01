package com.ddbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddbs.dao.imple.BookDaoImpl;
import com.ddbs.model.Books;

@WebServlet(name="bookSearch",urlPatterns={"/booksSearch"})
public class booksSearch extends HttpServlet{
	BookDaoImpl bdi=new BookDaoImpl();
	Vector<Books> vec=null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out=response.getWriter();
		String serCon=request.getParameter("search_con");
		String serInput=request.getParameter("search_input");
		String cat=request.getParameter("cat");
		
		System.out.println(serCon+"+ ‰»Î+"+"%"+serInput+"%"+"cat::"+cat);
		if(serInput==""||serInput==null){
			out.print("searchByCat");
			return ;
		}else if(serCon!=""&&serCon!=null&&serInput!=""&&serInput!=null){
			vec= bdi.CheckBook(serCon,serInput,cat);
		}
		
		Enumeration en = vec.elements();
		while(en.hasMoreElements()){
			Books value = (Books)en.nextElement();
			System.out.println("vec:::;b_id::"+value.getB_id());
		}
		if(vec==null)
			{
				System.out.println("vecŒ™ø’");
			}
		
		
		if(vec!=null){
			request.getSession().setAttribute("booksList",vec);
			out.print("flush");
		}
	}
}
