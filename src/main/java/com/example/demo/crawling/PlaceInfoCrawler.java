package com.example.demo.crawling;

import java.awt.AWTException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class PlaceInfoCrawler {
	private static WebDriver driver;
	private static String url;

	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

	public static void setWebDriver(WebDriver driver) {
		PlaceInfoCrawler.driver = driver;
	}

	public static void crawlPlaces() throws InterruptedException, AWTException, SQLException, ClassNotFoundException {
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		driver = new ChromeDriver(options);

		driver.manage().window().maximize();

		url = "https://travel.naver.com/overseas/GRATN4126654/poi/summary";
		driver.get(url);

		Thread.sleep(3000);

		// 시간 상세보기 탭 선택
		// 시간
//		String operatingTime = "";
//		try {
//			WebElement button = driver.findElement(By.className("home_expand__xUbeG"));
//
//			button.click();
//			List<WebElement> elements = driver.findElements(By.xpath("//p"));
//			WebElement element = driver.findElement(By.className("home_times__GoPm9"));
//			StringBuilder operatingTimeBuilder = new StringBuilder();
//			for (int j = 0; j < elements.size(); j++) {
//				String DATETIME = elements.get(j).getText();
//				String temp = DATETIME + "; ";
//				operatingTimeBuilder.append(temp);
//			}
//			operatingTime = operatingTimeBuilder.toString();
//			operatingTime = element.getText();
//
//		} catch (Exception ex) {
//			operatingTime = null;
//		}

		// 가게 이름
		String name;
		try {
			WebElement nameElement = driver.findElement(By.className("commonGeoInfo_title__8p2UW"));
			name = nameElement.getText();
		} catch (Exception ex) {
			name = null;
		}

		String imgUrl1 = null;
		String imgUrl2 = null;
		String imgUrl3 = null;
		String imgUrl4 = null;
		String imgUrl5 = null;

		// 이미지 url 가져오기
		List<WebElement> placeImgElements = driver.findElements(By.tagName("img")); // img 가져오기
		// 매장 같은 클래스 이름을 가진 친구들이 총 3개 데이터 저장을 위한 반복문
		for (int i = 3; i < 8; i++) {
			try {
				WebElement placeElement = placeImgElements.get(i); // i번째 매장 요소

				if (i == 3) {
					imgUrl1 = placeElement.getAttribute("src");
				}
				if (i == 4) {
					imgUrl2 = placeElement.getAttribute("src");
				}
				if (i == 5) {
					imgUrl3 = placeElement.getAttribute("src");
				}
				if (i == 6) {
					imgUrl4 = placeElement.getAttribute("src");
				}
				if (i == 7) {
					imgUrl5 = placeElement.getAttribute("src");
				}
				Thread.sleep(3000); // 대기시간 (필요시 조정)

			} catch (Exception e) {

				if (i == 3) {
					imgUrl1 = null;
				}
				if (i == 4) {
					imgUrl2 = null;
				}
				if (i == 5) {
					imgUrl3 = null;
				}
				if (i == 6) {
					imgUrl4 = null;
				}
				if (i == 7) {
					imgUrl5 = null;
				}
			}
		}

		// 주소 정보
		String address = "";
		// 유적지 가격
		String price = "";

		// 시설 정보
		String facilities = "";
		// 번호
		String phoneNum = "";
		// 가게 평점
		String grade = "";
		try {
			WebElement gradeElement = driver.findElement(By.className("home_score__tptYN"));
			grade = gradeElement.findElement(By.xpath("./*[1]")).getText();
		} catch (Exception e) {
			grade = null;
		}

		List<WebElement> placeNameElements = driver.findElements(By.className("home_subject__9A834"));

		for (int i = 0; i < placeNameElements.size(); i++) {
			try {

				List<WebElement> placeElements = driver.findElements(By.className("home_cont__dmB3R"));

				for (int j = 0; j < placeElements.size(); j++) {
					System.out.println("요소 이름2:" + placeNameElements.get(j).getText());
					System.out.println("이름2:" + placeElements.get(j).getText());

					if (placeNameElements.get(j).getText().equals("주소")) {
//						address = placeElements.get(j).findElement(By.xpath("./*[1]")).getText();
						address = placeElements.get(j).findElement(By.xpath("./*[1]")).getText();
						System.out.println("address:" + address);

					} else if (placeNameElements.get(j).getText().equals("가격")) {

						WebElement priceElement = driver.findElement(By.className("home_menu__FtSCQ"));

						price = priceElement.getText();
						System.out.println("price:" + price);

					} else if (placeNameElements.get(j).getText().equals("전화")) {
//						phoneNum = placeElements.get(j).findElement(By.xpath("./*[1]")).getText();
						phoneNum = placeElements.get(j).getText();
						System.out.println("phoneNum:" + phoneNum);

					} else if (placeNameElements.get(j).getText().equals("시설")) {

//						facilities = placeElements.get(j).findElement(By.xpath("./*[1]")).getText();
						facilities = placeElements.get(j).getText();
						System.out.println("facilities:" + facilities);
					}
				}

			} catch (Exception e) {
				System.out.println("그딴건 없어");

			}

		}

		// 리뷰 갯수 가져오기
		url = "https://travel.naver.com/overseas/GRATN6691018/poi/review/ta";
		driver.get(url);

		String reviewCount = null;

		try {
			WebElement reviewCountElement = driver.findElement(By.className("review_participant__lhOeG"));
			reviewCount = reviewCountElement.getText();
		} catch (Exception ex) {
			reviewCount = null;
		}

		String placeInsertSql = "INSERT INTO recommendSpot (regDate, updateDate, groceryName, address,phoneNumber,facilities,grade,imageUrl1,imageUrl2,imageUrl3,imageUrl4,imageUrl5,reviewCount,price) VALUES (NOW(), NOW(), ?, ?, ? ,?, ?, ?,?,?,?,?,?,?)";
		// 크롤링이 끝난 후에는 WebDriver를 종료
		// driver.quit();
		PlaceInfoDto place = new PlaceInfoDto(name, address, phoneNum, facilities, grade, imgUrl1, imgUrl2, imgUrl3,
				imgUrl4, imgUrl5, reviewCount, price);

		url = "jdbc:mysql://127.0.0.1:3306/Trip_Angle_24_04?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeBehavior=convertToNull";
		Connection conn = DriverManager.getConnection(url, "root", "");
		conn.setAutoCommit(false);
		conn.prepareStatement(url);

		PreparedStatement pstmt = conn.prepareStatement(placeInsertSql, PreparedStatement.RETURN_GENERATED_KEYS);
		pstmt.setString(1, place.getName());
		pstmt.setString(2, place.getAddress());
		pstmt.setString(3, place.getPhoneNumber());
		pstmt.setString(4, place.getFacilities());
		pstmt.setString(5, place.getGrade());
		pstmt.setString(6, place.getImageUrl1());
		pstmt.setString(7, place.getImageUrl2());
		pstmt.setString(8, place.getImageUrl3());
		pstmt.setString(9, place.getImageUrl4());
		pstmt.setString(10, place.getImageUrl5());
		pstmt.setString(11, place.getReviewCount());
		pstmt.setString(12, place.getPrice());

		pstmt.executeUpdate();
		ResultSet rs = pstmt.getGeneratedKeys();
		rs.next();

		pstmt.close();

		conn.commit();
		conn.close();

	}

	public static void main(String[] args)
			throws InterruptedException, AWTException, SQLException, ClassNotFoundException {
		crawlPlaces();
	}
}