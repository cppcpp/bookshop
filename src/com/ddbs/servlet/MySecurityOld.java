package com.ddbs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddbs.dao.imple.MineInfo;
import com.ddbs.dao.imple.MineSecurity;
import com.ddbs.model.Users;


@WebServlet("/MySecurityOld")
public class MySecurityOld extends HttpServlet {

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String uAccount = session.getAttribute("u_account").toString();
		
		MineSecurity mineSecurity = new MineSecurity();
		Users mySecurity = new Users();
		mySecurity = mineSecurity.showAllSecurity(uAccount);
		session.setAttribute("mySecurityOld", mySecurity);
		response.sendRedirect("account.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
