package com.campick.suggest.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface SuggestService {
	public int execute(HttpSession session) throws Exception;
}
