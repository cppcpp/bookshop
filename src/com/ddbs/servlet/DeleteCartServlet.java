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
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.websocket.Session;

import com.ddbs.model.Cart;


@WebServlet(name="demo",urlPatterns={"/demo"})
public class DeleteCartServlet extends HttpServlet{
	//删除购物车数据
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setHeader("Content-Type", "text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		String b_id = req.getParameter("b_id");
		Vector<Cart> carts = (Vector<Cart>)session.getAttribute("carts");
		Enumeration enumeration = carts.elements();
		
		int s_nums = 0,num = 0;;
		while (enumeration.hasMoreElements()) {
			Cart value = (Cart) enumeration.nextElement();
			if(value.getB_id().equals(b_id)){
				carts.removeElement(value);
			}else{
				s_nums += value.getB_nums();
				num += value.getB_sumdiscountprice();
			}
		}
		
		session.setAttribute("carts", carts);
		session.setAttribute("s_nums", s_nums);
		session.setAttribute("num", num);
	}
}
