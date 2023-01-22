package com.campick.getimg.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class GetImgDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private class GetImgDtoMapper implements RowMapper<GetImgDto>{

		@Override
		public GetImgDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			GetImgDto giDto = new GetImgDto();
			giDto.setCamp_id(rs.getInt("camp_id"));
			giDto.setImgUrl1(rs.getString("imgUrl1"));
			giDto.setImgUrl2(rs.getString("imgUrl2"));
			giDto.setImgUrl3(rs.getString("imgUrl3"));
			return giDto;
		}
		
	}
	public List<GetImgDto> getImgDBList() throws Exception{
		String sql = "select * from camp_img"; //sql문
		return jdbcTemplate.query(sql, new GetImgDtoMapper());
	}
	
	public GetImgDto getDB(int camp_id) throws SQLException {
		String sql = "SELECT * from camp_img where camp_id = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new GetImgDtoMapper(),camp_id);
		}catch(Exception e) {
			System.out.println("사진이 없음!");
			return null;
		}
	}
}
