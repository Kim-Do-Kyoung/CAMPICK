package com.campick.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.user.model.UserDao;

@Service
public class IDCheckServicelmpl implements IDCheckService {

	@Autowired
	UserDao userDao;

	@Override
	public int execute(String user_id) {
	//	System.out.println("service로 넘어온 id는 "+checkID);
		int result = userDao.idCheck(user_id);
		return result;
	}
}
