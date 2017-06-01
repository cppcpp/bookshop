package com.ddbs.dao.imple;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ddbs.dao.LoginDao;
import com.ddbs.db.DbConn;
import com.sun.xml.internal.bind.v2.model.core.ID;

import sun.security.action.GetBooleanAction;

//登录验证
public class Login implements LoginDao{
	
	//验证用户是用什么类型的账号登录的   然后比对数据库中的数据  密码是否正确
	DbConn dbConn = new DbConn();
	Connection conn = dbConn.getConn();
	public boolean checkUser(String u_account,String u_password,String tag){
		try {
			Statement stm = conn.createStatement();
			String sql = "select u_password from users where "+tag+"=\""+u_account+"\"";
			System.out.println(sql);
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()){
				System.out.println(rs.getString(1));
				if(u_password.equals(rs.getString(1))){
					//System.out.println("登录成功");
					return true;
				}else{
					//System.out.println("登录失败");
					return false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}
	
	
	//验证进行比配
		public boolean compareCode(String inputCode, String randomCode) {
			boolean flag = false;
			char[] inputChar = inputCode.toCharArray();
			char[] codeChar = randomCode.toCharArray();
			// 判断两者是否相同
			if (inputChar.length == codeChar.length) {
				for (int i = 0; i < codeChar.length; i++) {
					// 当自动生成的验证码中的大写字母转换成小写，再比较
					if (codeChar[i] <= 90 && codeChar[i] >= 65) {
//						System.out.println("1111111111");
						int codeInt = (int) codeChar[i];
						int codeResu = codeInt + 32;// 转换成小写
//						 System.out.println("codere"+codeResu);
						int inputInt = (int) inputChar[i];
//						 System.out.println("input"+inputInt);
						if (inputInt <= 90 && inputInt >= 65) {
//							System.out.println("333333333");
							if (inputInt != codeInt) {
//								System.out.println("da比对shibai");
								flag = false;
								break;
							} else {
//								System.out.println("da比对成功");
								flag = true;
							}
						} else {
							if (inputInt != codeResu) {
//								System.out.println("da比对shibai");
								flag = false;
								break;
							} else {
//								System.out.println("da比对成功");
								flag = true;
							}
						}

					} else {
//						System.out.println("22222222");
						int codeInt = (int) codeChar[i];
						int inputInt = (int) inputChar[i];
						if (codeInt != inputInt) {
							System.out.println("xi比对shibai");
							flag = false;
							break;
						} else {
//							System.out.println("xi比对成功");
							flag = true;
						}
					}
				}
			}
//			System.out.println("flag:"+flag);
			return flag;
		}
		
		//用户使用其他方式登录时  获取用户本网站的账号
		public String getAccount(String u_account,String tag){
			String sql = "select u_account from users where "+tag+"=\""+u_account+"\"";
			try {
				Statement statement = conn.createStatement();
				ResultSet rs = statement.executeQuery(sql);
				while(rs.next()){
					return rs.getString(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			System.out.println(sql);
			return null;
		}
		
		//不需要tag标志来登录 因为上面的方法已经转换成了u_account的字段了
		public boolean check(String u_account,String u_password){
			try {
				Statement stm = conn.createStatement();
				String sql = "select u_password from users where u_account="+"\""+u_account+"\"";
				System.out.println(sql);
				ResultSet rs = stm.executeQuery(sql);
				while(rs.next()){
					System.out.println(rs.getString(1));
					if(u_password.equals(rs.getString(1))){
						//System.out.println("登录成功");
						return true;
					}else{
						//System.out.println("登录失败");
						return false;
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			
			return false;
		}

}
