package com.campick.board.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BoardWriteService {
	public boolean execute(HttpServletRequest request, HttpServletResponse response) throws SQLException;
}
