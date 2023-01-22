package com.campick.board.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.board.model.BoardDao;

@Service
public class BoardDeleteServiceImpl implements BoardDeleteService{
	
	@Autowired
	BoardDao bDao;

	@Override
	public void execute(Model model, HttpSession session) throws SQLException {
		// TODO Auto-generated method stub
		bDao.deleteDB((int)session.getAttribute("boardId"));
		
	}

}
