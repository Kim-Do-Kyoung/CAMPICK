package com.campick.searchcamp.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


@Repository
public class SearchCampDao {

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
	
	public List<SearchCampDto> getDBList(String camp_name,String donm, String sigungu,String[] camptype,String[] place,String[] thema,String[] subplace,int startRow, int pageSize) throws Exception{
		String sql = "select * from (select rownum rn , a.* from (select b.* from camp_info b where camp_name like '%"+camp_name+"%' and donm like '%"+donm+"%' and sigungunm like '%"+sigungu+"%'"; //sql문
		
		for(int i = 0; i<camptype.length;i++) {
			if(i == 0) {
				sql+=" and (";
			}
			sql+="facility like '%"+camptype[i]+"%' ";
			System.out.println("camptype[i]값은: "+camptype[i]);
			if(i+1 == camptype.length) {
				sql+=")";
				break;
			}
			sql+="OR ";
		}
		for(int i = 0; i<place.length;i++) {
			if(i == 0) {
				sql+=" and (";
			}
			sql+="place like '%"+place[i]+"%' ";
			System.out.println("place[i]값은: "+place[i]);
			if(i+1 == place.length) {
				sql+=")";
				break;
			}
			sql+="OR ";
		}
		for(int i = 0; i<thema.length;i++) {
			if(i == 0) {
				sql+=" and (";
			}
			sql+="thema like '%"+thema[i]+"%' ";
			System.out.println("thema[i]값은: "+thema[i]);
			if(i+1 == thema.length) {
				sql+=")";
				break;
			}
			sql+="OR ";
		}
		for(int i = 0; i<subplace.length;i++) {
			if(i == 0) {
				sql+=" and (";
			}
			sql+="subplace like '%"+subplace[i]+"%' ";
			System.out.println("subplace[i]값은: "+subplace[i]);
			if(i+1 == subplace.length) {
				sql+=")";
				break;
			}
			sql+="OR ";
		}
		
		sql +=" )a ) where rn>="+startRow+" and rn <="+(startRow+pageSize-1);
		
		System.out.println("sql문: "+sql);
		return jdbcTemplate.query(sql, new SearchCampDtoMapper());
	}
	public int getDBcount(String camp_name,String donm, String sigungu,String[] camptype,String[] place,String[] thema,String[] subplace) throws SQLException {
		String sql = "SELECT count(*) as camp_count from camp_info where camp_name like '%"+camp_name+"%' and donm like '%"+donm+"%' and sigungunm like '%"+sigungu+"%'";
		for(int i = 0; i<camptype.length;i++) {
			if(i == 0) {
				sql+=" and (";
			}
			sql+="facility like '%"+camptype[i]+"%' ";
			if(i+1 == camptype.length) {
				sql+=")";
				break;
			}
			sql+="OR ";
		}
		for(int i = 0; i<place.length;i++) {
			if(i == 0) {
				sql+=" and (";
			}
			sql+="place like '%"+place[i]+"%' ";
			if(i+1 == place.length) {
				sql+=")";
				break;
			}
			sql+="OR ";
		}
		for(int i = 0; i<thema.length;i++) {
			if(i == 0) {
				sql+=" and (";
			}
			sql+="thema like '%"+thema[i]+"%' ";
			if(i+1 == thema.length) {
				sql+=")";
				break;
			}
			sql+="OR ";
		}
		for(int i = 0; i<subplace.length;i++) {
			if(i == 0) {
				sql+=" and (";
			}
			sql+="subplace like '%"+subplace[i]+"%' ";
			if(i+1 == subplace.length) {
				sql+=")";
				break;
			}
			sql+="OR ";
		}
		
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public SearchCampDto getDB(int camp_id) throws SQLException {
		String sql = "SELECT * from camp_info where camp_id ="+camp_id;
		return jdbcTemplate.queryForObject(sql, new SearchCampDtoMapper());
	}
}
