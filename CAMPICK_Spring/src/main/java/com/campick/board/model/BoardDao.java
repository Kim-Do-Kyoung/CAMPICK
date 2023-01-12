package com.campick.board.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private class BoardDtoMapper implements RowMapper<BoardDto>{

		@Override
		public BoardDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			System.out.println("db mapRow 들어옴");
			BoardDto bDto = new BoardDto();
			bDto.setBoard_id(rs.getInt("board_id"));
			bDto.setBoard_visit(rs.getInt("board_visit"));
			bDto.setBoard_suggestion(rs.getInt("board_suggestion"));
			bDto.setBoard_date(rs.getString("board_date"));
			bDto.setCamp_name(rs.getString("camp_name"));
			bDto.setBoard_period_first(rs.getString("board_period_first"));
			bDto.setBoard_period_second(rs.getString("board_period_second"));
			bDto.setBoard_name(rs.getString("board_name"));
			bDto.setName(rs.getString("name"));
			bDto.setBoard_text(rs.getString("board_text"));
			bDto.setBoard_img(rs.getString("board_img"));
			return bDto;
		}
		
	}
	
	public void insertBorad(String cn,String bpf,String bps,String bn,String name,String bt,String bi) throws SQLException {
		String sql = "insert into board(board_id,board_visit,board_suggestion,board_date,camp_name,"
				+ "board_period_first,board_period_second,board_name,name,board_text,board_img)"
				+ " values (board_seq.nextval,0,0,to_char(sysdate,'yyyy.mm.dd hh24:mi'),?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql,cn,bpf,bps,bn,name,bt,bi);
	}
	//게시판 작성 글 목록을 불러오는 메소드
	public List<BoardDto> getDBList(int startRow , int pageSize) throws SQLException{
		String sql = "select * from (select rownum rn , a.* from (select b.* from board b order by board_id desc) a ) where rn >=? and rn <=?";
		return jdbcTemplate.query(sql, new BoardDtoMapper(),startRow,pageSize);
	}
	
	//게시판 글 상세 페이지 정보를 불러오는 메세지
//	public BoradDto getDB(int borad_id) throws SQLException {
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		
//		String sql = "select borad_id,borad_visit,borad_suggestion,borad_date,camp_name,to_char(borad_period_first,'YYYY-MM-DD') as \"borad_period_first\",to_char(borad_period_second,'YYYY-MM-DD')as \"borad_period_second\",borad_name,name,borad_text,borad_img from borad where borad_id=?";
//		BoradDto dto = new BoradDto();
//		try {
//			connection = getConnection();
//			pstmt = connection.prepareStatement(sql);
//			pstmt.setInt(1, borad_id);
//			ResultSet rs = pstmt.executeQuery();
//			
//			rs.next();
//			dto.setBorad_id(rs.getInt("borad_id"));
//			dto.setBorad_visit(rs.getInt("borad_visit"));
//			dto.setBorad_suggestion(rs.getInt("borad_suggestion"));
//			dto.setBorad_date(rs.getString("borad_date"));
//			dto.setCamp_name(rs.getString("camp_name"));
//			dto.setBorad_period_first(rs.getString("borad_period_first"));
//			dto.setBorad_period_second(rs.getString("borad_period_second"));
//			dto.setBorad_name(rs.getString("borad_name"));
//			dto.setName(rs.getString("name"));
//			dto.setBorad_text(rs.getString("borad_text"));
//			dto.setBorad_img(rs.getString("borad_img"));
//			rs.close();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			connection.close();
//			pstmt.close();
//		}
//		return dto;
//	}
//	//게시판 조회수 올려주는 메소드
//	public void increaseVisit(int borad_id) throws SQLException {
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		String sql = "update borad set borad_visit=borad_visit+1 where borad_id="+borad_id;
//		try {
//			connection = getConnection();
//			pstmt = connection.prepareStatement(sql);
//			pstmt.executeUpdate(sql);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			connection.close();
//			pstmt.close();
//		}
//	}
//	//게시판 수정 메소드
//	public boolean updateDB(int id,BoradDto boradDto) throws SQLException {
//		
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		
//		String sql = "update borad set borad_name=?,camp_name=?,borad_period_first=?,borad_period_second=?,borad_text=?,borad_img=? where borad_id="+id;
//		try {
//			connection = getConnection();
//			pstmt = connection.prepareStatement(sql);
//			pstmt.setString(1,boradDto.getBorad_name());
//			pstmt.setString(2,boradDto.getCamp_name());
//			pstmt.setString(3,boradDto.getBorad_period_first());
//			pstmt.setString(4,boradDto.getBorad_period_second());
//			pstmt.setString(5,boradDto.getBorad_text());
//			pstmt.setString(6,boradDto.getBorad_img());
//			pstmt.executeUpdate();
//		}catch(SQLException e) {
//			e.printStackTrace();
//			return false;
//		}finally {
//			connection.close();
//			pstmt.close();
//		}
//		return true;
//	}
//	//게시판 삭제 메소드
//	public boolean deleteDB(int borad_id) throws SQLException {
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		
//		String sql = "delete from borad where borad_id="+borad_id;
//		
//		try {
//			connection = getConnection();
//			pstmt = connection.prepareStatement(sql);
//			pstmt.executeUpdate();
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			connection.close();
//			pstmt.close();
//		}
//		return true;
//	}
	//게시판 글 갯수 반환해주는 메소드
	public int getDBcount() throws SQLException {
		String sql = "SELECT count(*) from board";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
//	
//	public void increaseSuggest(int borad_id) throws SQLException {
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		String sql = "update borad set borad_suggestion=borad_suggestion+1 where borad_id="+borad_id;
//		try {
//			connection = getConnection();
//			pstmt = connection.prepareStatement(sql);
//			pstmt.executeUpdate(sql);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			connection.close();
//			pstmt.close();
//		}
//	}
//	
//	public void decreaseSuggest(int borad_id) throws SQLException {
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		String sql = "update borad set borad_suggestion=borad_suggestion-1 where borad_id="+borad_id;
//		try {
//			connection = getConnection();
//			pstmt = connection.prepareStatement(sql);
//			pstmt.executeUpdate(sql);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			connection.close();
//			pstmt.close();
//		}
//	}
}