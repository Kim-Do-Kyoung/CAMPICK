package com.campick.zzim.service;

import java.util.ArrayList;	

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.campick.paging.PagingVO;
import com.campick.searchcamp.model.SearchCampDto;

public interface ZzimListService {
	
	public ArrayList<SearchCampDto> execute(String id, PagingVO vo);


}
