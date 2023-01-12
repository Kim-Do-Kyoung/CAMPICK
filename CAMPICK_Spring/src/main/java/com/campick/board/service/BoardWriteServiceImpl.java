package com.campick.board.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.campick.board.model.BoardDto;
import com.campick.user.model.UserDto;

public class BoardWriteServiceImpl implements BoardWriteService{
	//게시판 등록 메소드
	@Override
	public boolean execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("loginUser");
		return dao.insertBorad((BoardDto)request.getAttribute("dto"),userDto.getName());
	}
	
}
