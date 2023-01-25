package com.campick.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.user.model.UserDao;
import com.campick.user.model.UserDto;

@Service
public class SearchIdServicelmpl implements SearchIdService {

	@Autowired
	UserDao userDao;
	
	@Override
	public UserDto execute(String s_name, String s_tel){
		UserDto searchUser = userDao.SearchID(s_name, s_tel);
		return searchUser;
	}
}

