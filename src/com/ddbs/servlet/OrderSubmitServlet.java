package com.ddbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddbs.dao.imple.OrderHandle;
import com.ddbs.model.Cart;
import com.ddbs.model.OrderDetail;
import com.ddbs.model.Orders;

public class OrderSubmitServlet extends HttpServlet{
	//确认提交订单  等待支付
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setHeader("Content-Type", "text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		int num = 0;
		float sum_price = 0,ac_price=0,cheaper = 0;
		//Vector<Orders> orders = new Vector<Orders>();
		
		Orders orderModel = new Orders();
		Date time = new Date();
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");   
		String time_id = "";
		time_id = sdf.format(time);
		
		
		Vector<Cart> order = (Vector<Cart>)session.getAttribute("order");
		//o_id的规则
		String u_account = (String)session.getAttribute("u_account");
		String o_id = u_account+"_"+time_id;
		String person = req.getParameter("a_person");
		String address = req.getParameter("a_address");
		String phone = req.getParameter("a_phone");
		
		OrderHandle handle = new OrderHandle();
		Enumeration enumeration = order.elements();
		while(enumeration.hasMoreElements()){
			Cart value = (Cart) enumeration.nextElement();
			num += value.getB_nums();
			sum_price += value.getB_sumprice();
			ac_price += value.getB_sumdiscountprice();
			
			String b_id = value.getB_id();
			String b_name = value.getB_name();
			int b_nums = value.getB_nums();
			float b_price = value.getB_price();
			float b_ac_price = value.getB_discountprice();
			float b_sum_price = value.getB_sumprice();
			float b_dis_sumPrice = value.getB_sumdiscountprice();
			
			OrderDetail detail = new OrderDetail(o_id,b_id,b_name,b_nums,b_price,b_ac_price,b_sum_price,b_dis_sumPrice);
			//更新数据库中的数据   books表和推荐表
			handle.insertDetail(detail);
		}
		cheaper = sum_price-ac_price;	
		Orders o = new Orders(o_id,num,ac_price,u_account,address,phone,person,cheaper);
		//写入orders表中
		boolean check = handle.insertOrder(o);
		
		//提交成功  提交成功后 购物车中的数据也应该改变
		if(check){
			//订单确认提交之后，购物车里面的数据也应该改变
			Vector<Cart> carts = (Vector<Cart>)session.getAttribute("carts");
			carts.removeAll(order);
			session.setAttribute("carts", carts);
			Float nums = (Float)session.getAttribute("num");
			int s_num = (Integer)session.getAttribute("s_nums");
			//float num_sum = Float.parseFloat(nums);
			session.setAttribute("num", nums-ac_price);
			session.setAttribute("s_nums", s_num-num);
			
			
			
			out.println("订单提交，等待付款");
		}
	}
}
