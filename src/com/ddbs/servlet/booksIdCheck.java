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
import com.ddbs.model.Books;

@WebServlet(name="booksIdCheck",urlPatterns={"/booksIdCheck"})
public class booksIdCheck extends HttpServlet{
	BookDao bd=new BookDaoImpl();
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String inputId=request.getParameter("inputId");
	Books book=bd.CheckBookById(inputId);
	PrintWriter out=response.getWriter();
	if(book!=null){
		out.write("exit");
	}else{
		out.write("noExit");
	}
}
}
