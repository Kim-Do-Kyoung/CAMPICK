package com.campick.board.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.board.model.BoardDao;

@Service
public class BoardUpdateServiceImpl implements BoardUpdateService{
	
	@Autowired
	BoardDao bDao;
	
	@Override
	public void execute(Model model) throws SQLException {
		
	}

}
