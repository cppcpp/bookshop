package com.ddbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddbs.dao.BookDao;
import com.ddbs.dao.imple.BookDaoImpl;


@WebServlet(name="booksDelete",urlPatterns={"/deleteBook"})
public class booksDelete extends HttpServlet{
	BookDao bd=new BookDaoImpl();
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter out=response.getWriter();
	String b_id=request.getParameter("id");
	System.out.println(b_id);
	boolean isRemove=bd.RemoveBook(b_id);
	System.out.println("boolean"+isRemove);
	if(isRemove){
		out.write("success");
		//response.sendRedirect("booksList");
	}else{
		out.write("fail");
	}
}
}
