package com.ddbs.test;

import com.ddbs.dao.imple.Login;
import com.ddbs.dao.imple.RecommendRelativeBooks;
import com.ddbs.dao.imple.SpecialBooks;

public class Test {
	public static void main(String[] args) {
		Login login = new Login();
		//login.checkUser("ztchun", "ztchun");
		//login.checkUser("ztchun12", "ztchun", "u_account");
//		RecommendRelativeBooks re = new RecommendRelativeBooks();
//		re.relativeBooks("a");
		
		SpecialBooks specialBooks = new SpecialBooks();
		specialBooks.getSpecial();
	}
}
