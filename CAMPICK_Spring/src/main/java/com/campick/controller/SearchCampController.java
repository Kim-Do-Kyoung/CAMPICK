package com.campick.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.campick.getimg.service.GetImgListService;
import com.campick.getimg.service.GetImgService;
import com.campick.searchcamp.service.CampDetailService;
import com.campick.searchcamp.service.CampListService;
import com.campick.tag.service.weatherAPI;

@Controller
@RequestMapping("camp")
public class SearchCampController {
	
	@Autowired
	CampListService campListService;
	
	@Autowired
	CampDetailService campDetailService;
	
	@Autowired
	GetImgListService getImgListService;
	
	@Autowired
	GetImgService getImgService;
	
	@Autowired
	weatherAPI weather;
	
	@PostMapping("list")
	public String campSearchList(@RequestParam(value="camp_name",required=false,defaultValue = "")String camp_name,
			@RequestParam(value="donm",required = false,defaultValue = "경기")String donm,
			@RequestParam(value="sigungu",required = false,defaultValue = "")String sigungu,
			@RequestParam(value="camptype",required=false,defaultValue = "")String[] camptype,
			@RequestParam(value="place",required=false,defaultValue = "")String[] place,
			@RequestParam(value="thema",required=false,defaultValue = "")String[] thema,
			@RequestParam(value="subplace",required=false,defaultValue = "")String[] subplace,
			@RequestParam(value="page",required = false,defaultValue = "1")int page,Model model,HttpSession session) throws Exception {
		
		
		session.setAttribute("camp_name", camp_name);
		session.setAttribute("donm", donm);
		session.setAttribute("sigungu", sigungu);
		session.setAttribute("camptype", camptype);
		session.setAttribute("place", place);
		session.setAttribute("thema", thema);
		session.setAttribute("subplace", subplace);
		session.setAttribute("page", page);
		
		campListService.execute(model,session);
		getImgListService.execute(model);
		
		return "searchResult";
	}
	@GetMapping("list")
	public String campSearchList(@RequestParam("page")int page,Model model,HttpSession session) throws Exception {
		
		session.setAttribute("page", page);
		campListService.execute(model, session);
		getImgListService.execute(model);
		
		return "searchResult";
	}
	
	@RequestMapping("detail")
	public String campDetail(@RequestParam("camp_id")int camp_id, @RequestParam String addr,Model model) throws Exception {
		model.addAttribute("camp_id", camp_id);
		campDetailService.execute(model);
		getImgService.execute(model);
		
		Map<String, Object> weatherList = weather.execute(addr);
		model.addAttribute("weatherList", weatherList);
		return "campDetail";
	}
}
