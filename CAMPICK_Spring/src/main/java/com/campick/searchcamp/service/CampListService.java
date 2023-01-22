package com.campick.searchcamp.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface CampListService {
	public void execute(Model model,HttpSession session) throws Exception;
}
