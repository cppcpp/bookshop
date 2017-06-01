package com.ddbs.dao.imple;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Vector;

import com.ddbs.db.DbConn;
import com.ddbs.model.UserAddress;

public class MyAddress {
	DbConn dbConn = new DbConn();
	java.sql.Connection connection = dbConn.getConn();
	private  int numOfAddress = 0;
	
	public int getNumOfAddress() {
		return numOfAddress;
	}

	public void setNumOfAddress(int numOfAddress) {
		this.numOfAddress = numOfAddress;
	}

	//将用户的信息读出来
	public Vector<UserAddress> showAllInfo(String uAccount){
		Vector<UserAddress> result = new Vector<UserAddress>();
		String sql ="select u_address,o_phone,u_isDefault,o_receiver,uAddr_id from user_address where u_account = ?";
		//System.out.println("showUA:"+sql);
		try {
			java.sql.PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, uAccount);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				UserAddress userAddress = new UserAddress();
				userAddress.setU_address(rs.getString(1));
				userAddress.setO_phone(rs.getString(2));
				userAddress.setU_isDefault(rs.getInt(3));
				userAddress.setO_receiver(rs.getString(4));
				userAddress.setU_addr_id(rs.getString(5));
				result.addElement(userAddress);
				numOfAddress++;
				//System.out.println("读取numAdd"+numOfAddress);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//保存用户修改的信息
	public int  updateInfo(UserAddress userAddress){
		int result = 0;
		String u_address = userAddress.getU_address();
		String o_addr_id = userAddress.getU_addr_id();
		String u_phone = userAddress.getO_phone();
		int u_isDefault = userAddress.getU_isDefault();
		String o_receiver = userAddress.getO_receiver();
		String uAccount = userAddress.getU_account();
		
		try {
			if (u_isDefault == 1) {
				//System.out.println("isdefault===========");
				String sqlUpdateIsDefa = "update user_address set u_isDefault = 0 where u_account = ?";
				PreparedStatement pstmtDefau = connection.prepareStatement(sqlUpdateIsDefa);
				pstmtDefau.setString(1, uAccount);
				result = pstmtDefau.executeUpdate();
			}
			String sql = "update user_address set u_address = ?,o_phone = ?,u_isDefault = ?,o_receiver = ? where uAddr_id = ?";
			//System.out.println("updateInfo:"+sql);
			
			java.sql.PreparedStatement pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, u_address);
			pstmt.setString(2, u_phone);
			pstmt.setInt(3, u_isDefault);
			pstmt.setString(4, o_receiver);
			pstmt.setString(5, o_addr_id);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = -1;
			e.printStackTrace();
		}
		return result;
		
	}
	//增加地址
	public int addAddr(UserAddress userAddress){
		String u_account = userAddress.getU_account();
		String u_address = userAddress.getU_address();
		String u_phone = userAddress.getO_phone();
		int u_isDefault = userAddress.getU_isDefault();
		String o_receiver = userAddress.getO_receiver();
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		String currentTimeStr = currentTime.toString();
		String uAddrId = u_account +"_"+currentTimeStr;
		//System.out.println("uAddrId"+uAddrId);
		//System.out.println("u_account"+u_account);
		//System.out.println("u_address"+u_address);
		//System.out.println("u_phone"+u_phone);
		//System.out.println("u_isDefault"+u_isDefault);
		//System.out.println("o_receiver"+o_receiver);
		
		int result = 0;
		try {
			if (u_isDefault == 1) {
				String sqlUpdateIsDefa = "update user_address set u_isDefault = 0 where u_account = ?";
				PreparedStatement pstmtDefau = connection.prepareStatement(sqlUpdateIsDefa);
				pstmtDefau.setString(1, u_account);
				result = pstmtDefau.executeUpdate();
			}
			String sql = "insert into user_address(u_account,u_address,o_phone,u_isDefault,o_receiver,uAddr_id) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, u_account);
			pstmt.setString(2, u_address);
			pstmt.setString(3, u_phone);
			pstmt.setInt(4, u_isDefault);
			pstmt.setString(5, o_receiver);
			pstmt.setString(6, uAddrId);
			result = pstmt.executeUpdate();
//			numOfAddress++;
//			System.out.println("增加numAdd"+numOfAddress);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = -1;
			e.printStackTrace();
		}
		return result;
	}
	//删除地址
		public int deleteAddr(String uAddr_id){
			int result = 0;
			String sql = "delete from user_address where uAddr_id = ?";
			try {
				PreparedStatement pstmt = connection.prepareStatement(sql);
				pstmt.setString(1, uAddr_id);
				result = pstmt.executeUpdate();
//				numOfAddress--;
//				System.out.println("删除numAdd"+numOfAddress);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				result = -1;
				e.printStackTrace();
			}
			return result;
		}
}
