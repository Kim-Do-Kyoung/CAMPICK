package com.campick.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.campick.board.model.BoardDao;
import com.campick.board.model.BoardDto;
import com.campick.board.service.BoardListService;
import com.campick.board.service.BoardWriteDetailService;
import com.campick.board.service.BoardWriteService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardDao bDao;
	
	@Autowired
	BoardListService boardListService;
	
	@Autowired
	BoardWriteDetailService boardWriteDetailService;
	
	@Autowired
	BoardWriteService boardWriteService;
	
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
		System.out.println("write get진입");
		return "writePage";
	}
	
	@PostMapping("/write")
	public String insert(BoardDto bDto,MultipartFile[] uploadFile ,Model model,HttpSession session) throws SQLException {
		System.out.println("wrtie post진입");
		
		final String uploadDir = "C:/Spring_camp/CAMPICK_Spring/CAMPICK_Spring/src/main/webapp/WEB-INF/resources/image";
//		final String uploadDir2 = "classpath:/src/main/webapp/WEB-INF/resources/image";
		String imgName = null;
		for(MultipartFile multipartFile : uploadFile) {
			imgName = multipartFile.getOriginalFilename();
			imgName = imgName.substring(imgName.lastIndexOf("//")+1);
			UUID uuid = UUID.randomUUID();
			
			imgName = uuid.toString() + "_" + imgName;
			
			File saveFile = new File(uploadDir,imgName);
			
			try {
				multipartFile.transferTo(saveFile);
				System.out.println("img이름 :"+imgName);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		bDto.setBoard_img(imgName);
		model.addAttribute("bDto", bDto);
		boardWriteService.execute(model, session);
		
		return "redirect:list";
	}
	
	@GetMapping("detail")
	public String detail(@RequestParam("board_id")int board_id,Model model,HttpSession session) throws SQLException {
		System.out.println("detail 진입");
		session.setAttribute("boardId", board_id);
		model.addAttribute("boardId",board_id);
		boardWriteDetailService.execute(model);
		
		return "writeDetail";
	}
	
	@GetMapping("edit")
	public String edit(Model model,HttpSession session) throws SQLException {
		System.out.println("get edit 진입");
		model.addAttribute("bDto",bDao.getDB((int)session.getAttribute("boardId")));
		
		return "writeEdit";
	}
}
