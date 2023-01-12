package com.campick.user.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.UserDao;
import com.user.model.UserDto;

public class LoginServicelmpl implements LoginService{
	
	private UserDao userDao;
	
	public LoginServicelmpl() {
		userDao=UserDao.getInstance();
	}
	@Override
	public UserDto execute(String loginId, String loginPw){
		UserDto loginUser = userDao.login(loginId, loginPw);
		return loginUser;
	}
}
