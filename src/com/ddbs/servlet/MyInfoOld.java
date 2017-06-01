package com.ddbs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddbs.dao.imple.MineInfo;
import com.ddbs.model.Users;

/**
 * Servlet implementation class MyInfo
 */
@WebServlet("/MyInfoOld")
public class MyInfoOld extends HttpServlet {

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String uAccount = session.getAttribute("u_account").toString();
		
		MineInfo mineInfo = new MineInfo();
		Users myInfo = new Users();
		myInfo = mineInfo.showAllInfo(uAccount);
		session.setAttribute("myInfoOld", myInfo);
		response.sendRedirect("myInfo.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
