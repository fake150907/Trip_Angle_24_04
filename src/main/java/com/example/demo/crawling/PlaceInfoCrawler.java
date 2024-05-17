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
	// 크롤링에 필요한 WebDriver를 담을 변수
	private static WebDriver driver;
	// 데이터를 크롤링할 페이지의 URL을 담을 변수
	private static String url;

	// 크롤링할때 쓸 드라이버의 ID
	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	// 크롤링할때 쓸 드라이버의 위치를 나타낸 경로
	public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

	// 드라이버 setter
	public static void setWebDriver(WebDriver driver) {
		PlaceInfoCrawler.driver = driver;
	}

	// 추천장소의 정보를 크롤링할 함수 선언
	public static void crawlPlaceInfo()
			throws InterruptedException, AWTException, SQLException, ClassNotFoundException {

		// 위에서 선언했었던 ID,PATH를 웹 드라이버의 속성으로 설정
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		// Chrome 브라우저를 제어하는 동안 설정할 수 있는 다양한 옵션들을 관리하기 위해 ChromeOptions객체 생성
		ChromeOptions options = new ChromeOptions();

		// ChromeOptions에 Selenium을 사용하여 로컬로 실행되는 Chrome 브라우저를 제어하기위한
		// "ignoreProtectedModeSettings"라는 설정을 추가,
		options.setCapability("ignoreProtectedModeSettings", true);

		/*
		 * ChromeDriver 클래스의 객체 생성 이때 앞서 설정한 ChromeOptions 객체를 전달하여 Chrome 브라우저를 제어하는 데
		 * 사용할 옵션을 지정 웹 페이지를 열거나 상호 작용할 수 있다.
		 */
		driver = new ChromeDriver(options);

		// 크롤링할 페이지 창 최대화
		driver.manage().window().maximize();

		// 크롤링할 데이터의 url 정보를 변수에 담는다.
		url = "https://travel.naver.com/overseas/GRATN4126654/poi/summary";
		// WebDriver에게 지정된 URL로 이동하라고 명령
		driver.get(url);
		// 브라우저가 페이지를 완전히 로드하거나 동적 콘텐츠 로딩을 완료할 시간을 확보하기 위해 스레드를 3초 동안 멈춤.
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
			// 추천장소 이름 가져오기
			WebElement nameElement = driver.findElement(By.className("commonGeoInfo_title__8p2UW"));
			name = nameElement.getText();
		} catch (Exception ex) {
			name = null;
		}

		// 이미지 url을 담기위한 변수 선언
		String imgUrl1 = "";
		String imgUrl2 = "";
		String imgUrl3 = "";
		String imgUrl4 = "";
		String imgUrl5 = "";

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
					imgUrl1 = "";
				}
				if (i == 4) {
					imgUrl2 = "";
				}
				if (i == 5) {
					imgUrl3 = "";
				}
				if (i == 6) {
					imgUrl4 = "";
				}
				if (i == 7) {
					imgUrl5 = "";
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
			// 평점 가져오기
			WebElement gradeElement = driver.findElement(By.className("home_score__tptYN"));
			// 가져온 요소를 text로 변환
			grade = gradeElement.findElement(By.xpath("./*[1]")).getText();
		} catch (Exception e) {
			grade = null;
		}

		// 같은 클래스의 요소들을 가져오기 위한 변수 선언 및 list형식으로 담기.
		List<WebElement> placeNameElements = driver.findElements(By.className("home_subject__9A834"));

		for (int i = 0; i < placeNameElements.size(); i++) {
			try {
				// 같은 클래스의 요소들을 가져오기 위한 변수 선언 및 list형식으로 담기.
				List<WebElement> placeElements = driver.findElements(By.className("home_cont__dmB3R"));

				for (int j = 0; j < placeElements.size(); j++) {

					if (placeNameElements.get(j).getText().equals("주소")) {
//						address = placeElements.get(j).findElement(By.xpath("./*[1]")).getText();
						// 가져온 요소를 text로 변환
						address = placeElements.get(j).findElement(By.xpath("./*[1]")).getText();

					} else if (placeNameElements.get(j).getText().equals("가격")) {

						WebElement priceElement = driver.findElement(By.className("home_menu__FtSCQ"));
						// 가져온 요소를 text로 변환
						price = priceElement.getText();

					} else if (placeNameElements.get(j).getText().equals("전화")) {
//						phoneNum = placeElements.get(j).findElement(By.xpath("./*[1]")).getText();
						// 가져온 요소를 text로 변환
						phoneNum = placeElements.get(j).getText();

					} else if (placeNameElements.get(j).getText().equals("시설")) {

//						facilities = placeElements.get(j).findElement(By.xpath("./*[1]")).getText();
						// 가져온 요소를 text로 변환
						facilities = placeElements.get(j).getText();
					}
				}

			} catch (Exception e) {
				// 에러가 발생했을때 그런건 없다고 콘솔에 알려주는 로직
				System.out.println("그런건 없습니다.");
			}

		}

		// 리뷰 갯수 가져오기 위한 url
		url = "https://travel.naver.com/overseas/GRATN6691018/poi/review/ta";
		// WebDriver에게 지정된 URL로 이동하라고 명령
		driver.get(url);

		// 리뷰 갯수를 담기위한 변수 선언
		String reviewCount = "";

		try {
			// 클래스이름으로 요소가져와서 담기
			WebElement reviewCountElement = driver.findElement(By.className("review_participant__lhOeG"));
			// 가져온 요소를 text로 변환
			reviewCount = reviewCountElement.getText();
		} catch (Exception ex) {
			reviewCount = null;
		}

		String placeInsertSql = "INSERT INTO recommendSpot (regDate, updateDate, groceryName, address,phoneNumber,facilities,grade,imageUrl1,imageUrl2,imageUrl3,imageUrl4,imageUrl5,reviewCount,price) VALUES (NOW(), NOW(), ?, ?, ? ,?, ?, ?,?,?,?,?,?,?)";
		// 크롤링이 끝난 후에는 WebDriver를 종료
		// driver.quit();
		// 객체 생성 후 데이터 저장하기
		PlaceInfoDto place = new PlaceInfoDto(name, address, phoneNum, facilities, grade, imgUrl1, imgUrl2, imgUrl3,
				imgUrl4, imgUrl5, reviewCount, price);

		// DB에 저장하기 위한 DB 경로
		url = "jdbc:mysql://127.0.0.1:3306/Trip_Angle_24_04?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeBehavior=convertToNull";
		// 데이터베이스 연결을 생성합니다. URL, 사용자 이름, 비밀번호를 사용합니다.
		Connection conn = DriverManager.getConnection(url, "root", "");

		// 자동 커밋을 비활성화합니다. 수동으로 트랜잭션을 커밋할 것입니다.
		conn.setAutoCommit(false);

		// 주어진 URL로부터 준비된 문장을 생성합니다. (이 줄은 의도하지 않은 동작일 수 있습니다. 필요 없는 코드일 가능성이 큽니다.)
		conn.prepareStatement(url);

		// placeInsertSql을 기반으로 PreparedStatement를 생성합니다. 삽입된 키를 반환하도록 설정합니다.
		PreparedStatement pstmt = conn.prepareStatement(placeInsertSql, PreparedStatement.RETURN_GENERATED_KEYS);

		// PreparedStatement의 첫 번째 파라미터에 place 객체의 이름을 설정합니다.
		pstmt.setString(1, place.getName());

		// PreparedStatement의 두 번째 파라미터에 place 객체의 주소를 설정합니다.
		pstmt.setString(2, place.getAddress());

		// PreparedStatement의 세 번째 파라미터에 place 객체의 전화번호를 설정합니다.
		pstmt.setString(3, place.getPhoneNumber());

		// PreparedStatement의 네 번째 파라미터에 place 객체의 시설 정보를 설정합니다.
		pstmt.setString(4, place.getFacilities());

		// PreparedStatement의 다섯 번째 파라미터에 place 객체의 등급을 설정합니다.
		pstmt.setString(5, place.getGrade());

		// PreparedStatement의 여섯 번째 파라미터에 place 객체의 첫 번째 이미지 URL을 설정합니다.
		pstmt.setString(6, place.getImageUrl1());

		// PreparedStatement의 일곱 번째 파라미터에 place 객체의 두 번째 이미지 URL을 설정합니다.
		pstmt.setString(7, place.getImageUrl2());

		// PreparedStatement의 여덟 번째 파라미터에 place 객체의 세 번째 이미지 URL을 설정합니다.
		pstmt.setString(8, place.getImageUrl3());

		// PreparedStatement의 아홉 번째 파라미터에 place 객체의 네 번째 이미지 URL을 설정합니다.
		pstmt.setString(9, place.getImageUrl4());

		// PreparedStatement의 열 번째 파라미터에 place 객체의 다섯 번째 이미지 URL을 설정합니다.
		pstmt.setString(10, place.getImageUrl5());

		// PreparedStatement의 열한 번째 파라미터에 place 객체의 리뷰 수를 설정합니다.
		pstmt.setString(11, place.getReviewCount());

		// PreparedStatement의 열두 번째 파라미터에 place 객체의 가격을 설정합니다.
		pstmt.setString(12, place.getPrice());

		// SQL 업데이트 명령을 실행합니다. 데이터베이스에 데이터를 삽입합니다.
		pstmt.executeUpdate();

		// 생성된 키(자동 증가 필드)를 얻기 위해 ResultSet을 가져옵니다.
		ResultSet rs = pstmt.getGeneratedKeys();

		// ResultSet의 첫 번째 행으로 이동합니다. (생성된 키를 가져옴)
		rs.next();

		// PreparedStatement를 닫아 자원을 해제합니다.
		pstmt.close();

		// 트랜잭션을 커밋합니다. (모든 변경 사항을 영구적으로 저장)
		conn.commit();

		// 데이터베이스 연결을 닫아 자원을 해제합니다.
		conn.close();

	}

	// 크롤링 할때 필요한 메인메서드
	public static void main(String[] args)
			throws InterruptedException, AWTException, SQLException, ClassNotFoundException {
		// 크롤링 함수 실행
		crawlPlaceInfo();
	}
}