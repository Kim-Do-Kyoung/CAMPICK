package com.campick.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pick")
public class AnalysisController {
	
	@RequestMapping("/list")
	public String list(Model model) {
		System.out.println("pick list!");
		return "analysis";
	}
}
