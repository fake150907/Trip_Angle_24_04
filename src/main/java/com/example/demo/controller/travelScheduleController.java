package com.example.demo.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class travelScheduleController {

	@RequestMapping("/usr/schedule/travelSchedule")
	public String showMyPlanList() {

		return "/usr/schedule/travelSchedule";
	}

	@RequestMapping("/usr/schedule/ticketing")
	// 파라미터로 도시 id, 유저 id 세션으로 받아야함 
	public String travelSchedule(String title, String content, String checkInDate, String checkOutDate) {
		ResultSet rset = null;

		try {

			String url = "jdbc:mysql://127.0.0.1:3306/Trip_Angle_24_04?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeBehavior=convertToNull";
			Connection conn = DriverManager.getConnection(url, "root", "");
			String insertQuery = "INSERT INTO travelSchedule(regDate, updateDate, `name`, `description`, startDate, endDate, regionId, memberId) VALUES(NOW(), NOW(), ?, ?, ?, ?, 1, 1)";
			PreparedStatement pstmt = conn.prepareStatement(insertQuery);

			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, checkInDate);
			pstmt.setString(4, checkOutDate);
			pstmt.executeUpdate();

			System.out.println("DB 전송 완료");
			conn.close();

	    } catch (SQLException e) {
	        System.out.println("데이터베이스 처리 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
		
		return "/usr/schedule/ticketing";
	}

}	