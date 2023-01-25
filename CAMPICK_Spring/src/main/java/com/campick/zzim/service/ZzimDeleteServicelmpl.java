package com.campick.zzim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.zzim.model.ZzimDao;

@Service
public class ZzimDeleteServicelmpl implements ZzimDeleteService {
	
	@Autowired
	ZzimDao zzimDao;
	
	public void execute(String user_id, String camp_id) {
	zzimDao.zzimDelete(user_id, camp_id);
	}

}
