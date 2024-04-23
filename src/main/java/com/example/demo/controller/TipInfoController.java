package com.example.demo.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TipInfoController {

	@RequestMapping("/usr/tipInfo/information")
	public String showinformation() {

		return "/usr/tipInfo/information";
	}
	
	@RequestMapping("/usr/tipInfo/honeyTips")
	public String showHoneyTips(Model model) {
		ResultSet rset = null;

		try {

			String url = "jdbc:mysql://127.0.0.1:3306/Trip_Angle_24_04?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeBehavior=convertToNull";
		    Connection conn = DriverManager.getConnection(url, "root", "");
		    String selectQuery = "SELECT * FROM regionInfoTips";
		    PreparedStatement pstmt = conn.prepareStatement(selectQuery);

		    rset = pstmt.executeQuery();

		    while (rset.next()) {

		    	String Voltage = rset.getString("Voltage").trim();
		        String language = rset.getString("language").trim();
		        String TimeDifference = rset.getString("TimeDifference").trim();
		        String rate = rset.getString("rate").trim();
		        String tips = rset.getString("tips").trim();
		        
		        if(tips.length() == 0) {
		        	tips = "팁 문화가 없어요!";
		        }

		        model.addAttribute("Voltage", Voltage);
		        model.addAttribute("language", language);
		        model.addAttribute("TimeDifference", TimeDifference);
		        model.addAttribute("rate", rate);
		        model.addAttribute("tips", tips);

		    }

		    conn.close();

	    } catch (SQLException e) {
	        System.out.println("데이터베이스 처리 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
		
		return "/usr/tipInfo/honeyTips";
	}
}