package com.campick.comment.service;

import java.sql.SQLException;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.comment.model.CommentDao;

@Service
public class CommentListServiceImpl implements CommentListService{
	
	@Autowired
	CommentDao cDao;

	@Override
	public void execute(Model model,HttpSession session) throws SQLException {
		Map<String, Object> map = model.asMap();
		String board_id = String.valueOf(map.get("board_id"));
		System.out.println("board_id 번호!: "+board_id);
		model.addAttribute("cList", cDao.getDBList(board_id));
	}

}
