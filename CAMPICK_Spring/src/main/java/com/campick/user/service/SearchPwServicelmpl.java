package com.campick.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.user.model.UserDao;
import com.campick.user.model.UserDto;

@Service
public class SearchPwServicelmpl implements SearchPwService {

		@Autowired
		UserDao userDao;

	@Override	
	public UserDto execute(String id, String email, String phone) {
		UserDto SearchPW = userDao.SearchPW(id, email, phone);
		return SearchPW;
		
		
	}

}
