package com.ddbs.dao.imple;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ddbs.db.DbConn;
import com.ddbs.model.Users;

public class MineSecurity {
	DbConn dbConn = new DbConn();
	java.sql.Connection connection = dbConn.getConn();
	
	//将用户的信息读出来
	public Users showAllSecurity(String uAccount){
		Users user = new Users();
		String sql ="select u_account,u_password from users where u_account = ?";
//		System.out.println("showInfo:"+sql);
		try {
			java.sql.PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, uAccount);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				user.setU_account(rs.getString(1));
				user.setU_password(rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	//保存用户修改的信息
	public int  saveSecurity(Users user){
		int result = 0;
		String u_account = user.getU_account();
		String u_password = user.getU_password();
		
		String sql = "update users set u_password = ? where u_account = ?";
//		System.out.println("svaeInfo:"+sql);
		try {
			java.sql.PreparedStatement pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, u_password);
			pstmt.setString(2, u_account);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = -1;
			e.printStackTrace();
		}
		return result;
	}
}
