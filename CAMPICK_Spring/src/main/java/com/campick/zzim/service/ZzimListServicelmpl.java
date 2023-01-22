package com.campick.zzim.service;

import java.util.ArrayList;	

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.paging.PagingVO;
import com.campick.searchcamp.model.SearchCampDto;
import com.campick.zzim.model.ZzimDao;

@Service
public class ZzimListServicelmpl implements ZzimListService{
	
	@Autowired
	ZzimDao zzimDao;

	@Override
	public ArrayList<SearchCampDto> execute(String id, PagingVO vo){
		System.out.println(vo.getStart());
		System.out.println(vo.getEnd());
		ArrayList<SearchCampDto> myList = zzimDao.getMyList(id, vo);
		return myList;
	}


}
