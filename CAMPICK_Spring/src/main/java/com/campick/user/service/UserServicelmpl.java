package com.campick.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.user.model.UserDao;
import com.campick.user.model.UserDto;

@Service
public class UserServicelmpl implements UserService{
	
	@Autowired
	UserDao userDao;
	
	@Override
	public void execute(UserDto userDto) {
		System.out.println("service까지 넘어옴!!");
		userDao.register(userDto);
	}
}
