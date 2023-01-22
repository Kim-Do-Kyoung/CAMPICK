package com.campick.comment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private class CommentDtoMapper implements RowMapper<CommentDto>{
		@Override
		public CommentDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			CommentDto cDto = new CommentDto();
			cDto.setReply_id(rs.getInt("reply_id"));
			cDto.setBoard_id(rs.getInt("board_id"));
			cDto.setDepth(rs.getInt("depth"));
			cDto.setBundle_id(rs.getInt("bundle_id"));
			cDto.setName(rs.getString("name"));
			cDto.setReply(rs.getString("reply"));
			cDto.setReply_time(rs.getString("reply_time"));
			return cDto;
		}
		
	}
	public void insertComment(int board_id,String name,String reply) throws SQLException {
		//DB에 insert할 sql문
		String sql = "insert into board_comment values (reply_id_seq.nextval,?,0,bundle_id_seq.nextval,?,?,to_char(sysdate,'yyyy.mm.dd hh24:mi:ss'))";
		jdbcTemplate.update(sql,board_id,name,reply);
	}
	public List<CommentDto> getDBList(String board_id) throws SQLException{
		System.out.println("comment db List !");
		String sql = "SELECT * from board_comment where board_id=? ORDER BY bundle_id,depth,reply_id";
		return jdbcTemplate.query(sql, new CommentDtoMapper(),board_id);
	}

	public void insertReComment(int board_id,int bundle_id, String name,String reply) throws SQLException {
		String sql = "insert into board_comment values (reply_id_seq.nextval,?,1,?,?,?,to_char(sysdate,'yyyy.mm.dd hh24:mi:ss'))";
		jdbcTemplate.update(sql,board_id,bundle_id,name,reply);
	}
}
