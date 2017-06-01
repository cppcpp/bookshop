package com.ddbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddbs.dao.imple.OrderAction;

public class AddressServlet extends HttpServlet{
	//增加地址
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setHeader("Content-Type", "text/html;charset=utf-8");
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		
		String u_accoount = (String)session.getAttribute("u_account");
		String person = req.getParameter("person");
		System.out.println(person);
		String address = req.getParameter("address");
		System.out.println(address);
		String phone = req.getParameter("phone");
		System.out.println(phone);
		String radio_check = req.getParameter("check_radio");
		System.out.println(radio_check);
		
		OrderAction orderAction = new OrderAction();
		//是否默认
		if(radio_check.equals("1")){
			orderAction.setDefault(u_accoount);
			orderAction.updateAddress(person,address, phone, 1, u_accoount);
		}else{			
			boolean check = orderAction.updateAddress(person, address, phone, 0, u_accoount);
			if(check){
				System.out.println("增加地址成功");
				out.println("okay");
			}
		}
		
	}
	

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
