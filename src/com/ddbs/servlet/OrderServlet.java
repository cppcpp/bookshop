package com.ddbs.servlet;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddbs.dao.imple.OrderAction;
import com.ddbs.model.Cart;
import com.ddbs.model.UserAddress;

public class OrderServlet extends HttpServlet{
	//订单页面展示
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		Vector<Cart> carts = (Vector<Cart>)session.getAttribute("carts");
		Enumeration enu = carts.elements();
		Vector<Cart> order = new Vector<Cart>();
		
		float order_sum = 0;
		while(enu.hasMoreElements()){
			Cart value = (Cart)enu.nextElement();
			String b_id = req.getParameter(value.getB_id());
			//System.out.println(b_id);
			//System.out.println(b_id);//选中的为on  没有选中的为null
			if(b_id != null){
				order.addElement(value);
				order_sum += value.getB_sumdiscountprice();
			}
		}
		order_sum = (float)(Math.round(order_sum*100))/100;

		
		//从数据库中取出默认地址
		String u_account = (String)session.getAttribute("u_account");
		OrderAction oAction  = new OrderAction();
		Vector<UserAddress> addresses = oAction.getAddress(u_account);
		req.setAttribute("address", addresses);
		session.setAttribute("order", order);
		req.setAttribute("order_sum", order_sum);
		
		//从数据库中取出所有的地址
		Vector<UserAddress> allAddress = oAction.getAllAddress(u_account);
		req.setAttribute("allAddress", allAddress);
		
		req.getRequestDispatcher("order.jsp").forward(req, resp);
	}
}
