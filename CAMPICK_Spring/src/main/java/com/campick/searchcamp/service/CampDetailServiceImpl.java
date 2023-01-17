package com.campick.searchcamp.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.searchcamp.model.SearchCampDao;
import com.campick.searchcamp.model.SearchCampDto;


@Service
public class CampDetailServiceImpl implements CampDetailService{
	
	@Autowired
	SearchCampDao scDao;
	
	@Override
	public void execute(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		model.addAttribute("scDto",scDao.getDB((int)map.get("camp_id")));
	}
}
