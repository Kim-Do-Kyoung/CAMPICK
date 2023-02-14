package com.campick.board.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.board.model.BoardDao;

@Service
public class BoardWriteDtailServiceImpl implements BoardWriteDetailService{
	//글 디테일 페이지 보여주는 메소드
	
	@Autowired
	BoardDao bDao;

	@Override
	public void execute(Model model) throws SQLException {
		Map<String, Object> map = model.asMap();
		int board_id = (int)map.get("board_id");
		model.addAttribute("bDto", bDao.getDB(board_id));
	}

}
