package com.campick.board.service;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;

public interface BoardDeleteService {
	public void execute(Model model,HttpSession session) throws SQLException;
}
