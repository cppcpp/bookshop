package com.ddbs.dao.imple;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ddbs.db.DbConn;
import com.ddbs.model.Users;

public class MineInfo {
	DbConn dbConn = new DbConn();
	java.sql.Connection connection = dbConn.getConn();
	
	//将用户的信息读出来
	public Users showAllInfo(String uAccount){
		Users user = new Users();
		String sql ="select u_account,u_name,u_phone,u_mail from users where u_account = ?";
//		System.out.println("showInfo:"+sql);
		try {
			java.sql.PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, uAccount);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				user.setU_account(rs.getString(1));
				user.setU_name(rs.getString(2));
				user.setU_phone(rs.getString(3));
				user.setU_mail(rs.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	//保存用户修改的信息
	public int saveInfo(Users user){
		int result = 0;
		String u_account = user.getU_account();
		String u_name = user.getU_name();
		String u_phone = user.getU_phone();
		String u_mail = user.getU_mail();
		
		String sql = "update users set u_name = ?,u_phone = ?,u_mail = ? where u_account = ?";
//		System.out.println("svaeInfo:"+sql);
		try {
			java.sql.PreparedStatement pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, u_name);
			pstmt.setString(2, u_phone);
			pstmt.setString(3, u_mail);
			pstmt.setString(4, u_account);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = -1;
			e.printStackTrace();
		}
		System.out.println("test dao result:"+result);
		return result;
	}
}
