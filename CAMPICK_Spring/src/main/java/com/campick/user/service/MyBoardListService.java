package com.campick.user.service;

import java.util.ArrayList;

import com.campick.board.model.BoardDto;
import com.campick.paging.PagingVO;

public interface MyBoardListService {
	public ArrayList<BoardDto> execute(String name, PagingVO vo);
}
