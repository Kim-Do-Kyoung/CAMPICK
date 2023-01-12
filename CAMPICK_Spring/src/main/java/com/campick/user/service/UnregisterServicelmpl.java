package com.campick.user.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.UserDao;

public class UnregisterServicelmpl implements UnregisterService {
	
	private UserDao userDao;
	
	public UnregisterServicelmpl(){
		userDao = UserDao.getInstance();
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String deletID = (String)request.getAttribute("deletID");
		userDao.unregister(deletID);
	}
	
}
