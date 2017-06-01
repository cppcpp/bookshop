package com.ddbs.servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddbs.dao.imple.MyAddress;
import com.ddbs.model.UserAddress;

/**
 * Servlet implementation class MyAddress
 */
@WebServlet("/MyAddressOld")
public class MyAddressOld extends HttpServlet {
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String uAccount = session.getAttribute("u_account").toString();
		
		MyAddress myAddress = new MyAddress();
		Vector<UserAddress> tempVec = new Vector<UserAddress>();
		tempVec = myAddress.showAllInfo(uAccount);
		int count = myAddress.getNumOfAddress();
		session.setAttribute("myAddresses", tempVec);
		session.setAttribute("numOfAddress", count);
		response.sendRedirect("address.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
