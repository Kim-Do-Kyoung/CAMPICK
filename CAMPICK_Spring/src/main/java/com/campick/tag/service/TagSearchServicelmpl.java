package com.campick.tag.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.tag.model.TagSearchDao;
import com.campick.tag.model.TagSearchDto;


@Service
public class TagSearchServicelmpl implements TagSearchService{
	
	@Autowired
	TagSearchDao tsDao;
	
	@Override
	public List<TagSearchDto> execute(Model model, HttpSession session) throws SQLException {
		
		String[] tag = (String[]) session.getAttribute("tag");
		
		int camp_count = tsDao.getDBCount(tag);
		session.setAttribute("camp_count", camp_count);

		int pageSize = 3;
		
		int currentPage = (int)session.getAttribute("page");
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = startRow+(pageSize-1);
		
		return tsDao.getList(tag, startRow, endRow);
	}

	

}
