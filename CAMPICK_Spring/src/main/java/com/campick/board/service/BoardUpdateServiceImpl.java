package com.campick.board.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campick.board.model.BoradDao;
import com.campick.board.model.BoardDto;


public class BoardUpdateServiceImpl implements BoardUpdateService{
	BoradDao dao;
	
	public BoardUpdateServiceImpl() {
		dao = BoradDao.getInstance();
	}
	@Override
	public boolean execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		HttpSession session = request.getSession();
		return dao.updateDB((int)session.getAttribute("boradid"), (BoardDto)request.getAttribute("dto"));
	}

}
