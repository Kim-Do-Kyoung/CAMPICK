package com.campick.tag.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.campick.tag.model.TagSearchDto;

public interface TagSearchService {
	
	public List<TagSearchDto> execute(Model model,HttpSession session) throws SQLException;
}
