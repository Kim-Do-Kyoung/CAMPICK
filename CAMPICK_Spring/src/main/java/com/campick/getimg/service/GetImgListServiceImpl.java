package com.campick.getimg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.getimg.model.GetImgDao;


@Service
public class GetImgListServiceImpl implements GetImgListService{
	
	@Autowired
	GetImgDao giDao;
	
	@Override
	public void execute(Model model) throws Exception {
		model.addAttribute("giDtoList",giDao.getImgDBList());
	}

}
