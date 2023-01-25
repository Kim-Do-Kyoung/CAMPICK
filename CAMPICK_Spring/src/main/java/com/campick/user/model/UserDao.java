package com.campick.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private class UserDtoMapper implements RowMapper<UserDto>{

		@Override
		public UserDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserDto uDto = new UserDto();
			uDto.setId(rs.getString("id"));
			uDto.setPw(rs.getString("pw"));
			uDto.setName(rs.getString("name"));
			uDto.setAddr(rs.getString("addr"));
			uDto.setPhone(rs.getString("phone"));
			uDto.setEmail(rs.getString("email"));
			return uDto;
		}
	}
	
	public void register(UserDto userDto){
		 
		System.out.println("dao까지 넘어옴~~");
	 
		String sql = "INSERT INTO USER_TB VALUES(?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql,
				userDto.getId(),
				userDto.getPw(),
				userDto.getName(),
				userDto.getAddr(),
				userDto.getPhone(),
				userDto.getEmail()
				);
		}
	 
	
	public UserDto login(String id, String pw) {
		System.out.println("로그인 dao까지 넘어옴~");
		try {
			String sql = "SELECT * FROM USER_TB WHERE ID=? AND PW=?";
			return jdbcTemplate.queryForObject(sql, new UserDtoMapper(),id,pw);	
		}catch(EmptyResultDataAccessException e){
			return null;
		}
	}
	
	
	public UserDto SearchID(String name, String phone) {
		System.out.println("searchId DAo 넘어옴~");
		String sql = "select * FROM USER_TB WHERE name=? AND phone=?";
		return jdbcTemplate.queryForObject(sql, new UserDtoMapper(), name, phone);

	}
	

	public UserDto SearchPW(String id, String email, String phone) {
		System.out.println("searchpw DAO 넘어옴~");
	    	String sql = "select * FROM USER_TB WHERE id=? AND email=? AND phone=?";
	    	return jdbcTemplate.queryForObject(sql, new UserDtoMapper(), id, email, phone);
	}
	
	
	public void unregister(String deletID) {
	        System.out.println("넘어온 delete id는"+deletID);
	    	String sql="DELETE FROM USER_TB WHERE id=?";
	    	jdbcTemplate.update(sql, deletID);
	}
	
	public int idCheck(String user_id) {
	    System.out.println("넘어온 id는"+user_id);
	    String sql = "select count(*) FROM USER_TB WHERE id=?";
		return jdbcTemplate.queryForObject(sql, Integer.class, user_id);
	}
	
	public void userEdit(UserDto userDto) {
		String sql = "update user_tb set pw=?, addr=?, phone=?, email=? where id=?";
		jdbcTemplate.update(sql, 
				userDto.getPw(),
				userDto.getAddr(),
				userDto.getPhone(),
				userDto.getEmail(),
				userDto.getId()
				);
	}
}
