package com.example.demo.crawlling;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

record informationText(String name, String content) {

}

public class CrawlingTest {

	private WebDriver driver;
	private String url;

	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

	public void crawling() throws SQLException, ClassNotFoundException {
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		driver = new ChromeDriver(options);

		url = "https://travel.naver.com/overseas/GBLON186338/city/prepare";
		driver.get(url);

		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		
		//여행정보 리스트 상단 제목
		List<WebElement> informs = driver.findElements(By.className("item_name__rmJh2"));
		
		//여행정보 리스트 하단 텍스트
		List<WebElement> informs2 = driver.findElements(By.className("item_value__JKA9S"));
		
		List<informationText> informationTextList = new ArrayList<>();
		
		for (int i = 0; i < informs.size(); i++) {
		    WebElement informGet = informs.get(i);
		    String informText = informGet.getText();
		    WebElement informGet2 = informs2.get(i);
		    String informText2 = informGet2.getText();
		    informationTextList.add(new informationText(informText, informText2));
		}

		String url = "jdbc:mysql://127.0.0.1:3306/Trip_Angle_24_04?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeBehavior=convertToNull";

		Connection conn = DriverManager.getConnection(url, "root", "");	

		String information = "INSERT INTO regionInfoTips (regDate, `name`, content) VALUES (NOW(), ?, ?)";

		PreparedStatement pstmt = conn.prepareStatement(information);

		for (informationText infoText : informationTextList) {
			pstmt.setString(1, infoText.name());
			pstmt.setString(2, infoText.content());
			pstmt.executeUpdate();
		}

		System.out.println("DB 전송 완료");
		conn.close();
	}

	public static void main(String[] args) {
		CrawlingTest crawler = new CrawlingTest();
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