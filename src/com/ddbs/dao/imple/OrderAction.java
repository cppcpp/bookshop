package com.ddbs.dao.imple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import org.apache.catalina.User;

import com.ddbs.db.DbConn;
import com.ddbs.model.UserAddress;
import com.sun.corba.se.spi.orbutil.fsm.State;

//对用户收获地址表进行操作
public class OrderAction {
	DbConn db = new DbConn();
	Connection connection  = db.getConn();
	
	//取出默认地址
	public Vector<UserAddress> getAddress(String u_account){
		Vector<UserAddress> addresses = new Vector<UserAddress>();
		try {
			Statement stm = connection.createStatement();
			String sql = "select u_address,o_phone,o_receiver,u_isDefault from user_address where u_account="+"\""+u_account+"\"";
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()){
				if(rs.getInt(4)==1){
					//addresses.addElement((UserAddress) rs);
					UserAddress user_address = new UserAddress();
					user_address.setU_account(u_account);
					user_address.setU_address(rs.getString(1));
					user_address.setO_phone(rs.getString(2));
					user_address.setU_isDefault(rs.getInt(4));
					user_address.setO_receiver(rs.getString(3));
					addresses.add(user_address);
				}
			}
			return addresses;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//取出所有地址
	public Vector<UserAddress> getAllAddress(String u_account){
		Vector<UserAddress> Alladdresses = new Vector<UserAddress>();
		try {
			Statement stm = connection.createStatement();
			String sql = "select u_address,o_phone,o_receiver,u_isDefault from user_address where u_account="+"\""+u_account+"\"";
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()){
				//addresses.addElement((UserAddress) rs);
				UserAddress user_address = new UserAddress();
				user_address.setU_account(u_account);
				user_address.setU_address(rs.getString(1));
				user_address.setO_phone(rs.getString(2));
				user_address.setU_isDefault(rs.getInt(4));
				user_address.setO_receiver(rs.getString(3));
				Alladdresses.add(user_address);
			}
			return Alladdresses;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//新增地址写数据库中
	public boolean updateAddress(String person,String address,String phone,int default_address,String u_accoount){
		String sql = "insert into user_address values(?,?,?,?,?,?)";
		try {
			Date time = new Date();
			DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");   
			String time_id = "";
			time_id = sdf.format(time);
			
			PreparedStatement pstm = connection.prepareStatement(sql);
			pstm.setString(1, u_accoount+"_"+time_id);
			pstm.setString(2, u_accoount);
			pstm.setString(3, address);
			pstm.setString(4, phone);
			pstm.setInt(5, default_address);
			pstm.setString(6, person);
			pstm.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	//将所有地址都设置为非默认
	public boolean setDefault(String u_account){
		int defalut = 0;
		String sql = "update user_address set u_isDefault="+defalut+" where u_account="+"\""+u_account+"\"";
		try {
			Statement stm = connection.createStatement();
			stm.executeUpdate(sql);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
}
