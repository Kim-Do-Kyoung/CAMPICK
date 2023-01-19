package com.campick.controller;

import java.sql.SQLException;

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
import com.campick.tag.service.TagDetailService;
import com.campick.tag.service.TagSearchService;

@Controller
@RequestMapping("/tag")
public class TagController {
	
	@Autowired
	TagSearchService tagSearchService;
	
	@Autowired
	GetImgListService getImgListService;
	
	@Autowired
	TagDetailService tagDetailService;
	
	@Autowired
	GetImgService getImgService;
	
	@RequestMapping("/search")
	public String searchPage(Model model) {
		System.out.println("search 진입");
		
		return "tagSearch";
	}
	
	@PostMapping("/tagSearch")
	public String searchTag(@RequestParam(value="tag",required = false,defaultValue = "")String[] tag,
			@RequestParam(value="page",required = false,defaultValue = "1") int page,Model model,HttpSession session) throws Exception {
		
		session.setAttribute("tag", tag);
		session.setAttribute("page", page);
		model.addAttribute("tagSearchList",tagSearchService.execute(model,session));
		getImgListService.execute(model);
		
		return "tagResult";
	}
	
	@GetMapping("/tagSearch")
	public String searchTag(@RequestParam(value="page",required = false,defaultValue = "1")int page,Model model,HttpSession session) throws Exception {
		
		session.setAttribute("page", page);
		model.addAttribute("tagSearchList", tagSearchService.execute(model, session));
		getImgListService.execute(model);
		
		return "tagResult";
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam("camp_id")int camp_id,Model model) throws Exception {
		
		model.addAttribute("camp_id",camp_id);

		tagDetailService.execute(model);
		getImgService.execute(model);
		
		return "campDetail";
	}
}
