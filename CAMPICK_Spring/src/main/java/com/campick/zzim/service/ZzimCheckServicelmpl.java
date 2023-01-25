package com.campick.zzim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.zzim.model.ZzimDao;

@Service
public class ZzimCheckServicelmpl implements  ZzimCheckService{
	
	@Autowired
	ZzimDao zzimDao;

	public int execute(String user_id, int camp_id){

		int count =zzimDao.zzimCheck(user_id, camp_id);
		
		return count;
		
	}

	
	

}
