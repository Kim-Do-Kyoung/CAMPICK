package com.campick.board.model;

public class BoardDto {
	private int board_id;
	private int board_visit;
	private int board_suggestion;
	private String board_date;
	private String camp_name;
	private String board_period_first;
	private String board_period_second;
	private String board_name;
	private String name;
	private String board_text;
	private String board_img;
	private int db_count;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getBoard_visit() {
		return board_visit;
	}
	public void setBoard_visit(int board_visit) {
		this.board_visit = board_visit;
	}
	public int getBoard_suggestion() {
		return board_suggestion;
	}
	public void setBoard_suggestion(int board_suggestion) {
		this.board_suggestion = board_suggestion;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getCamp_name() {
		return camp_name;
	}
	public void setCamp_name(String camp_name) {
		this.camp_name = camp_name;
	}
	public String getBoard_period_first() {
		return board_period_first;
	}
	public void setBoard_period_first(String board_period_first) {
		this.board_period_first = board_period_first;
	}
	public String getBoard_period_second() {
		return board_period_second;
	}
	public void setBoard_period_second(String board_period_second) {
		this.board_period_second = board_period_second;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBoard_text() {
		return board_text;
	}
	public void setBoard_text(String board_text) {
		this.board_text = board_text;
	}
	public String getBoard_img() {
		return board_img;
	}
	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}
	public int getDb_count() {
		return db_count;
	}
	public void setDb_count(int db_count) {
		this.db_count = db_count;
	}
	
	
}