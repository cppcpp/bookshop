package com.ddbs.servlet;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddbs.dao.imple.MineOrder;
import com.ddbs.model.OrderDetail;
import com.ddbs.model.Orders;

/**
 * Servlet implementation class MyOrders
 */
@WebServlet("/MyOrders")
public class MyOrders extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        HttpSession session = request.getSession();
		
		String uAccount = session.getAttribute("u_account").toString();
		
		MineOrder mineOrder = new MineOrder();
		Vector<Orders> tempOrders = new Vector<Orders>();
		List<OrderDetail> resultList = new LinkedList<>();
		tempOrders = mineOrder.showMyOrders(uAccount);
		for (Orders orders : tempOrders) {
			Vector<OrderDetail> tempOrderDetail = new Vector<OrderDetail>();
			tempOrderDetail = mineOrder.showMyOrdersDetail(orders);
			for (OrderDetail orderDetail : tempOrderDetail) {
				resultList.add(orderDetail);
			}
		}
		session.setAttribute("myorders", tempOrders);
		session.setAttribute("orderDetailList", resultList);
		response.sendRedirect("allorder.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
