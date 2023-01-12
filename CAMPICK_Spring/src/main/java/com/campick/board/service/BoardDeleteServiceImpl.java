package com.campick.board.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campick.board.model.BoardDao;


public class BoardDeleteServiceImpl implements BoardDeleteService{
	private BoardDao dao;
	
	@Override
	public boolean execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		HttpSession session = request.getSession();
		return dao.deleteDB((int)session.getAttribute("boradid"));
	}

}
