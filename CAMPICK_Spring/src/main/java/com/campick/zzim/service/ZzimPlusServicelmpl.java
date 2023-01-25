package com.campick.zzim.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.zzim.model.ZzimDao;

@Service
public class ZzimPlusServicelmpl implements ZzimPlusService {

	@Autowired
	ZzimDao zzimDao;

	public void execute(String user_id, int camp_id) throws Exception{

		zzimDao.ZzimPlus(user_id, camp_id);
		
	}
}
