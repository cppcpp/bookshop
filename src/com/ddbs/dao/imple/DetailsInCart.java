package com.ddbs.dao.imple;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.text.FlowView.FlowStrategy;

import com.ddbs.db.DbConn;
import com.ddbs.model.Books;
import com.ddbs.model.Cart;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class DetailsInCart {
	public Cart inCart(String u_account,String b_id,int num){
		
		BookDaoImpl bookDaoImpl = new BookDaoImpl();
		Books b = bookDaoImpl.CheckBookById(b_id);
		
		Float dis_price = b.getB_price()*b.getB_discount()/100;
		Float sum_disPrice = dis_price*num;
		Float sum_price = b.getB_price()*num;
		Cart cart = new Cart(u_account, b.getB_id(), b.getB_name(), num, b.getB_price(), dis_price, sum_price, sum_disPrice);
		return cart;
	}
}
