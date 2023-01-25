package com.campick.tag.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class TagSearchDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private class TagSearchDtoMapper implements RowMapper<TagSearchDto>{

		@Override
		public TagSearchDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			TagSearchDto tsDto = new TagSearchDto();
			tsDto.setCamp_id(rs.getInt("camp_id"));
			tsDto.setCamp_name(rs.getString("camp_name"));
			tsDto.setLineIntro(rs.getString("lineIntro"));
			tsDto.setIntro(rs.getString("intro"));
			tsDto.setFacility(rs.getString("facility"));
			tsDto.setPlace(rs.getString("place"));
			tsDto.setDoNm(rs.getString("doNm"));
			tsDto.setSigunguNm(rs.getString("sigunguNm"));
			tsDto.setAddr(rs.getString("addr"));
			tsDto.setMapX(rs.getString("mapX"));
			tsDto.setMapY(rs.getString("mapY"));
			tsDto.setTel(rs.getString("tel"));
			tsDto.setHomepage(rs.getString("homepage"));
			tsDto.setSeason(rs.getString("season"));
			tsDto.setOperdate(rs.getString("operdate"));
			tsDto.setSubPlace(rs.getString("subPlace"));
			tsDto.setPlayPlace(rs.getString("playPlace"));
			tsDto.setThema(rs.getString("thema"));
			tsDto.setEqpmnlendcl(rs.getString("eqpmnlendcl"));
			tsDto.setExprnprogrm(rs.getString("exprnprogrm"));
			return tsDto;
		}
		
	}
	public List<TagSearchDto> getList(String[] tag, int startRow, int endRow){
	    	String sql = "SELECT * FROM (SELECT a.*, ROWNUM as rnum FROM (SELECT * FROM camp_info WHERE addr like '%경기%'";
	    	if(tag!=null) {
		    	  for(int i = 0; i<tag.length; i++) {
		    		  if(tag[i].equals("체험")) {
		    			sql+=" AND exprnprogrm IS NOT NULL ";
		    		  }else {
		    			  sql+=" AND intro like '%"+tag[i]+"%'";
		    		  }
		    	  }
		    	  }
	    	sql+="ORDER BY camp_id DESC) a)  WHERE rnum >= ? and rnum <=?";
	    	System.out.println(sql);
	      return jdbcTemplate.query(sql, new TagSearchDtoMapper(),startRow,endRow);
	  }
	  
	  
	  public int getDBCount(String[] tag) {
    	  String sql = "select count(*) as camp_count From camp_info where addr like '%경기%'";
    	  if(tag!=null) {
    	  for(int i = 0; i<tag.length; i++) {
    		  if(tag[i].equals("체험")) {
    			sql+="AND exprnprogrm IS NOT NULL";
    		  }else {
    			  sql+="AND intro like '%"+tag[i]+"%'";
    		  }
    	  }
    	  }
  		return jdbcTemplate.queryForObject(sql, Integer.class);
	  }
	  
	  public TagSearchDto getCampInfo(int camp_id){
	      String sql = "select * From camp_info where camp_id="+camp_id;
	      System.out.println(sql);
	      return jdbcTemplate.queryForObject(sql, new TagSearchDtoMapper());
	      
		  
	  }

}
