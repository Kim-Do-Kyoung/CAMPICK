package com.campick.getimg.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.getimg.model.GetImgDao;

@Service
public class GetImgServiceImpl implements GetImgService{
	
	@Autowired
	GetImgDao giDao;

	@Override
	public void execute(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		int camp_id = (int)map.get("camp_id");
		System.out.println("camp_id값은? : "+camp_id);
		model.addAttribute("giDto", giDao.getDB(camp_id));
	}

}
