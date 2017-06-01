package com.ddbs.dao.imple;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.Vector;

import com.ddbs.db.DbConn;
import com.ddbs.model.OrderDetail;
import com.ddbs.model.Orders;
import com.mysql.jdbc.PreparedStatement;

public class MineOrder {
	
	DbConn dbConn = new DbConn();
	Connection connection = dbConn.getConn();
	String[] o_id;
	
	//按照下订单的时间 对用户的订单进行排序
	public Vector<Orders> showMyOrders(String uAccount){
		Vector<Orders> result = new Vector<Orders>();
		//treemap 默认按照key值升序排序
		Map<Long, Orders> map = new TreeMap<Long,Orders>();
		long currentTime = System.currentTimeMillis();
		long intervalTime;
		
		String sql="select o_id,o_num,o_price,o_time,o_cheaper,u_receiver from orders where u_account = ?";
//		System.out.println(sql);
		try {
			java.sql.PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, uAccount);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				//要把tempOrders实例化放到循环内部
				Orders tempOrders = new Orders();
				tempOrders.setO_id(rs.getString(1));
				tempOrders.setO_num(rs.getInt(2));
				tempOrders.setO_price(rs.getFloat(3));
				long oTime = rs.getTimestamp(4).getTime();
				intervalTime = currentTime - oTime;
//				System.out.println("interval"+intervalTime);
				tempOrders.setO_time(rs.getTimestamp(4));
				tempOrders.setO_cheaper(rs.getFloat(5));
				tempOrders.setO_receiver(rs.getString(6));
//				System.out.println("timestamp"+tempOrders.getO_time().toString());
				map.put(intervalTime, tempOrders);
			}
			Iterator<Entry<Long, Orders>> it = map.entrySet().iterator();
			while (it.hasNext()) {
				Entry<Long, Orders> entry=  (Map.Entry<Long, Orders>)it.next();
				Object obj = entry.getValue();
				Orders temp = (Orders) obj;
				result.addElement(temp);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	//查找订单详细表
	public Vector<OrderDetail> showMyOrdersDetail(Orders orders){
		Vector<OrderDetail> result = new Vector<OrderDetail>();
		String o_id = orders.getO_id();
		
		
		String sql="select b_name,b_nums,b_price,b_discountprice,b_sumprice,b_sumdiscountprice,b_id,o_id from order_detail where o_id = ? ";
//		System.out.println(sql);
		try {
			java.sql.PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, o_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				OrderDetail oDetail = new OrderDetail();
				oDetail.setB_name(rs.getString(1));
				oDetail.setB_num(rs.getInt(2));
				oDetail.setB_price(rs.getFloat(3));
				oDetail.setB_discountprice(rs.getFloat(4));
				oDetail.setB_sumprice(rs.getFloat(5));
				oDetail.setB_sumdiscountprice(rs.getFloat(6));
				oDetail.setB_id(rs.getString(7));
				oDetail.setO_id(rs.getString(8));
				result.addElement(oDetail);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	//删除
	public int deleteOrder(String o_id){
		int result = 0;
		String sqlDeleOrders = "delete from orders where o_id = ?";
		String sqlDeleOrdDetail = "delete from order_detail where o_id = ?";
		try {
			connection.setAutoCommit(false);
			java.sql.PreparedStatement pstmtOr = connection.prepareStatement(sqlDeleOrders);
			pstmtOr.setString(1, o_id);
			result = pstmtOr.executeUpdate();
			
			java.sql.PreparedStatement pstmtOrDe = connection.prepareStatement(sqlDeleOrdDetail);
			pstmtOrDe.setString(1, o_id);
			result = pstmtOrDe.executeUpdate();
			connection.commit();
			connection.setAutoCommit(true);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				result = -1;
				e1.printStackTrace();
			}
			result = -1;
			e.printStackTrace();
		}
		return result;
	}  
}
