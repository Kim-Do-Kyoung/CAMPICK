package com.campick.controller;

import java.io.IOException;	
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.campick.user.model.UserDto;
import com.campick.user.service.IDCheckService;
import com.campick.user.service.LoginService;
import com.campick.user.service.SearchIdService;
import com.campick.user.service.SearchPwService;
import com.campick.user.service.UnregisterService;
import com.campick.user.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	UnregisterService unregisterService;
	
	@Autowired
	SearchIdService searchIdService;
	
	@Autowired
	SearchPwService searchPwService;

	
	@Autowired
	IDCheckService idCheckService;

	@GetMapping("/login")
	public String goLoginPage(Model model) {
		System.out.println("login 진입");
		return "login";
	}
	
	@GetMapping("/main")
	public String goMain() {
		System.out.println("gomain");
		return "search";
	}
	
	@PostMapping("/login")
	public void login(@RequestParam("userid")String userid,@RequestParam("password")String password ,
			HttpServletResponse response, HttpSession session) throws IOException{
		response.setContentType("text/html; charset=utf-8");
		UserDto loginUser = loginService.execute(userid, password);
		
		PrintWriter out = response.getWriter();
		if(loginUser!=null) {
			System.out.println("로그인 성공!");
			session.setAttribute("loginUser",loginUser);
			out.println ("<script>alert('환영합니다!'); location.href='main' </script>");
			out.close();
		}else{
			out.println ("<script>alert('비밀번호 또는 아이디를 다시 입력해주세요'); location.href='login'</script>"); 
			out.close();
		}
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃");
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/registerform")
	public String register() {
		return "regist";
	}
	

	 @PostMapping("/register")
	 public String register(UserDto userDto, HttpSession session) {
		 System.out.println("register 들어옴");
		 userService.execute(userDto);
		 session.setAttribute("loginUser",userDto);
		 return "redirect:/";
	}
	 
	 @GetMapping("/unregister")
	 public String unregister(HttpSession session, @RequestParam("id")String deletID) {
		 System.out.println("탈퇴하기");
		 unregisterService.execute(deletID);
		 session.invalidate();
		 return "redirect:/";
	 }
	 
	 @GetMapping("/searchId")
	 public String goSearchId(Model model) {
		 return "searchId";
	 }
	 
	 @PostMapping("/searchID")
	 public String searchID(@RequestParam("s_name")String name, @RequestParam("s_tel")String phone, UserDto userDto, Model model) {
		
		UserDto searchUser = searchIdService.execute(name, phone); 
		System.out.println("controller로 넘어온 searchuser name "+searchUser.getName());
		 System.out.println("controller로 넘어온 searchuser name "+searchUser.getPhone());
		model.addAttribute("searchUser", searchUser);
		 return "searchId";
	 }
	 
	 @GetMapping("/searchPw")
	 public String goSearchPw(Model model) {
		 return "searchPw";
	 }
	 
	 @PostMapping("/searchPw")
	 public String searchPw(@RequestParam("s_id")String id, @RequestParam("s_email")String email, @RequestParam("s_tel")String phone, UserDto userDto, Model model) {
	 	UserDto searchPw = searchPwService.execute(id, email, phone);
	 	model.addAttribute("searchPw", searchPw);
	 	return "searchPw";
	}
	 

	 
	 @ResponseBody
	 @GetMapping("/idCheck")
	 public String idCheck(@RequestParam("user_id")String user_id) {
		 System.out.println("ajax idcheck");
		 System.out.println(user_id);
		 int count=idCheckService.execute(user_id);
		 if(count==1) {
			 return "fail";
		 }else {
			 return "ok";
		 }
	 }
	 
}
