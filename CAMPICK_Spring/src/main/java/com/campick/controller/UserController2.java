package com.campick.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.campick.user.model.UserDto;
import com.campick.user.service.LoginService;

@Controller
@RequestMapping("user")
public class UserController2 {
	
	@Autowired
	LoginService loginService;
	
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
}
