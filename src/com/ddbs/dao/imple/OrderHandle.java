package com.ddbs.dao.imple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.ddbs.db.DbConn;
import com.ddbs.model.Books;
import com.ddbs.model.OrderDetail;
import com.ddbs.model.Orders;

public class OrderHandle {
	DbConn dbConn = new DbConn();
	Connection conn = dbConn.getConn();
	//存入orders表中
	public boolean insertOrder(Orders o){
		try {
			String sql = "insert into orders values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, o.getO_id());
			pstm.setInt(2, o.getO_num());
			pstm.setFloat(3, o.getO_price());
			pstm.setTimestamp(4, o.getO_time());
			pstm.setString(5, o.getU_account());
			pstm.setString(6, o.getU_address());
			pstm.setString(7, o.getO_phone());
			pstm.setString(8, o.getO_receiver());
			pstm.setFloat(9, o.getO_cheaper());
			pstm.executeUpdate();
			
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	//存入订单详情表
	public boolean insertDetail(OrderDetail detail){
		String sql = "insert into order_detail values(?,?,?,?,?,?,?,?)";
		String oid = detail.getO_id();
		String colNameRecom = detail.getB_id()+"_o_num";
		String u_account = "";
		int b_sale_num_new = 0,b_sale_num_old = 0;
		BookDaoImpl bdi = new BookDaoImpl();
		Books temp = bdi.CheckBookById(detail.getB_id());
		b_sale_num_old = temp.getB_sale_num();
		b_sale_num_new = b_sale_num_old + detail.getB_num();
		int index = oid.lastIndexOf("_");
		String[] separetedArr = null;
		if (index != -1) {
			separetedArr = oid.split("_");
			u_account= separetedArr[0];
		}
		//更改推荐表中的数据
		String sqlRecom = "update recommend_books set "+colNameRecom+"= '"+detail.getB_num()+"' where u_account = '"+u_account+"'";
		
		//更改books表中的数据
		String sqlUpbooks = "update books set b_sale_num = "+b_sale_num_new+" where b_id = '"+detail.getB_id()+"'";
		
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, detail.getO_id());
			pstm.setString(2, detail.getB_id());
			pstm.setString(3, detail.getB_name());
			pstm.setInt(4, detail.getB_num());
			pstm.setFloat(5, detail.getB_price());
			pstm.setFloat(6, detail.getB_discountprice());
			pstm.setFloat(7, detail.getB_sumprice());
			pstm.setFloat(8, detail.getB_sumdiscountprice());
			pstm.executeUpdate();
			pstm.executeUpdate(sqlRecom);
			pstm.executeUpdate(sqlUpbooks);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
