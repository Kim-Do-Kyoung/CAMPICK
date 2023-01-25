package com.campick.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.campick.board.model.BoardDto;
import com.campick.paging.PagingVO;
import com.campick.searchcamp.model.SearchCampDto;
import com.campick.user.model.UserDto;
import com.campick.user.service.LoginService;
import com.campick.user.service.MyBoardListService;
import com.campick.user.service.MyBoardTotalCnt;
import com.campick.user.service.UserEditService;
import com.campick.zzim.service.ZzimCheckService;
import com.campick.zzim.service.ZzimDeleteService;
import com.campick.zzim.service.ZzimListService;
import com.campick.zzim.service.ZzimPlusService;
import com.campick.zzim.service.ZzimTotalCnt;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	ZzimListService zzimListService;
	
	@Autowired
	ZzimPlusService zzimPluService;
	
	@Autowired
	ZzimCheckService zzimCheckService;
	
	@Autowired
	ZzimTotalCnt zzimTotalCnt;
	
	@Autowired
	ZzimDeleteService zzimDeleteService;
	
	@Autowired
	MyBoardListService myBoardListService;
	
	@Autowired
	MyBoardTotalCnt myBoardTotalCnt;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	UserEditService userEditService;
	 
	 @GetMapping("/zzimlist")
	 public String mypage(@RequestParam("id")String id, @RequestParam(value="nowPage", required=false, defaultValue = "1")String nowPage
				, @RequestParam(value="cntPerPage", required=false, defaultValue = "3")String cntPerPage, Model model, PagingVO vo) throws Exception{

		int total = zzimTotalCnt.execute(id);
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		ArrayList<SearchCampDto> myList= zzimListService.execute(id, vo);
		//model로 넘기기
		model.addAttribute("paging", vo);
		model.addAttribute("myList", myList);
		return "zzim-list";
	 }
	 
	 @ResponseBody
	 @GetMapping("/zzim")
	 public String zzim(@RequestParam("user_id") String user_id, @RequestParam("camp_id") int camp_id) throws Exception {
		 System.out.println("왜안오니");
		 System.out.println(user_id);
		 System.out.println(camp_id);
		 int count = zzimCheckService.execute(user_id, camp_id);
		 if(count==1) {
			return "fail"; 
		 }else{
			zzimPluService.execute(user_id, camp_id);
			return "ok";
		 }
	 }
	 
	 @ResponseBody
	 @GetMapping("/zzimDelete")
	  public String zzimDelete(@RequestParam("user_id") String user_id, @RequestParam("camp_id") String camp_id) {
		 zzimDeleteService.execute(user_id, camp_id);
		 return "ok";
	 }

	 @GetMapping("/writeList")
	 public String writeList(@RequestParam("name")String name, @RequestParam(value="nowPage", required=false, defaultValue = "1")String nowPage
				, @RequestParam(value="cntPerPage", required=false, defaultValue = "10")String cntPerPage, Model model, PagingVO vo) throws Exception {
		 int total = myBoardTotalCnt.execute(name);
		 myBoardListService.execute(name, vo);
		 vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	 	 ArrayList<BoardDto> myWriteList= myBoardListService.execute(name, vo);
		 //model로 넘기기
		 model.addAttribute("paging", vo);
		 model.addAttribute("myWriteList", myWriteList);
		
		 return "myWrite-list";
	 }
	 
	 @GetMapping("/pwReCheck")
	 public String pwReCheck() {
		 return "pwReCheck";
	 }
	 
	 @ResponseBody
	 @PostMapping("/pwReCheck")
	 public String pwReCheck(@RequestParam("id")String id, @RequestParam("pw")String pw) {
		 System.out.println("pwReCheck 들어옴");
		 UserDto loginUser = loginService.execute(id, pw);
		 if(loginUser!=null) {
			 return "ok";
		 }else {
			 return "fail";
		 }
	 }
	 
	 @GetMapping("/userEdit")
	 public String userEdit(@RequestParam("id")String id){
		 System.out.println(id);
		 return "userEdit";
	 }
	 
	 @PostMapping("userEdit")
	 public String userEdit(UserDto userDto, HttpSession session) {
		 System.out.println("post userdeit");
		 userEditService.execute(userDto);
		 session.setAttribute("loginUser",loginService.execute(userDto.getId(), userDto.getPw()));
		 return "pwReCheck";
	 }
	 
}
