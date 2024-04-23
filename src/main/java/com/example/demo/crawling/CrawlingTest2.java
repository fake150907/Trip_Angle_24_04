package com.example.demo.crawling;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

record RegionInfoTips(String information, String voltage, String language, String climate, String timeDifference,
		String rate, String tips, int regionId) {

}

public class CrawlingTest2 {

	private WebDriver driver;
	private String url;

	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

	public void crawling() throws SQLException, ClassNotFoundException {
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		driver = new ChromeDriver(options);

		url = "https://travel.naver.com/overseas/JPOSA298566/city/prepare";
		driver.get(url);

		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		//여행정보 리스트 상단 제목
		List<WebElement> informNames = driver.findElements(By.className("item_name__rmJh2"));
		
		//여행정보 리스트 하단 텍스트
		List<WebElement> informValues = driver.findElements(By.className("item_value__JKA9S"));
		
		 List<RegionInfoTips> regionInfoTipsList = new ArrayList<>();

		    int size = Math.min(informNames.size(), informValues.size());
		    String information = "";
		    String voltage = "";
		    String language = "";
		    String climate = "";
		    String timeDifference = "";
		    String rate = "";
		    String tips = "";
		    int regionId = 0;

		    for (int i = 0; i < size; i++) {
		        String informName = informNames.get(i).getText();
		        String informValue = informValues.get(i).getText();
		        
		        switch (informName) {
		            case "설명문":
		                information = informValue;
		                break;
		            case "전압":
		                voltage = informValue;
		                break;
		            case "언어":
		                language = informValue;
		                break;
		            case "기후":
		                climate = informValue;
		                break;
		            case "시차":
		                timeDifference = informValue;
		                break;
		            case "환율":
		                rate = informValue;
		                break;
		            case "팁":
		                tips = informValue;
		                break;
		            case "지역 아이디":
		                regionId = Integer.parseInt(informValue);
		                break;
		        }
		    }

		regionInfoTipsList.add(new RegionInfoTips(information, voltage, language, climate, timeDifference, rate, tips, regionId));

		String url = "jdbc:mysql://127.0.0.1:3306/Trip_Angle_24_04?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeBehavior=convertToNull";
	    Connection conn = DriverManager.getConnection(url, "root", "");
	    String insertQuery = "INSERT INTO regionInfoTips (information, Voltage, language, climate, timeDifference, rate, tips, regionId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	    PreparedStatement pstmt = conn.prepareStatement(insertQuery);

	    for (RegionInfoTips info : regionInfoTipsList) {
	        pstmt.setString(1, info.information());
	        pstmt.setString(2, info.voltage());
	        pstmt.setString(3, info.language());
	        pstmt.setString(4, info.climate());
	        pstmt.setString(5, info.timeDifference());
	        pstmt.setString(6, info.rate());
	        pstmt.setString(7, info.tips());
	        pstmt.setInt(8, info.regionId());
	        pstmt.executeUpdate();
	    }


		System.out.println("DB 전송 완료");
		conn.close();
	}

	public static void main(String[] args) {
		CrawlingTest2 crawler = new CrawlingTest2();
	    try {
	        crawler.crawling();
	    } catch (ClassNotFoundException e) {
	        System.out.println("드라이버 로딩에 실패했습니다.");
	        e.printStackTrace();
	    } catch (SQLException e) {
	        System.out.println("데이터베이스 처리 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	}
}