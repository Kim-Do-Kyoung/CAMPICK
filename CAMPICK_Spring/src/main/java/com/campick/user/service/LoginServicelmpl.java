package com.campick.user.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.user.model.UserDao;
import com.campick.user.model.UserDto;

@Service
public class LoginServicelmpl implements LoginService{
	
	@Autowired
	UserDao uDao;
	
	@Override
	public UserDto execute(String id, String pw){
		UserDto loginUser = uDao.login(id, pw);
		return loginUser;
	}
}
