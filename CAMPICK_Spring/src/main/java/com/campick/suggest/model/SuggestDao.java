package com.campick.suggest.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class SuggestDao {
	public static final int SUGGEST_ON = 1;
	public static final int SUGGEST_OFF = 2;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private class SuggestDtoMapper implements RowMapper<SuggestDto>{

		@Override
		public SuggestDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			SuggestDto sDto = new SuggestDto();
			sDto.setSug_id(rs.getInt("sug_id"));
			sDto.setBoard_id(rs.getInt("board_id"));
			sDto.setId(rs.getString("id"));
			sDto.setName(rs.getString("name"));
			sDto.setChecked(rs.getInt("checked"));
			return sDto;
		}
		
	}
	
	
	public void insertDB(int board_id, String id , String name) throws SQLException {
		String sql = "insert into board_suggest values (sug_seq.nextval,?,?,?,"+SUGGEST_OFF+")";
		jdbcTemplate.update(sql,board_id,id,name);
	}
	public SuggestDto checkDB(int board_id, String id , String name) throws SQLException {
		String sql = "SELECT checked from board_suggest where board_id = ? AND id=? AND name=?";
		return jdbcTemplate.queryForObject(sql, new SuggestDtoMapper(),board_id,id,name);
	}
	
	public void updateChecked(int checked,int board_id,String id, String name) throws SQLException {
		String sql = "update board_suggest set checked = ? where board_id=? AND id=? AND name =?";
		jdbcTemplate.update(sql,checked,board_id,id,name);
	}
}
