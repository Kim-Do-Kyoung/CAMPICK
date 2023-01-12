package com.campick.board.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface BoardListService {
	void execute(Model model,HttpServletRequest request) throws SQLException;
}
