package com.campick.board.service;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.board.model.BoardDao;
import com.campick.board.model.BoardDto;
import com.campick.user.model.UserDto;

@Service
public class BoardWriteServiceImpl implements BoardWriteService{
	
	@Autowired
	BoardDao bDao;
	
	//게시판 등록 메소드
	@Override
	public void execute(Model model, HttpSession session) throws SQLException {
		UserDto uDto = (UserDto) session.getAttribute("loginUser");
		Map<String, Object> map = model.asMap();
		BoardDto bDto = (BoardDto) map.get("bDto");
		String cn = bDto.getCamp_name();
		String bpf = bDto.getBoard_period_first();
		String bps = bDto.getBoard_period_second();
		String bn = bDto.getBoard_name();
		String name = uDto.getName(); // 세션에 접속되어있는 이름
		String bt = bDto.getBoard_text();
		String bi = bDto.getBoard_img();
		System.out.println("bi = "+bi);
		bDao.insertBorad(cn, bpf, bps, bn, name, bt, bi);
	}
	
}
