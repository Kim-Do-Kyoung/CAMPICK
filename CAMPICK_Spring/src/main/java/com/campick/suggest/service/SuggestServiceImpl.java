package com.campick.suggest.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.board.model.BoardDao;
import com.campick.suggest.model.SuggestDao;
import com.campick.suggest.model.SuggestDto;
import com.campick.user.model.UserDto;

@Service
public class SuggestServiceImpl implements SuggestService{
	
	@Autowired
	SuggestDao sDao;
	
	@Autowired
	BoardDao bDao;
	
	@Override
	public int execute(HttpSession session) throws Exception {
		UserDto uDto = (UserDto)session.getAttribute("loginUser");
		int board_id = (int)session.getAttribute("boardId");
		SuggestDto sDto = sDao.checkDB(board_id, uDto.getId(), uDto.getName());
		
		//체크값이 0이면 생성 2면 추천안한사람 1이면 추천한사람
		if(sDto.getChecked() == 0){
			sDao.insertDB(board_id, uDto.getId(), uDto.getName());
			sDto = sDao.checkDB(board_id, uDto.getId(), uDto.getName());
		}
		if(sDto.getChecked() == 2){
			bDao.increaseSuggest(board_id);
			sDao.updateChecked(1, board_id, uDto.getId(), uDto.getName());
			return 1;
		}else{
			bDao.decreaseSuggest(board_id);
			sDao.updateChecked(2, board_id, uDto.getId(), uDto.getName());
			return 2;
		}
	}
}
