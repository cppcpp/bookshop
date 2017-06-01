package com.ddbs.dao;

public interface LoginDao {
	public boolean checkUser(String u_account,String u_password,String tag);
	public boolean compareCode(String inputCode, String randomCode);
	public String getAccount(String u_account,String tag);
	public boolean check(String u_account,String u_password);
}
