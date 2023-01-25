package com.campick.tag.service;

import java.io.BufferedReader;	
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campick.tag.model.RegId;

@Service
public class weatherAPI {

	public Map<String, Object> execute(String addr) throws IOException {
		 Map<String, Object> weather = new HashMap<String, Object>();
		RegId regid = new RegId();
		//regId값
		String regId = regid.getRegId(addr);
		
		//현재 시간
		LocalDateTime now = LocalDateTime.now();
		int year =  now.getYear();
		String monthValue = Integer.toString(now.getMonthValue()); // 월(숫자)
		if(monthValue.length()<2) {
			monthValue="0"+monthValue;
		}
		System.out.println(monthValue);
		
		int dayOfMonth = now.getDayOfMonth(); // 일(월 기준)

		String hour=null;
		if(now.getHour()>6) {
			 hour = "06";
		}else {
			hour = "06";
			dayOfMonth=dayOfMonth-1; //6시 기준 업뎃 -> 6시가 안지났으면 하루 전 6시 기준
		}
		String tmFc=year+monthValue+dayOfMonth+hour+"00";
       System.out.println(tmFc);

       //--------------------------------------------중기 기온 예보-------------------------//
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=xlRnP2Wlm5LZgDIWftYtYGO1kI9t0NcsPJrY2jm8Cvq9zvoMdMDRsi4yLD%2BS7QXhh%2FMX7w3CxOjgP9kmpelWyw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode(regId, "UTF-8"));/*요청자료형식(XML/JSON)Default: XML*/
      //  urlBuilder.append("&" + URLEncoder.encode("stnId","UTF-8") + "=" + URLEncoder.encode("108", "UTF-8")); /*108 전국, 109 서울, 인천, 경기도 등 (활용가이드 하단 참고자료 참조)*/
        urlBuilder.append("&" + URLEncoder.encode("tmFc","UTF-8") + "=" + URLEncoder.encode(tmFc, "UTF-8")); /*-일 2회(06:00,18:00)회 생성 되며 발표시각을 입력 YYYYMMDD0600 (1800)-최근 24시간 자료만 제공*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        String result = sb.toString();
        System.out.println(sb.toString());
        
        //JSONPObject jsonObj = new JSONPObject("result", result);
        JSONParser jsonParse = new JSONParser();
        try {
			JSONObject jsonObj = (JSONObject) jsonParse.parse(result);
			JSONObject response = (JSONObject)jsonObj.get("response");
			JSONObject body = (JSONObject)response.get("body");
			JSONObject items = (JSONObject)body.get("items");
			JSONArray item = (JSONArray)items.get("item");
			JSONObject weatherItem = (JSONObject) item.get(0);
			System.out.println(weatherItem.get("taMin3"));
			
			//map에 저장
          
            weather.put("taMin3", weatherItem.get("taMin3"));
            weather.put("taMin3Low", weatherItem.get("taMin3Low"));
            weather.put("taMin3High", weatherItem.get("taMin3High"));
            weather.put("taMax3", weatherItem.get("taMax3"));
            weather.put("taMax3Low", weatherItem.get("taMax3Low"));
            weather.put("taMax3High", weatherItem.get("taMax3High"));
            
            weather.put("taMin4", weatherItem.get("taMin4"));
            weather.put("taMin4Low", weatherItem.get("taMin4Low"));
            weather.put("taMin4High", weatherItem.get("taMin4High"));
            weather.put("taMax4", weatherItem.get("taMax4"));
            weather.put("taMax4Low", weatherItem.get("taMax4Low"));
            weather.put("taMax4High", weatherItem.get("taMax4High"));
            
            weather.put("taMin5", weatherItem.get("taMin5"));
            weather.put("taMin5Low", weatherItem.get("taMin5Low"));
            weather.put("taMin5High", weatherItem.get("taMin5High"));
            weather.put("taMax5", weatherItem.get("taMax5"));
            weather.put("taMax5Low", weatherItem.get("taMax5Low"));
            weather.put("taMax5High", weatherItem.get("taMax5High"));
            
            weather.put("taMin6", weatherItem.get("taMin6"));
            weather.put("taMin6Low", weatherItem.get("taMin6Low"));
            weather.put("taMin6High", weatherItem.get("taMin6High"));
            weather.put("taMax6", weatherItem.get("taMax6"));
            weather.put("taMax6Low", weatherItem.get("taMax6Low"));
            weather.put("taMax6High", weatherItem.get("taMax6High"));
            
            
            weather.put("taMin7", weatherItem.get("taMin7"));
            weather.put("taMin7Low", weatherItem.get("taMin7Low"));
            weather.put("taMin7High", weatherItem.get("taMin7High"));
            weather.put("taMax7", weatherItem.get("taMax7"));
            weather.put("taMax7Low", weatherItem.get("taMax7Low"));
            weather.put("taMax7High", weatherItem.get("taMax7High"));
            weather.put("dayOfMonth", dayOfMonth);
            weather.put("monthValue", monthValue);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return weather;

    }
}
