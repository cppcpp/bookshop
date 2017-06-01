package com.ddbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddbs.dao.imple.PassImpl;

public class PasswordServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setHeader("Content-Type", "text/html;charset=utf-8");
		
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		
		String old_pass = req.getParameter("old_pass");
		old_pass = old_pass.trim();
		System.out.println(":::"+old_pass);
		String u_account = (String)session.getAttribute("u_account");
		
		PassImpl passImpl = new PassImpl();
		Boolean check = passImpl.checkPass(u_account, old_pass);
		//System.out.println(check);
		if(check){
			out.print("success");
		}
		
	}
}
