package com.campick.board.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.campick.paging.PagingVO;

@Repository
public class BoardDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private class BoardDtoMapper implements RowMapper<BoardDto>{

		@Override
		public BoardDto mapRow(ResultSet rs, int rowNum) throws SQLException {
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
		System.out.println("getDBList 들어옴");
		String sql = "select * from (select rownum rn , a.* from (select b.* from board b order by board_id desc) a ) where rn >=? and rn <=?";
		return jdbcTemplate.query(sql, new BoardDtoMapper(),startRow,startRow+pageSize-1);
	}
	
	//게시판 글 상세 페이지 정보를 불러오는 메세지
	public BoardDto getDB(int board_id) throws SQLException {
		increaseVisit(board_id);
		String sql = "select board_id,board_visit,board_suggestion,board_date,camp_name,to_char(board_period_first,'YYYY-MM-DD') as \"board_period_first\",to_char(board_period_second,'YYYY-MM-DD')as \"board_period_second\",board_name,name,board_text,board_img from board where board_id=?";
		return jdbcTemplate.queryForObject(sql, new BoardDtoMapper(),board_id);
	}
	//게시판 조회수 올려주는 메소드
	private void increaseVisit(int board_id) throws SQLException {
		String sql = "update board set board_visit=board_visit+1 where board_id=?";
		jdbcTemplate.update(sql,board_id);
	}
	//게시판 수정 메소드
	public void updateDB(String bn,String cn,String bpf,String bps,String bt,String bi,int b_id) throws SQLException {
		String sql = "update board set board_name=?,camp_name=?,board_period_first=?,board_period_second=?,board_text=?,board_img=? where board_id=?";
		jdbcTemplate.update(sql, bn,cn,bpf,bps,bt,bi,b_id);
	}
	//게시판 삭제 메소드
	public void deleteDB(int board_id) throws SQLException {
		String sql = "delete from board where board_id=?";
		jdbcTemplate.update(sql,board_id);
	}
	//게시판 글 갯수 반환해주는 메소드
	public int getDBcount() throws SQLException {
		String sql = "SELECT count(*) from board";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public void increaseSuggest(int board_id) throws SQLException {
		String sql = "update board set board_suggestion=board_suggestion+1 where board_id=?";
		jdbcTemplate.update(sql,board_id);
	}
	
	public void decreaseSuggest(int board_id) throws SQLException {
		String sql = "update board set board_suggestion=board_suggestion-1 where board_id=?";
		jdbcTemplate.update(sql,board_id);
	}
	
	//마이페이지 글 리스트 및 카운트
	public ArrayList<BoardDto> myWriteList(String name, PagingVO vo){
		String sql="select * from (select rownum rn, a.* from (select b.* from board b where name=? order by board_id desc) a)where rn >=? and rn<=?";
		return (ArrayList<BoardDto>) jdbcTemplate.query(sql, new BoardDtoMapper(), name, vo.getStart(), vo.getEnd());
	}
	
	public int getMylist(String name) throws SQLException{
		String sql = "SELECT count(*) from board where name=?";
		return jdbcTemplate.queryForObject(sql, Integer.class, name);
	}
}