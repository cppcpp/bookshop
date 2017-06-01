package com.ddbs.servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddbs.dao.BookDao;
import com.ddbs.dao.imple.BookDaoImpl;
import com.ddbs.model.Books;

@WebServlet(name="booksList",urlPatterns={"/booksList"})
public class booksListServlet extends HttpServlet{
	BookDao bd=new BookDaoImpl();
	Vector<Books> vec;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		vec=bd.CheckAllBooks();
		if(vec!=null){
			request.getSession().setAttribute("booksList",vec);
		}
		response.sendRedirect("booksList.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
