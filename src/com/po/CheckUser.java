package com.po;

import com.po.User;

public class CheckUser {

	public CheckUser(){

	}

	public int checkUserVal(User user1){
		if (user1 == null) {
			return 0;
		}
		String user_name = user1.getUsername();
		if (user_name != null && user_name.equals("admin") ) {
			return 1;
		}
		else{
			return 0;
		}
	}

}