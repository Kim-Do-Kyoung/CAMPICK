package com.campick.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.user.model.UserDao;
import com.campick.user.model.UserDto;

@Service
public class UserEditServicelmpl implements UserEditService {
	@Autowired
	UserDao userDao;
	
	@Override
	public void execute(UserDto userDto) {
		userDao.userEdit(userDto);
	}

}
