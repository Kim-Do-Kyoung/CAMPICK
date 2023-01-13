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
import com.campick.board.service.BoardWriteDetailService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardListService boardListService;
	
	@Autowired
	BoardWriteDetailService boardWriteDetailService;
	
	@RequestMapping("/list")
	public String list(Model model,@RequestParam(value="page",required=false,defaultValue = "1")int page,HttpServletRequest request) throws SQLException {
		System.out.println("list 진입");
		request.setAttribute("page",page);
		boardListService.execute(model, request);
		System.out.println("list 끝");
		return "comunity";
	}
	
	@GetMapping("write")
	public String write(Model model) {
		return "writePage";
	}
	
	@PostMapping("/write")
	public String insert(BoardDto bDto ,Model model) {
		System.out.println("insert 진입");
		
		final String uploadDir = "C:/Spring_camp/CAMPICK_Spring/CAMPICK_Spring/src/main/webapp/WEB-INF/resources/image";
		final String uploadDir2 = "classpath:/src/main/webapp/WEB-INF/resources/image";
		
		return null;
	}
	
	@GetMapping("detail")
	public String detail(@RequestParam("board_id")int board_id,Model model) throws SQLException {
		System.out.println("detail 진입");
		model.addAttribute("boardid",board_id);
		boardWriteDetailService.execute(model);
		
		return "writeDetail";
	}
}
