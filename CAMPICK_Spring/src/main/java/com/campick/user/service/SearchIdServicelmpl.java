package com.campick.user.service;

import com.user.model.UserDao;
import com.user.model.UserDto;

public class SearchIdServicelmpl implements SearchIdService {
	private UserDao userDao;
	
	public SearchIdServicelmpl() {
		userDao=UserDao.getInstance();
	}
	@Override
	public String execute(String s_name, String s_tel){
		String searchUser = userDao.SearchID(s_name, s_tel);
		return searchUser;
	}
}

