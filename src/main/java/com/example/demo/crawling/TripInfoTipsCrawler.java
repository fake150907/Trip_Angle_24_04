package com.example.demo.crawling;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

// 여행지 정보를 각 컬럼으로 저장될 변수들로 각각 나누고 레코드의 매개변수로 지정
record RegionInfoTips(String information, String voltage, String language, String climate, String timeDifference,
                      String rate, String tips, int regionId) {
}

// 여행지 정보를 크롤링하는 클래스
public class TripInfoTipsCrawler {

    private WebDriver driver; // WebDriver 인터페이스를 구현한 객체를 가리키는 변수
    private String url; // 크롤링할 URL을 저장하는 변수

    // 크롤링 구동을 위한 크롬 드라이버 경로 설정
    public static String WEB_DRIVER_ID = "webdriver.chrome.driver"; // WebDriver의 Chrome 드라이버 식별자
    public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe"; // Chrome 드라이버의 경로

    // 네이버 여행정보 페이지의 데이터를 크롤링 후 DB로 전송하는 메서드
    public void crawling(List<RegionCrawlingDto> regionCrawlingDtos) throws SQLException, ClassNotFoundException {
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH); // Chrome 드라이버 경로 설정

        ChromeOptions options = new ChromeOptions(); // Chrome 옵션 객체 생성
        options.setCapability("ignoreProtectedModeSettings", true); // 보호된 모드 설정 무시
        driver = new ChromeDriver(options); // Chrome 드라이버 생성

        List<RegionInfoTips> regionInfoTipsList = new ArrayList<>(); // 크롤링한 데이터를 저장할 리스트

        // 도시별로 크롤링 실행
        for (RegionCrawlingDto regionCrawlingDto : regionCrawlingDtos) {

            // 도시의 여행정보 준비 페이지 URL 설정
            url = String.format("https://travel.naver.com/overseas/%s/city/prepare",
                    regionCrawlingDto.getNaverRegionCord());
            driver.get(url); // 해당 URL 열기

            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10)); // 암묵적 대기 시간 설정

            // 여행정보 리스트 상단 제목 요소들
            List<WebElement> informNames = driver.findElements(By.className("item_name__rmJh2"));

            // 여행정보 리스트 하단 텍스트 요소들
            List<WebElement> informValues = driver.findElements(By.className("item_value__JKA9S"));

            int size = Math.min(informNames.size(), informValues.size()); // 두 리스트의 크기 중 작은 값으로 설정
            String information = "";
            String voltage = "";
            String language = "";
            String climate = "";
            String timeDifference = "";
            String rate = "";
            String tips = "";
            int regionId = regionCrawlingDto.getRegionId(); // 도시의 ID 설정

            // 각 항목마다 데이터 추출
            for (int i = 0; i < size; i++) {
                String informName = informNames.get(i).getText(); // 항목 이름
                String informValue = informValues.get(i).getText(); // 항목 값

                switch (informName) { // 항목 이름에 따라 데이터 분류
                    case "전압":
                        voltage = informValue;
                        break;
                    case "언어":
                        language = informValue;
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

            // 도시 요약 정보 페이지 URL 설정
            url = String.format("https://travel.naver.com/overseas/%s/city/summary",
                    regionCrawlingDto.getNaverRegionCord());
            driver.get(url); // 해당 URL 열기

            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
            wait.until(ExpectedConditions.presenceOfElementLocated((By.className("commonGeoInfo_desc__wekZv"))));

            WebElement regioninformation = driver.findElement(By.className("commonGeoInfo_desc__wekZv"));

            information = regioninformation.getText(); // 도시 정보 텍스트 추출

            // 도시 기후정보 텍스트
            try {
                WebElement informclimate = driver.findElement(By.cssSelector("p.home_phrases__DZ1QE"));
                climate = informclimate.getText();
            } catch (NoSuchElementException e) {
                // 기후 정보가 없는 경우 처리
            }

            // 추출한 데이터로 RegionInfoTips 객체 생성 후 리스트에 추가
            regionInfoTipsList.add(
                    new RegionInfoTips(information, voltage, language, climate, timeDifference, rate, tips, regionId));

        }

        driver.close(); // WebDriver 종료

        // DB 연결 설정
        String url = "jdbc:mysql://127.0.0.1:3306/Trip_Angle_24_04?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeBehavior=convertToNull";
        Connection conn = DriverManager.getConnection(url, "root", ""); // DB 연결
        String insertQuery = "INSERT INTO regionInfoTips (information, Voltage, language, climate, timeDifference, rate, tips, regionId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(insertQuery); // 쿼리 실행을 위한 PreparedStatement 생성

        // 리스트의 데이터를 DB에 저장
        for (RegionInfoTips info : regionInfoTipsList) {
            pstmt.setString(1, info.information());
            pstmt.setString(2, info.voltage());
            pstmt.setString(3, info.language());
            pstmt.setString(4, info.climate());
            pstmt.setString(5, info.timeDifference());
            pstmt.setString(6, info.rate());
            pstmt.setString(7, info.tips());
            pstmt.setInt(8, info.regionId());
            pstmt.executeUpdate(); // 쿼리 실행
        }

        System.out.println("DB 전송 완료"); // 작업 완료 메시지 출력
        conn.close(); // DB 연결 종료
    }

    // 크롤링 작업을 단독으로 실행 할 경우 메인 메서드로 고정된 도시 ID로 실행 (필수 작업 X)
    public static void main(String[] args) {
        List<RegionCrawlingDto> regionCrawlingDtos = new ArrayList<>(); // 도시 크롤링 DTO 리스트 생성
        RegionCrawlingDto regionCrawlingDto = new RegionCrawlingDto("국가명", "GRJMK189430", "도시명"); // 도시 크롤링 DTO 객체 생성
        regionCrawlingDto.setRegionId(0); // 도시 ID 설정
        regionCrawlingDtos.add(regionCrawlingDto); // 리스트에 추가

        TripInfoTipsCrawler crawler = new TripInfoTipsCrawler(); // 크롤러 객체 생성
        try {
            crawler.crawling(regionCrawlingDtos); // 크롤링 실행
        } catch (ClassNotFoundException e) {
            System.out.println("드라이버 로딩에 실패했습니다."); // 드라이버 로딩 실패 시 예외 처리
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("데이터베이스 처리 중 오류가 발생했습니다."); // 데이터베이스 처리 오류 시 예외 처리
            e.printStackTrace();
        }
    }
}
