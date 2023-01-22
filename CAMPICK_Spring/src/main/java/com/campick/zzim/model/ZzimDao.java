package com.campick.zzim.model;

import java.sql.Connection;		
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.campick.paging.PagingVO;
import com.campick.searchcamp.model.SearchCampDto;

@Repository
public class ZzimDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private class SearchCampDtoMapper implements RowMapper<SearchCampDto>{
		
		
		@Override
		public SearchCampDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			SearchCampDto scDto = new SearchCampDto();
			scDto.setCamp_id(rs.getInt("camp_id"));
			scDto.setCamp_name(rs.getString("camp_name"));
			scDto.setLineIntro(rs.getString("lineIntro"));
			scDto.setIntro(rs.getString("intro"));
			scDto.setFacility(rs.getString("facility"));
			scDto.setPlace(rs.getString("place"));
			scDto.setDoNm(rs.getString("doNm"));
			scDto.setSigunguNm(rs.getString("sigunguNm"));
			scDto.setAddr(rs.getString("addr"));
			scDto.setMapX(rs.getString("mapX"));
			scDto.setMapY(rs.getString("mapY"));
			scDto.setTel(rs.getString("tel"));
			scDto.setHomepage(rs.getString("homepage"));
			scDto.setSeason(rs.getString("season"));
			scDto.setOperdate(rs.getString("operdate"));
			scDto.setSubPlace(rs.getString("subPlace"));
			scDto.setPlayPlace(rs.getString("playPlace"));
			scDto.setThema(rs.getString("thema"));
			scDto.setEqpmnlendcl(rs.getString("eqpmnlendcl"));
			scDto.setExprnprogrm(rs.getString("exprnprogrm"));
			scDto.setSiteBottom1(rs.getString("siteBottom1"));
			scDto.setSiteBottom2(rs.getString("siteBottom2"));
			scDto.setSiteBottom3(rs.getString("siteBottom3"));
			scDto.setSiteBottom4(rs.getString("siteBottom4"));
			scDto.setSiteBottom5(rs.getString("siteBottom5"));
			return scDto;
		}
	}
	
	//찜추가
	public void ZzimPlus(String id, int camp_id) {

	      String sql = "Insert Into user_zzim(zzim_num, id, camp_id) VALUES(zzim_seq.nextval, ?, ?)";
			jdbcTemplate.update(sql, id, camp_id);
	}
	
	//찜 체크 여부
	public int zzimCheck(String id, int camp_id) {
		String sql = "select count(*) from user_zzim where id=? and camp_id=?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id, camp_id);
	}
	
	//찜 목록 갯수
	public int zzimCount(String id) {
		String sql = "select count(*) from camp_info where camp_id IN(select camp_id from user_zzim where id=?)";
		return jdbcTemplate.queryForObject(sql, Integer.class, id);	
	}
	
	//찜목록
	public ArrayList<SearchCampDto> getMyList(String id, PagingVO vo){
		//String sql = "select * from camp_info where camp_id IN(select camp_id from user_zzim where id=?)";
		String sql = "select * from (select rownum rn, a.* from (select b.* from camp_info b where camp_id IN(select camp_id from user_zzim where id=?)"
		+"order by camp_name ASC) a)where rn >=? and rn<=?";
	      return (ArrayList<SearchCampDto>) jdbcTemplate.query(sql, new RowMapper<SearchCampDto>(){
	    	@Override
	  		public SearchCampDto mapRow(ResultSet rs, int rowNum) throws SQLException {
	  			SearchCampDto zzimDto = new SearchCampDto();
	  			zzimDto.setCamp_id(rs.getInt("camp_id"));
	  			zzimDto.setCamp_name(rs.getString("camp_name"));
	  			zzimDto.setLineIntro(rs.getString("lineIntro"));
	  			zzimDto.setIntro(rs.getString("intro"));
	  			zzimDto.setFacility(rs.getString("facility"));
	  			zzimDto.setPlace(rs.getString("place"));
	  			zzimDto.setDoNm(rs.getString("doNm"));
	  			zzimDto.setSigunguNm(rs.getString("sigunguNm"));
	  			zzimDto.setAddr(rs.getString("addr"));
	  			zzimDto.setMapX(rs.getString("mapX"));
	  			zzimDto.setMapY(rs.getString("mapY"));
	  			zzimDto.setTel(rs.getString("tel"));
	  			zzimDto.setHomepage(rs.getString("homepage"));
	  			zzimDto.setSeason(rs.getString("season"));
	  			zzimDto.setOperdate(rs.getString("operdate"));
	  			zzimDto.setSubPlace(rs.getString("subPlace"));
	  			zzimDto.setPlayPlace(rs.getString("playPlace"));
	  			zzimDto.setThema(rs.getString("thema"));
	  			zzimDto.setEqpmnlendcl(rs.getString("eqpmnlendcl"));
	  			zzimDto.setExprnprogrm(rs.getString("exprnprogrm"));
	  			zzimDto.setSiteBottom1(rs.getString("siteBottom1"));
	  			zzimDto.setSiteBottom2(rs.getString("siteBottom2"));
	  			zzimDto.setSiteBottom3(rs.getString("siteBottom3"));
	  			zzimDto.setSiteBottom4(rs.getString("siteBottom4"));
	  			zzimDto.setSiteBottom5(rs.getString("siteBottom5"));
	  			return zzimDto;
	  		}}, id, vo.getStart(), vo.getEnd());
	    	  
	      }
	
	
	//찜목록
	/*
	 * public ArrayList<SearchCampDto> getMyList(String id){
	 * 
	 * String sql =
	 * "select * from camp_info where camp_id IN(select camp_id from user_zzim where id=?)"
	 * ;
	 * 
	 * return (ArrayList<SearchCampDto>) jdbcTemplate.query(sql, new
	 * RowMapper<SearchCampDto>(){
	 * 
	 * @Override public SearchCampDto mapRow(ResultSet rs, int rowNum) throws
	 * SQLException { SearchCampDto zzimDto = new SearchCampDto();
	 * zzimDto.setCamp_id(rs.getInt("camp_id"));
	 * zzimDto.setCamp_name(rs.getString("camp_name"));
	 * zzimDto.setLineIntro(rs.getString("lineIntro"));
	 * zzimDto.setIntro(rs.getString("intro"));
	 * zzimDto.setFacility(rs.getString("facility"));
	 * zzimDto.setPlace(rs.getString("place"));
	 * zzimDto.setDoNm(rs.getString("doNm"));
	 * zzimDto.setSigunguNm(rs.getString("sigunguNm"));
	 * zzimDto.setAddr(rs.getString("addr")); zzimDto.setMapX(rs.getString("mapX"));
	 * zzimDto.setMapY(rs.getString("mapY")); zzimDto.setTel(rs.getString("tel"));
	 * zzimDto.setHomepage(rs.getString("homepage"));
	 * zzimDto.setSeason(rs.getString("season"));
	 * zzimDto.setOperdate(rs.getString("operdate"));
	 * zzimDto.setSubPlace(rs.getString("subPlace"));
	 * zzimDto.setPlayPlace(rs.getString("playPlace"));
	 * zzimDto.setThema(rs.getString("thema"));
	 * zzimDto.setEqpmnlendcl(rs.getString("eqpmnlendcl"));
	 * zzimDto.setExprnprogrm(rs.getString("exprnprogrm"));
	 * zzimDto.setSiteBottom1(rs.getString("siteBottom1"));
	 * zzimDto.setSiteBottom2(rs.getString("siteBottom2"));
	 * zzimDto.setSiteBottom3(rs.getString("siteBottom3"));
	 * zzimDto.setSiteBottom4(rs.getString("siteBottom4"));
	 * zzimDto.setSiteBottom5(rs.getString("siteBottom5")); return zzimDto; }}, id);
	 * 
	 * }
	 */
	}
	

