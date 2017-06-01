package com.ddbs.listener;

import java.sql.ResultSet;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.ddbs.action.TopAndLatestBooks;
import com.ddbs.dao.imple.CartAction;
import com.ddbs.dao.imple.SpecialBooks;
import com.ddbs.model.Books;
import com.ddbs.model.Cart;

public class SessionListener implements HttpSessionListener{

	public void sessionCreated(HttpSessionEvent event) {
		System.out.println("session start");
		HttpSession session = event.getSession(); 

		//销量前三位
		TopAndLatestBooks topAndLatestBooks = new TopAndLatestBooks();
		Vector<Books> topBooks = topAndLatestBooks.topBooks(3);
		session.setAttribute("top",topBooks);
		
		//新书上架
		Vector<Books> newBooks = topAndLatestBooks.latestBooks(3);
		session.setAttribute("newBooks",newBooks);
		
		//特价书籍
		SpecialBooks specialBooks = new SpecialBooks();
		Vector<Books> special = specialBooks.getSpecial();
		session.setAttribute("special", special);
		
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		//session结束的时候
		System.out.println("session stop");
		HttpSession session = event.getSession(); 
		CartAction cartAction = new CartAction();
		String u_account = (String)session.getAttribute("u_account");
		cartAction.truncateCart(u_account);
		
		Vector<Cart> carts = (Vector<Cart>)session.getAttribute("carts");
		session.setAttribute("order", null);
		Enumeration enumeration = carts.elements();
		while(enumeration.hasMoreElements()){
			Cart value = (Cart)enumeration.nextElement();
			cartAction.updateCarts(value, u_account);
		}
	}

}
