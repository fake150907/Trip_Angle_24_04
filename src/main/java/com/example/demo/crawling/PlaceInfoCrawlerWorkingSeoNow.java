//package com.example.demo.crawling;
//
//import java.awt.AWTException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.time.Duration;
//import java.util.List;
//
//import org.openqa.selenium.By;
//import org.openqa.selenium.TimeoutException;
//import org.openqa.selenium.WebDriver;
//import org.openqa.selenium.WebElement;
//import org.openqa.selenium.chrome.ChromeDriver;
//import org.openqa.selenium.chrome.ChromeOptions;
//import org.openqa.selenium.support.ui.ExpectedConditions;
//import org.openqa.selenium.support.ui.WebDriverWait;
//
//public class PlaceInfoCrawlerWorkingSeoNow {
//	private static WebDriver driver;
//	private static String url;
//
//	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
//	public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";
//
//	public static void setWebDriver(WebDriver driver) {
//		PlaceInfoCrawlerWorkingSeoNow.driver = driver;
//	}
//
//	public void crawlPlaces(List<PlaceInfoDto> placeInfoList)
//			throws InterruptedException, AWTException, SQLException, ClassNotFoundException {
//		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
//
//		ChromeOptions options = new ChromeOptions();
//		options.setCapability("ignoreProtectedModeSettings", true);
//		driver = new ChromeDriver(options);
//
//		driver.manage().window().maximize();
//
//		url = "jdbc:mysql://127.0.0.1:3306/Trip_Angle_24_04?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeBehavior=convertToNull";
//		Connection conn = DriverManager.getConnection(url, "root", "");
//		conn.setAutoCommit(false);
//		conn.prepareStatement(url);
//
//		for (PlaceInfoDto placeInfo : placeInfoList) {
//			url = String.format("https://travel.naver.com/overseas/%s/poi/summary", placeInfo.getNaverSpotCord());
//			driver.get(url);
//
//			// Thread.sleep(3000);
//			driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
//
//			System.out.println("시간측정 1: " + System.currentTimeMillis());
//
//			// 시간 상세보기 탭 선택
//			String operatingTime = null;
//			try {
//				List<WebElement> buttons = new WebDriverWait(driver, Duration.ofMillis(50))
//						.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.className("home_expand__xUbeG")));
//				if (!buttons.isEmpty()) {
//					WebElement button = buttons.get(0);
//
//					button.click();
//					List<WebElement> elements = driver.findElements(By.xpath("//p"));
//					StringBuilder operatingTimeBuilder = new StringBuilder();
//					for (int j = 0; j < elements.size(); j++) {
//						String DATETIME = elements.get(j).getText();
//						String temp = DATETIME + "; ";
//						operatingTimeBuilder.append(temp);
//					}
//					operatingTime = operatingTimeBuilder.toString();
//				}
//			} catch (TimeoutException ex) {
//				// operatingTime = null;
//			}
//			System.out.println("시간측정 1.2: " + System.currentTimeMillis());
//			// 시설 정보
//			String facilities = null;
//			try {
//				List<WebElement> facilitiesElements = new WebDriverWait(driver, Duration.ofMillis(50)).until(
//						ExpectedConditions.visibilityOfAllElementsLocatedBy(By.className("home_sentence__EmuEf")));
//				if (!facilitiesElements.isEmpty()) {
//					facilities = facilitiesElements.get(0).getText();
//				}
//			} catch (Exception ex) {
////				facilities = null;
//			}
//
//			System.out.println("시간측정 1.3: " + System.currentTimeMillis());
//			// 가게 이름
//			String name = null;
//			try {
//				WebDriverWait wait = new WebDriverWait(driver, Duration.ofMillis(50));
//				List<WebElement> nameElements = wait.until(ExpectedConditions
//						.visibilityOfAllElementsLocatedBy(By.className("commonGeoInfo_title__8p2UW")));
//				if (!nameElements.isEmpty()) {
//					name = nameElements.get(0).getText();
//				}
//
//			} catch (Exception ex) {
////				name = null;
//			}
//			System.out.println("시간측정 1.3: " + System.currentTimeMillis());
//			// 주소 정보
//			String address = null;
//
//			// 가게 평점
//			String grade = null;
//
//			// 가게 번호
//			String phoneNum = null;
//
//			String imgUrl1 = null;
//			String imgUrl2 = null;
//			String imgUrl3 = null;
//			String imgUrl4 = null;
//			String imgUrl5 = null;
//			String price = "";
//			System.out.println("시간측정 1.5: " + System.currentTimeMillis());
//
//			// 이미지 url 가져오기
//			List<WebElement> placeImgElements = driver.findElements(By.cssSelector(".topImages_item__w0NTS img")); // img
//																													// 가져오기
//
//			System.out.println("시간측정 2: " + System.currentTimeMillis());
//			// 매장 같은 클래스 이름을 가진 친구들이 총 3개 데이터 저장을 위한 반복문
//			for (int i = 3; i < 8; i++) {
//				try {
//					WebElement placeElement = placeImgElements.get(i); // i번째 매장 요소
//
//					if (i == 3) {
//						imgUrl1 = placeElement.getAttribute("src");
//					}
//					if (i == 4) {
//						imgUrl2 = placeElement.getAttribute("src");
//					}
//					if (i == 5) {
//						imgUrl3 = placeElement.getAttribute("src");
//					}
//					if (i == 6) {
//						imgUrl4 = placeElement.getAttribute("src");
//					}
//					if (i == 7) {
//						imgUrl5 = placeElement.getAttribute("src");
//					}
//					// Thread.sleep(3000); // 대기시간 (필요시 조정)
//
//				} catch (Exception e) {
//
//					if (i == 3) {
//						imgUrl1 = null;
//					}
//					if (i == 4) {
//						imgUrl2 = null;
//					}
//					if (i == 5) {
//						imgUrl3 = null;
//					}
//					if (i == 6) {
//						imgUrl4 = null;
//					}
//					if (i == 7) {
//						imgUrl5 = null;
//					}
//				}
//			}
//
//			// WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
//			// wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.className("home_text__kQcsn")));
//			// 매장 요소들 찾기
////			List<WebElement> placeElements = driver.findElements(By.className("home_text__kQcsn")); // 같은 클래스 이름 친구들 리스트
//
//			grade = driver.findElement(By.cssSelector(".home_rating_box__lbwuR .home_text__kQcsn")).getText();
//
//			// phoneNum = driver.findElement(By)
//
//			System.out.println("시간측정 3: " + System.currentTimeMillis());
//
//			// 매장 같은 클래스 이름을 가진 친구들이 총 3개 데이터 저장을 위한 반복문
////			for (int i = 0; i < 3; i++) {
////				try {
////					WebElement placeElement = placeElements.get(i); // i번째 매장 요소
////					if (i == 0) {
////						address = placeElement.getText();
////					}
////					if (i == 1) {
////						phoneNum = placeElement.getText();
////					}
////					if (i == 2) {
////						grade = placeElement.getText();
////						System.out.println(grade);
////					}
////					//Thread.sleep(3000); // 대기시간 (필요시 조정)
////	
////				} catch (Exception e) {
////					if (i == 0) {
////						address = null;
////					}
////					if (i == 1) {
////						phoneNum = null;
////					}
////	
////					if (i == 2) {
////						grade = null;
////					}
////				}
////			}
//			// 리뷰 갯수 가져오기
//			url = String.format("https://travel.naver.com/overseas/%s/poi/review/ta", placeInfo.getNaverSpotCord());
//			driver.get(url);
//
//			System.out.println("시간측정 4: " + System.currentTimeMillis());
//
//			String reviewCount = null;
//			try {
//				WebElement reviewCountElement = driver.findElement(By.className("review_participant__lhOeG"));
//				reviewCount = reviewCountElement.getText();
//			} catch (Exception ex) {
//				reviewCount = null;
//			}
//
//			String placeInsertSql = "INSERT INTO recommendSpot (regDate, updateDate, groceryName, address,operatingTime,phoneNumber,facilities,grade,imageUrl1,imageUrl2,imageUrl3,imageUrl4,imageUrl5,reviewCount, naverSpotCord, tabId, regionId,price) VALUES (NOW(), NOW(), ?, ?, ? ,?, ?, ?,?,?,?,?,?,?,?,?,?,?)";
//			// 크롤링이 끝난 후에는 WebDriver를 종료
//			// driver.quit();
//			PlaceInfoDto place = new PlaceInfoDto(name, address, phoneNum, facilities, operatingTime, grade, imgUrl1,
//					imgUrl2, imgUrl3, imgUrl4, imgUrl5, reviewCount, price);
//
//			PreparedStatement pstmt = conn.prepareStatement(placeInsertSql, PreparedStatement.RETURN_GENERATED_KEYS);
//			pstmt.setString(1, place.getName());
//			pstmt.setString(2, place.getAddress());
//			pstmt.setString(3, place.getOperatingTime());
//			pstmt.setString(4, place.getPhoneNum());
//			pstmt.setString(5, place.getFacilities());
//			pstmt.setString(6, place.getGrade());
//			pstmt.setString(7, place.getImgUrl1());
//			pstmt.setString(8, place.getImgUrl2());
//			pstmt.setString(9, place.getImgUrl3());
//			pstmt.setString(10, place.getImgUrl4());
//			pstmt.setString(11, place.getImgUrl5());
//			pstmt.setString(12, place.getReviewCount());
//			pstmt.setString(13, placeInfo.getNaverSpotCord());
//			pstmt.setInt(14, placeInfo.getTabId());
//			pstmt.setInt(15, placeInfo.getRegionId());
//			pstmt.setString(16, placeInfo.getPrice());
//
//			pstmt.executeUpdate();
//			ResultSet rs = pstmt.getGeneratedKeys();
//			rs.next();
//
//			pstmt.close();
//		}
//
//		conn.commit();
//		conn.close();
//		driver.close();
//
//	}
//
//	public static void main(String[] args)
//			throws InterruptedException, AWTException, SQLException, ClassNotFoundException {
//		// crawlPlaces();
//	}
//}
