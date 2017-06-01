package com.ddbs.dao.imple;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ddbs.db.DbConn;

public class PassImpl {
	DbConn dbConn = new DbConn();
	Connection conn = dbConn.getConn();
	public boolean checkPass(String u_account,String u_password){
		try {
			Statement stm = conn.createStatement();
			String sql = "select u_password from users where u_account ="+"\""+u_account+"\"";
			System.out.println(sql);
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()){
				System.out.println("dasdasd"+rs.getString(1));
				if(u_password.equals(rs.getString(1))){
					//System.out.println("µÇÂ¼³É¹¦");
					return true;
				}else{
					//System.out.println("µÇÂ¼Ê§°Ü");
					return false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}
}
