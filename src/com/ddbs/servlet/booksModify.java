package com.ddbs.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddbs.dao.BookDao;
import com.ddbs.dao.imple.BookDaoImpl;
import com.ddbs.model.Books;

@WebServlet(name="booksModify",urlPatterns={"/booksModify"})
public class booksModify extends HttpServlet{
	BookDao bd=new BookDaoImpl();
	Books book=null;
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String b_id=request.getParameter("book_id");
	String b_name=request.getParameter("book_name");
	String b_description=request.getParameter("book_description");
	float b_price=Float.parseFloat(request.getParameter("book_price"));
	//保留两位小数
	float float_price = (float)(Math.round(b_price*100))/100;
	int b_discount=Integer.parseInt(request.getParameter("book_discount"));
	String b_author=request.getParameter("book_author");
	String b_press=request.getParameter("book_press");
	String b_press_time=request.getParameter("book_press_time");
	String b_service=request.getParameter("book_service");
	Date date=Date.valueOf(b_press_time);
	System.out.println(b_id+b_name+b_description+b_price+float_price+b_discount+b_author+b_press+date+b_service);
	book=new Books(b_id, b_name, b_description,float_price, b_discount, b_author, b_press, date, b_service);
	boolean isModify=bd.ModifyBook(book);
//	book.toString();
	if(isModify){
		String cat=book.getB_id().substring(0, 1);
		System.out.println(cat);
		request.getSession().setAttribute("flag", "Servlet");
		request.getRequestDispatcher("booksSearchByCat?category="+cat).forward(request, response);
	}

	}
}
