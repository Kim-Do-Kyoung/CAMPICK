package com.campick.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.user.model.UserDao;

@Service
public class UnregisterServicelmpl implements UnregisterService {

	@Autowired
	UserDao userDao;
	
	public void execute(String deletID) {
		/* String deletID = (String)request.getAttribute("deletID"); */
		userDao.unregister(deletID);
	}
	
}
