package com.campick.zzim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.zzim.model.ZzimDao;

@Service
public class ZzimTotalCnt {
	@Autowired
	ZzimDao zzimDao;
	
	public int execute(String id) throws Exception{
		return zzimDao.zzimCount(id);
	}
}
