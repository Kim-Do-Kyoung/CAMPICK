package com.campick.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.campick.board.model.BoardDto;
import com.campick.board.service.BoardListService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardListService boardListService;
	
	@RequestMapping("/list")
	public String list(Model model,@RequestParam(value="page",required=false,defaultValue = "1")int page,HttpServletRequest request) throws SQLException {
		System.out.println("list 진입");
		request.setAttribute("page",page);
		boardListService.execute(model, request);
		return "comunity";
	}
	
	@PostMapping("/insert")
	public String insert(BoardDto bDto ,Model model) {
		System.out.println("insert 진입");
		
		final String uploadDir = "/Users/jeonhyeji/Documents/etc/file/";
		
		return null;
	}
}