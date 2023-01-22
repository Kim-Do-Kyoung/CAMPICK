package com.campick.suggest.model;

public class SuggestDto {
	private int sug_id;
	private int board_id;
	private String id;
	private String name;
	private int checked;
	
	
	public int getSug_id() {
		return sug_id;
	}
	public void setSug_id(int sug_id) {
		this.sug_id = sug_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	
}
