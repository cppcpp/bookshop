package com.ddbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddbs.dao.imple.Register;
import com.ddbs.model.Users;

//×¢²áÓÃ»§
public class RegisterServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setHeader("Content-Type", "text/html;charset=utf-8");
		
		
		PrintWriter out = resp.getWriter();
		
		
		String u_account = req.getParameter("u_account");
		String u_password = req.getParameter("u_password");
		String u_name = req.getParameter("u_name");
		String u_mail = req.getParameter("u_email");
		String u_phone = req.getParameter("u_phone");
		
		Users user = new Users();
		user.setU_account(u_account);
		user.setU_mail(u_mail);
		user.setU_name(u_name);
		user.setU_password(u_password);
		user.setU_phone(u_phone);
		
		Register register = new Register();
		Boolean check = register.addUser(user);
		if(check){
			System.out.println("×¢²á³É¹¦");
			out.println("×¢²á³É¹¦");
		}else{
			System.out.println("×¢²áÊ§°Ü");
		}
		
	}
}
