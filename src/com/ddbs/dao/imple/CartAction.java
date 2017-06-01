package com.ddbs.dao.imple;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.Vector;

import com.ddbs.db.DbConn;
import com.ddbs.model.Cart;
import com.sun.corba.se.spi.orbutil.fsm.State;
import com.sun.xml.internal.ws.developer.StreamingAttachment;

public class CartAction {
	
	//从数据库中取出数据
	DbConn db = new DbConn();
	Connection conn = db.getConn();
	public Vector<Cart> getData(String u_account){
		try {
			Vector<Cart> carts = new Vector<Cart>();
			Statement stm = conn.createStatement();
			String sql = "select * from cart where u_account="+"\""+u_account+"\""; 
			ResultSet rSet = stm.executeQuery(sql);
			while(rSet.next()){
				Cart cart = new Cart(rSet.getString(1),rSet.getString(2),rSet.getString(3),rSet.getInt(4),rSet.getFloat(5),rSet.getFloat(6),rSet.getFloat(7),rSet.getFloat(8));
				carts.addElement(cart);
			}
			return carts;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//获取总价
	public float getNum(String u_account){
		float num = 0;
		try {
			Statement statement = conn.createStatement();
			String sql = "select b_sumdiscountprice from cart where u_account="+"\""+u_account+"\"";
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()){
				num += rs.getFloat(1);
			}
			DecimalFormat df = new DecimalFormat( "0.00"); 
			System.out.println(df.format(num));
			return num;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return num;
	}
	
	
	
	//获取数量
	public int gets_Num(String u_account){
		int num = 0;
		try {
			Statement statement = conn.createStatement();
			String sql = "select b_nums from cart where u_account="+"\""+u_account+"\"";
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()){
				num += rs.getFloat(1);
			}
			//DecimalFormat df = new DecimalFormat( "0.00"); 
			//System.out.println(df.format(num));
			return num;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return num;
	}
	
	//更新购物车表
	public boolean updateCart(String b_id,int num,float price,float dis_pri){
		try {
			Statement stm = conn.createStatement();
			String sql = "update cart set b_nums="+"\""+num+"\",b_sumprice="+num*price+",b_sumdiscountprice="+num*dis_pri+" where b_id="+"\""+b_id+"\"";
			System.out.println(sql);
			stm.executeUpdate(sql);
			System.out.println("更新cart表成功");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//将购物车里面的数据清空
	public void truncateCart(String u_account){
		String sql = "delete from cart where u_account="+"\""+u_account+"\"";
		try {
			Statement statement = conn.createStatement();
			statement.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	//session结束的时候将数据写入数据库中
	public boolean updateCarts(Cart value,String u_account){
		int num = value.getB_nums();
		float price = (value.getB_price())*num;
		float dis_pri = (value.getB_discountprice())*num;
		String sql = "insert into cart values(?,?,?,?,?,?,?,?)";
		System.out.println(sql);
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, u_account);
			pstm.setString(2, value.getB_id());
			pstm.setString(3,value.getB_name());
			pstm.setInt(4, num);
			pstm.setFloat(5, value.getB_price());
			pstm.setFloat(6, value.getB_discountprice());
			pstm.setFloat(7, price);
			pstm.setFloat(8, dis_pri);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	
}
