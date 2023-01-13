package com.campick.board.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.campick.board.model.BoardDto;

public interface BoardWriteDetailService {
	public void execute(Model model) throws SQLException;
}
