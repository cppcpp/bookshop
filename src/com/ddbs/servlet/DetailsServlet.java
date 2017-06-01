package com.ddbs.servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddbs.dao.imple.BookDaoImpl;
import com.ddbs.dao.imple.RecommendRelativeBooks;
import com.ddbs.model.Books;

public class DetailsServlet extends HttpServlet{
	//点击一本书  出现详情信息
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setHeader("Content-Type", "text/html;charset=utf-8");
		
		String b_id = req.getParameter("b_id");
		BookDaoImpl bookDaoImpl = new BookDaoImpl();
		
		//获取书籍的相关信息
		Books b = bookDaoImpl.CheckBookById(b_id);
		req.setAttribute("book", b);
		
		
		b_id = b_id.substring(0, 1);
		System.out.println(b_id);
		
		//获取推荐书籍   存到request中
		RecommendRelativeBooks relativeBooks = new RecommendRelativeBooks();
		Vector<Books> books = relativeBooks.relativeBooks(b_id);
		req.setAttribute("relative", books);
		
		req.getRequestDispatcher("details.jsp").forward(req, resp);
	}
}
