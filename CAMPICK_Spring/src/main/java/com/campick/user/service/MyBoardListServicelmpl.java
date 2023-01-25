package com.campick.user.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.board.model.BoardDao;
import com.campick.board.model.BoardDto;
import com.campick.paging.PagingVO;

@Service
public class MyBoardListServicelmpl implements MyBoardListService {
	
	@Autowired
	BoardDao boardDao;
	
	public ArrayList<BoardDto> execute(String name, PagingVO vo){
		ArrayList<BoardDto> myBoardList = boardDao.myWriteList(name, vo);
		return myBoardList;
	}
}
