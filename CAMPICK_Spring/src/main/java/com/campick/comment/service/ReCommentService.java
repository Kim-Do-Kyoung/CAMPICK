package com.campick.comment.service;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface ReCommentService {
	public void execute(Model model,HttpSession session) throws SQLException;
}
