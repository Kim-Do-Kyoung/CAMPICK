package com.campick.board.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.campick.board.model.BoardDto;

public interface BoardWriteDetailService {
	public BoardDto execute(HttpServletRequest request, HttpServletResponse response) throws SQLException;
}
