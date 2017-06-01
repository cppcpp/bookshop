package com.ddbs.dao.imple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.catalina.User;

import com.ddbs.dao.RegisterDao;
import com.ddbs.db.DbConn;
import com.ddbs.model.Users;

public class Register implements RegisterDao{
	
	DbConn db = new DbConn();
	Connection conn = db.getConn();
	//注册成功后  写入数据库
	public boolean addUser(Users user){
		try {
			String sql = "insert into users(u_account,u_name,u_password,u_phone,u_mail) values(?,?,?,?,?)";
			String insertIntoReco ="insert into recommend_books(u_account) values(?)";
			System.out.println("insert"+insertIntoReco);
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, user.getU_account());
			pstm.setString(2, user.getU_name());
			pstm.setString(3, user.getU_password());
			pstm.setString(4, user.getU_phone());
			pstm.setString(5, user.getU_mail());
			
			pstm.executeUpdate();
			PreparedStatement pstmt = conn.prepareStatement(insertIntoReco);
			pstmt.setString(1, user.getU_account());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	//监测用户名是否重复
	public boolean checkAccount(String u_account){
		try {
			String sql = "select u_account from users";
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()){
				if(u_account.equals(rs.getString(1))){
					System.out.println("账号重复");
					return false;
				}
			}
			System.out.println("账号不重复");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
}
