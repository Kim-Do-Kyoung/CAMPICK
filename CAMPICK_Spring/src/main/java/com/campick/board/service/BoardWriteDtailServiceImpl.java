package com.campick.board.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campick.board.model.BoradDao;
import com.campick.board.model.BoardDto;

public class BoardWriteDtailServiceImpl implements BoardWriteDetailService{
	BoradDao dao;
	
	public BoardWriteDtailServiceImpl() {
		// TODO Auto-generated constructor stub
		dao = BoradDao.getInstance();
	}
	//글 디테일 페이지 보여주는 메소드
	@Override
	public BoardDto execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int boradId = (int)session.getAttribute("boradid");
		BoardDto dto = dao.getDB(boradId);
		dao.increaseVisit(boradId);
		return dto;
	}

}
