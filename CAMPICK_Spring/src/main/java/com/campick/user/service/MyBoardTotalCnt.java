package com.campick.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.board.model.BoardDao;
import com.campick.zzim.model.ZzimDao;

@Service
public class MyBoardTotalCnt {
	@Autowired
	BoardDao boardDao;
	
	public int execute(String name) throws Exception{
		return boardDao.getMylist(name);
	}
}
