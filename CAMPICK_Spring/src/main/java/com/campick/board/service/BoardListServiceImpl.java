package com.campick.board.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.board.model.BoardDao;
import com.campick.board.model.BoardDto;

@Service
public class BoardListServiceImpl implements BoardListService{
	
	@Autowired
	BoardDao bDao;
	
	//List를 보여주는 메소드
	@Override
	public void execute(Model model,HttpServletRequest request) throws SQLException {
		int curPage= (int)request.getAttribute("page");
		int pageSize = 9;
    	int startRow = ((curPage-1) * pageSize) +1 ;
    	request.setAttribute("count", bDao.getDBcount());
    	model.addAttribute("boardList", bDao.getDBList(startRow, pageSize));
	}
}
