package com.example.demo.crawling;

import java.awt.AWTException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Duration;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class PlaceInfoCrawlerForAllInit {
    private static WebDriver driver;
    private static String url;

    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

    // WebDriver 설정 메서드
    public static void setWebDriver(WebDriver driver) {
        PlaceInfoCrawlerForAllInit.driver = driver;
    }

    // 장소 정보를 크롤링하여 데이터베이스에 저장하는 메서드
    public void crawlPlaceInfo(List<PlaceInfoDto> placeInfoList)
            throws InterruptedException, AWTException, SQLException, ClassNotFoundException {
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

        ChromeOptions options = new ChromeOptions();
        options.setCapability("ignoreProtectedModeSettings", true);
        driver = new ChromeDriver(options);

        driver.manage().window().maximize();

        // 데이터베이스 연결 설정
        url = "jdbc:mysql://127.0.0.1:3306/Trip_Angle_24_04?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeBehavior=convertToNull";
        Connection conn = DriverManager.getConnection(url, "root", "");
        conn.setAutoCommit(false);
        conn.prepareStatement(url);
        System.out.println(url);

        for (PlaceInfoDto placeInfo : placeInfoList) {
            url = String.format("https://travel.naver.com/overseas/%s/poi/summary", placeInfo.getNaverSpotCord());
            driver.get(url);

            // 암묵적 대기 설정
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));

            // 장소 이름 크롤링
            String name;
            try {
                WebElement nameElement = driver.findElement(By.className("commonGeoInfo_title__8p2UW"));
                name = nameElement.getText();
            } catch (Exception ex) {
                name = null;
            }

            // 이미지 URL 크롤링
            String imgUrl1 = null;
            String imgUrl2 = null;
            String imgUrl3 = null;
            String imgUrl4 = null;
            String imgUrl5 = null;

            List<WebElement> placeImgElements = driver.findElements(By.tagName("img"));
            for (int i = 3; i < 8; i++) {
                try {
                    WebElement placeElement = placeImgElements.get(i);
                    switch (i) {
                        case 3:
                            imgUrl1 = placeElement.getAttribute("src");
                            break;
                        case 4:
                            imgUrl2 = placeElement.getAttribute("src");
                            break;
                        case 5:
                            imgUrl3 = placeElement.getAttribute("src");
                            break;
                        case 6:
                            imgUrl4 = placeElement.getAttribute("src");
                            break;
                        case 7:
                            imgUrl5 = placeElement.getAttribute("src");
                            break;
                    }
                } catch (Exception e) {
                    switch (i) {
                        case 3:
                            imgUrl1 = null;
                            break;
                        case 4:
                            imgUrl2 = null;
                            break;
                        case 5:
                            imgUrl3 = null;
                            break;
                        case 6:
                            imgUrl4 = null;
                            break;
                        case 7:
                            imgUrl5 = null;
                            break;
                    }
                }
            }

            // 주소, 가격, 시설, 전화번호, 평점 크롤링
            String address = "";
            String price = "";
            String facilities = "";
            String phoneNum = "";
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
                        if (placeNameElements.get(j).getText().equals("주소")) {
                            address = placeElements.get(j).findElement(By.xpath("./*[1]")).getText();
                        } else if (placeNameElements.get(j).getText().equals("가격")) {
                            WebElement priceElement = driver.findElement(By.className("home_menu__FtSCQ"));
                            price = priceElement.getText();
                        } else if (placeNameElements.get(j).getText().equals("전화")) {
                            phoneNum = placeElements.get(j).getText();
                        } else if (placeNameElements.get(j).getText().equals("시설")) {
                            facilities = placeElements.get(j).getText();
                        }
                    }

                } catch (Exception e) {
                    System.out.println("해당 정보가 없습니다");
                }
            }

            // 리뷰 갯수 크롤링
            url = String.format("https://travel.naver.com/overseas/%s/poi/review/ta", placeInfo.getNaverSpotCord());
            driver.get(url);

            String reviewCount = null;
            try {
                WebElement reviewCountElement = driver.findElement(By.className("review_participant__lhOeG"));
                reviewCount = reviewCountElement.getText();
            } catch (Exception ex) {
                reviewCount = null;
            }

            // 데이터베이스에 크롤링한 데이터 삽입
            String placeInsertSql = "INSERT INTO recommendSpot (regDate, updateDate, name, address, phoneNumber,facilities,grade,imageUrl1,imageUrl2,imageUrl3,imageUrl4,imageUrl5,reviewCount, naverSpotCord, tabId, regionId,price) VALUES (NOW(), NOW(), ?, ?, ? ,?, ?, ?,?,?,?,?,?,?,?,?,?)";
            PlaceInfoDto place = new PlaceInfoDto(name, address, phoneNum, facilities, grade, imgUrl1, imgUrl2, imgUrl3,
                    imgUrl4, imgUrl5, reviewCount, price);

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
            pstmt.setString(12, placeInfo.getNaverSpotCord());
            pstmt.setInt(13, placeInfo.getTabId());
            pstmt.setInt(14, placeInfo.getRegionId());
            pstmt.setString(15, place.getPrice());

            pstmt.executeUpdate();
            ResultSet rs = pstmt.getGeneratedKeys();
            rs.next();

            pstmt.close();
        }

        // 트랜잭션 커밋 및 연결 종료
        conn.commit();
        conn.close();
        driver.close();
    }

    // 메인 메서드 (테스트용)
    public static void main(String[] args)
            throws InterruptedException, AWTException, SQLException, ClassNotFoundException {
        // crawlPlaces();
    }
}