package com.ddbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Vector;

import javax.print.attribute.standard.NumberUpSupported;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.ddbs.dao.imple.DetailsInCart;
import com.ddbs.model.Cart;

public class DetailsCartServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setHeader("Content-Type", "text/html;charset=utf-8");
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		//System.out.println("tianji");
		String u_account = (String)session.getAttribute("u_account");
		if(u_account==null){
			System.out.println("你还没有登录");
			out.print("fail");
		}else{
			String num = req.getParameter("num");
			int nums = Integer.parseInt(num);
			String b_id = req.getParameter("b_id");
			System.out.println(b_id+","+num);
			
			DetailsInCart detailsInCart = new DetailsInCart();
			Cart cart = detailsInCart.inCart(u_account, b_id, nums);
			
			Vector<Cart> carts = (Vector<Cart>)session.getAttribute("carts");
			Enumeration enumeration = carts.elements();
			while(enumeration.hasMoreElements()){
				int cur_num = 0;
				Cart value = (Cart)enumeration.nextElement();
				if(value.getB_id().equals(b_id)){
					carts.remove(value);
					cur_num = value.getB_nums();
					cur_num += nums;
					cart.setB_nums(cur_num);
				}
				
			}
			carts.add(cart);
			
			session.setAttribute("carts", carts);
			System.out.println("添加购物车成功");
			
			Float price = (Float)session.getAttribute("num");
			price = price+cart.getB_sumdiscountprice();
			session.setAttribute("num", price);
			
			int nFloat = (Integer)session.getAttribute("s_nums");
			nFloat = nFloat+cart.getB_nums();
			session.setAttribute("s_nums", nFloat);
			out.println("success");
		}
		
		
		
		/*out.println("加入购物车"+"<a href='index.jsp'>返回首页</a>");*/
		
	}
}
