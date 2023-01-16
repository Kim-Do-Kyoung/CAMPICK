package com.campick.comment.service;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.comment.model.CommentDao;
import com.campick.comment.model.CommentDto;
import com.campick.user.model.UserDto;


@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	CommentDao cDao;

	@Override
	public void execute(Model model,HttpSession session) throws SQLException {
		Map<String, Object> map = model.asMap();
		UserDto uDto = (UserDto) session.getAttribute("loginUser");
		
		int board_id = (int) session.getAttribute("boardId");
		String name = uDto.getName();
		String reply = (String)map.get("reply");
		cDao.insertComment(board_id, name, reply);
	}

}
