package com.campick.searchcamp.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.searchcamp.model.SearchCampDao;


@Service
public class CampListServiceImpl implements CampListService{

	@Autowired
	SearchCampDao scDao;
	
	@Override
	public void execute(Model model,HttpSession session) throws Exception {
		
		int curPage= (int) session.getAttribute("page");
		int pageSize = 9;
    	int startRow = ((curPage-1) * pageSize) +1 ;
    	
    	String camp_name = (String) session.getAttribute("camp_name");
    	String donm = (String) session.getAttribute("donm");
    	String sigungu = (String) session.getAttribute("sigungu");
		String[] camptype = (String[]) session.getAttribute("camptype");
		String[] place = (String[]) session.getAttribute("place");
		String[] thema = (String[]) session.getAttribute("thema");
		String[] subplace = (String[]) session.getAttribute("subplace");
		
		model.addAttribute("scDtoList", scDao.getDBList(camp_name, donm, sigungu, camptype,place,thema,subplace,startRow, pageSize));
		session.setAttribute("count", scDao.getDBcount(camp_name, donm, sigungu, camptype,place,thema,subplace));
    	
	}
}
