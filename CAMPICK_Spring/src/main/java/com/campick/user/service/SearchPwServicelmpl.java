package com.campick.user.service;

import com.user.model.UserDao;

public class SearchPwServicelmpl implements SearchPwService {


	private UserDao userDao;
	
	public SearchPwServicelmpl() {
		userDao=UserDao.getInstance();
	}
	
	@Override	
	public String execute(String s_id, String s_email, String s_tel) {
		String SearchPW = userDao.SearchPW(s_id, s_email, s_tel);
		return SearchPW;
		
		
	}

}
