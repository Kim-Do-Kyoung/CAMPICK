package com.campick.board.service;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.board.model.BoardDao;
import com.campick.board.model.BoardDto;
import com.campick.user.model.UserDto;

@Service
public class BoardUpdateServiceImpl implements BoardUpdateService{
	
	@Autowired
	BoardDao bDao;
	
	@Override
	public void execute(Model model) throws SQLException {
		Map<String, Object> map = model.asMap();
		BoardDto bDto = (BoardDto) map.get("bDto");
		String cn = bDto.getCamp_name();
		String bpf = bDto.getBoard_period_first();
		String bps = bDto.getBoard_period_second();
		String bn = bDto.getBoard_name();
		String bt = bDto.getBoard_text();
		String bi = bDto.getBoard_img();
		int b_id = bDto.getBoard_id(); 
		System.out.println("b_id 값은 ? : "+b_id);
		bDao.updateDB(bn, cn, bpf, bps, bt, bi, b_id);
	}

}
