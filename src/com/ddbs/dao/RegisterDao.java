package com.ddbs.dao;

import com.ddbs.model.Users;

public interface RegisterDao{
	public boolean addUser(Users user);
	public boolean checkAccount(String u_account);
}
