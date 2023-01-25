package com.campick.tag.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.campick.tag.model.TagSearchDao;
import com.campick.tag.model.TagSearchDto;


@Service
public class TagDetailServicelmpl implements TagDetailService {
	
	@Autowired
	TagSearchDao tsDao;
	
	@Override
	public void execute(Model model) throws SQLException {
		Map<String, Object> map = model.asMap();
		int camp_id = (int) map.get("camp_id");
		model.addAttribute("scDto",tsDao.getCampInfo(camp_id));
	}

}
