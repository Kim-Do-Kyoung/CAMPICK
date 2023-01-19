package com.campick.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.campick.user.model.UserDto;
import com.campick.user.service.LoginService;
import com.campick.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	UserService userService;
	 
	
	@GetMapping("login")
	public String goLoginPage(Model model) {
		System.out.println("login 진입");
		return "login";
	}
	
	@PostMapping("login")
	public String login(@RequestParam("userid")String userid,@RequestParam("password")String password ,
			Model model,HttpSession session) {
		UserDto loginUser = loginService.execute(userid, password);
		if(loginUser != null) {
			System.out.println("로그인 성공!");
			session.setAttribute("loginUser",loginUser);
			System.out.println("로그인한 사람: "+loginUser.getName());
		}else {
			System.out.println("로그인 실패");
		}
		return "redirect:/";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃");
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("registerform")
	public String register(Model model) {
		return "regist";
	}
	

	 @PostMapping("register")
	 public String register(UserDto userDto, HttpSession session) {
		 userService.execute(userDto);
		 session.setAttribute("loginUser",userDto);
		 return "redirect:/";
	}
	 
	 @RequestMapping("mypage")
	 public String mypage(HttpSession session) {
		 
		 return "myPage";
	 }
	 
	
}
