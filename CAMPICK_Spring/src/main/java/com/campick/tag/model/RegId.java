package com.campick.tag.model;

import java.io.IOException;

import org.springframework.stereotype.Repository;

public class RegId {
	public String getRegId(String addr) throws IOException {

		String[] strArr = addr.split(" ");
		String sigungu=strArr[1];
		System.out.println(sigungu);
		String regId = null;

		if(sigungu.equals("고양시")) {
			regId="11B20302";
		}else if(sigungu.equals("과천시")) {
			regId="11B10102";
		}else if(sigungu.equals("가평군")) {
			regId="11B20404";
		}else if(sigungu.equals("광명시")) {
			regId="11B10103";
		}else if(sigungu.equals("김포시")) {
			regId="11B20102";
		}else if(sigungu.equals("광주시")) {
			regId="11B20702";
		}else if(sigungu.equals("구리시")) {
			regId="11B20501";
		}else if(sigungu.equals("군포시")) {
			regId="11B20610";
		}else if(sigungu.equals("남양주시")) {
			regId="11B20502";
		}else if(sigungu.equals("동두천시")) {
			regId="11B20401";
		}else if(sigungu.equals("부천시")) {
			regId="11B20204";
		}else if(sigungu.equals("성남시")) {
			regId="11B20605";
		}else if(sigungu.equals("수원시")) {
			regId="11B20601";
		}else if(sigungu.equals("수원시")) {
			regId="11B20202";
		}else if(sigungu.equals("안산시")) {
			regId="11B20203";
		}else if(sigungu.equals("안성시")) {
			regId="11B20611";
		}else if(sigungu.equals("안양시")) {
			regId="11B20602";
		}else if(sigungu.equals("양주시")) {
			regId="11B20304";
		}else if(sigungu.equals("양평군")) {
			regId="11B20503";
		}else if(sigungu.equals("여주시")) {
			regId="11B20703";
		}else if(sigungu.equals("연천군")) {
			regId="11B20402";
		}else if(sigungu.equals("오산시")) {
			regId="11B20603";
		}else if(sigungu.equals("용인시")) {
			regId="11B20612";
		}else if(sigungu.equals("의왕시")) {
			regId="11B20609";
		}else if(sigungu.equals("의정부시")) {
			regId="11B20301";
		}else if(sigungu.equals("이천시")) {
			regId="11B20701";
		}else if(sigungu.equals("파주시")) {
			regId="11B20305";
		}else if(sigungu.equals("평택시")) {
			regId="11B20606";
		}else if(sigungu.equals("포천시")) {
			regId="11B20403";
		}else if(sigungu.equals("하남시")) {
			regId="11B20504";
		}else if(sigungu.equals("화성시")) {
			regId="11B20604";
		}
		return regId;
}

}
