package com.campick.comment.service;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.comment.model.CommentDao;
import com.campick.comment.model.CommentDto;
import com.campick.user.model.UserDto;

@Service
public class ReCommentServiceImpl implements ReCommentService{
	
	@Autowired
	CommentDao cDao;
	
	@Override
	public void execute(Model model,HttpSession session) throws SQLException {
		 UserDto uDto = (UserDto) session.getAttribute("loginUser");
		 Map<String, Object> map = model.asMap();
		 CommentDto cDto = (CommentDto) map.get("cDto");
		 
		 int bundle_id = cDto.getBundle_id();
		 int board_id = (int) session.getAttribute("boardId");
		 String name = uDto.getName();
		 String reply = cDto.getReply();
		 cDao.insertReComment(board_id, bundle_id, name, reply);
	}

}
