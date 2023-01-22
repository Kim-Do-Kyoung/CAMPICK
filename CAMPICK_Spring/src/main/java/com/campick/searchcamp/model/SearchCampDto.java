package com.campick.searchcamp.model;

import java.util.ArrayList;

public class SearchCampDto {
	private int camp_id; //캠프 id
	private String camp_name; //캠핑장 이름
	private String lineIntro; //한줄 소개
	private String intro; //캠핑장 소개 글
	private String facility; //캠핑 테마 (일반야영장,글램핑..)
	private String place; // 계곡, 숲 등 위치
	private String doNm; // 시/도 이름
	private String sigunguNm; //시군구 이름
	private String addr; //캠핑장 주소
	private String mapX; // 캠핑장 x좌표
	private String mapY; // 캠핑장 y좌표
	private String tel; //캠핑장 전화번호
	private String homepage; //캠핑장 홈페이지
	private String season; //캠핑장 시즌
	private String operdate; //평일 + 주말
	private String subPlace; //부대 시설
	private String playPlace; //계곡, 물놀이, 낚시 등등
	private String thema; //캠핑 테마 (여름 물놀이,스키 등등)
	private String eqpmnlendcl; //캠핑 장비
	private String exprnprogrm; //체험, 놀거리
	private String siteBottom1; //바닥 잔디
	private String siteBottom2; //바닥 데크
	private String siteBottom3; //바닥 파쇄석
	private String siteBottom4; //바닥 자갈
	private String siteBottom5; //바닥 맨흙
	private int camp_count; // 캠핑장 카운트
	
	private ArrayList<SearchCampDto> imgUrl; //이미지 주소
	
	public ArrayList<SearchCampDto> getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(ArrayList<SearchCampDto> imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	
	public int getCamp_count() {
		return camp_count;
	}
	public void setCamp_count(int camp_count) {
		this.camp_count = camp_count;
	}
	public int getCamp_id() {
		return camp_id;
	}
	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}
	public String getCamp_name() {
		return camp_name;
	}
	public void setCamp_name(String camp_name) {
		this.camp_name = camp_name;
	}
	public String getLineIntro() {
		return lineIntro;
	}
	public void setLineIntro(String lineIntro) {
		this.lineIntro = lineIntro;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getFacility() {
		return facility;
	}
	public void setFacility(String facility) {
		this.facility = facility;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getDoNm() {
		return doNm;
	}
	public void setDoNm(String doNm) {
		this.doNm = doNm;
	}
	public String getSigunguNm() {
		return sigunguNm;
	}
	public void setSigunguNm(String sigunguNm) {
		this.sigunguNm = sigunguNm;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMapX() {
		return mapX;
	}
	public void setMapX(String mapX) {
		this.mapX = mapX;
	}
	public String getMapY() {
		return mapY;
	}
	public void setMapY(String mapY) {
		this.mapY = mapY;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getOperdate() {
		return operdate;
	}
	public void setOperdate(String operdate) {
		this.operdate = operdate;
	}
	public String getSubPlace() {
		return subPlace;
	}
	public void setSubPlace(String subPlace) {
		this.subPlace = subPlace;
	}
	public String getPlayPlace() {
		return playPlace;
	}
	public void setPlayPlace(String playPlace) {
		this.playPlace = playPlace;
	}
	public String getThema() {
		return thema;
	}
	public void setThema(String thema) {
		this.thema = thema;
	}
	public String getEqpmnlendcl() {
		return eqpmnlendcl;
	}
	public void setEqpmnlendcl(String eqpmnlendcl) {
		this.eqpmnlendcl = eqpmnlendcl;
	}
	public String getExprnprogrm() {
		return exprnprogrm;
	}
	public void setExprnprogrm(String exprnprogrm) {
		this.exprnprogrm = exprnprogrm;
	}
	public String getSiteBottom1() {
		return siteBottom1;
	}
	public void setSiteBottom1(String siteBottom1) {
		this.siteBottom1 = siteBottom1;
	}
	public String getSiteBottom2() {
		return siteBottom2;
	}
	public void setSiteBottom2(String siteBottom2) {
		this.siteBottom2 = siteBottom2;
	}
	public String getSiteBottom3() {
		return siteBottom3;
	}
	public void setSiteBottom3(String siteBottom3) {
		this.siteBottom3 = siteBottom3;
	}
	public String getSiteBottom4() {
		return siteBottom4;
	}
	public void setSiteBottom4(String siteBottom4) {
		this.siteBottom4 = siteBottom4;
	}
	public String getSiteBottom5() {
		return siteBottom5;
	}
	public void setSiteBottom5(String siteBottom5) {
		this.siteBottom5 = siteBottom5;
	}
	
	
}
