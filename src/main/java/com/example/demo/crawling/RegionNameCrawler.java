package com.example.demo.crawling;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class RegionNameCrawler {

    private WebDriver driver; // Selenium WebDriver 객체
    private String url; // 크롤링할 URL 주소
    
    // Chrome WebDriver 설정
    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";
    
    // 탭 리스트 가져오기 메서드
    public List<TabListDTO> getTabList() throws SQLException, ClassNotFoundException {
        List<TabListDTO> tabList = new ArrayList<>(); // 탭 리스트를 담을 리스트
        url = "jdbc:mysql://127.0.0.1:3306/Trip_Angle_24_04?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeBehavior=convertToNull"; // 데이터베이스 접속 URL
        Connection conn = DriverManager.getConnection(url, "root", ""); // 데이터베이스 연결
        conn.setAutoCommit(false); // 자동 커밋 설정 해제
        
        // 탭 리스트를 가져오기 위한 SQL 쿼리
        String getTabListSql = "SELECT * FROM TABLIST";
        PreparedStatement pstmt = conn.prepareStatement(getTabListSql);
        ResultSet rs = pstmt.executeQuery();
        
        // ResultSet에서 데이터 읽어오기
        while(rs.next()) {
            int id = rs.getInt(1);
            String regDate = rs.getString(2);
            String updateDate = rs.getString(3);
            String themeName = rs.getString(4);
            tabList.add(new TabListDTO(id, regDate, updateDate, themeName)); // 읽어온 데이터를 TabListDTO 객체로 만들어 리스트에 추가
        }
        
        // ResultSet, PreparedStatement, Connection 닫기
        rs.close();
        pstmt.close();
        conn.close();
        
        return tabList; // 탭 리스트 반환
    }

    // 크롤링 메서드
    public List<RegionCrawlingDto> crawling(Integer crawlingLimit) throws AWTException, SQLException, ClassNotFoundException {
        boolean breakFlag = false; // 반복문 종료를 위한 플래그
        
        // Chrome WebDriver 설정
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
        ChromeOptions options = new ChromeOptions();
        options.setCapability("ignoreProtectedModeSettings", true);
        driver = new ChromeDriver(options);
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10)); // 최대 10초 대기
        driver.manage().window().maximize(); // 창 최대화
        
        url = "https://travel.naver.com/domestic"; // 크롤링할 페이지 URL
        driver.get(url); // 페이지 로드
        
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // WebDriver 대기 설정
        wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(".header_search__4UCHI"))); // 요소가 나타날 때까지 대기
        WebElement element = driver.findElement(By.cssSelector(".header_search__4UCHI")); // 요소 선택
        int x = element.getLocation().getX(); // x 좌표
        int y = element.getLocation().getY(); // y 좌표

        Robot robot = new Robot(); // Robot 객체 생성
        robot.mouseMove(x + 216, y + 191); // 마우스 이동
        robot.mousePress(InputEvent.BUTTON1_DOWN_MASK); // 마우스 클릭
        robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK); // 마우스 클릭 해제

        wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // WebDriver 대기 설정
        wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div.searchbox_home_where__tayah>a:nth-child(2)"))); // 요소가 나타날 때까지 대기
        WebElement overseasButton = driver.findElement(By.cssSelector("div.searchbox_home_where__tayah>a:nth-child(2)")); // 요소 선택
        overseasButton.click(); // 클릭

        wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.cssSelector(".searchbox_home_tabs__FA2_B"))); // 요소가 나타날 때까지 대기
        List<WebElement> continents = driver.findElements(By.cssSelector(".searchbox_home_tabs__FA2_B>a")); // 요소들 선택
        List<RegionCrawlingDto> regionList = new ArrayList<>(); // 크롤링 결과를 담을 리스트

        // 대륙별로 반복
        for (WebElement continent : continents) {
            continent.click(); // 대륙 클릭
            try {
                Thread.sleep(500); // 0.5초 대기
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            List<WebElement> countryButtons = driver.findElements(By.cssSelector("div.searchbox_home_panel__Kn11B > div.searchbox_home_PanelItem__fH6Nu > a")); // 요소 선택
            // 국가별로 반복
            for (WebElement countryButton : countryButtons) {
                String countryName = countryButton.getText().trim(); // 국가 이름
                if (countryName.equals("쿠바")) {
                    continue;
                }
                countryButton.click(); // 국가 클릭
                try {
                    Thread.sleep(500); // 0.5초 대기
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

                List<WebElement> regionButtons = driver.findElements(By.cssSelector("div.searchbox_home_regions__N8aCL > a")); // 요소 선택
                // 지역별로 반복
                for (WebElement regionButton : regionButtons) {
                    String naverRegionCord = regionButton.getAttribute("data-id"); // 네이버 지역 코드
                    String regionName = regionButton.findElement(By.tagName("b")).getText().trim(); // 지역 이름
                    String type = regionButton.findElement(By.tagName("i")).getText().trim(); // 타입

                    if (type.equals("도시")) {
                        regionList.add(new RegionCrawlingDto(countryName, naverRegionCord, regionName)); // 지역 정보를 RegionCrawlingDto 객체로 만들어 리스트에 추가
                        if (crawlingLimit != null && regionList.size() >= crawlingLimit) {
                            breakFlag = true;
                            break;
                        }

                    }
                    if (breakFlag)
                        break;
                }

                if (breakFlag)
                    break;
            }

            if (breakFlag)
                break;
        }

        // 각 지역에 대한 이미지와 영문명 가져오기
        for (RegionCrawlingDto region : regionList) {
            String url = String.format("https://travel.naver.com/overseas/%s/city/summary", region.getNaverRegionCord()); // 각 지역의 URL
            driver.get(url); // 페이지 로드

            wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // WebDriver 대기 설정
            wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(".topImages_thumb__fhc1R"))); // 요소가 나타날 때까지 대기
            WebElement thumb = driver.findElement(By.cssSelector(".topImages_thumb__fhc1R")); // 요소 선택
            WebElement image = thumb.findElement(By.tagName("img")); // 이미지 요소 선택
            String src = image.getAttribute("src"); // 이미지 URL
            region.setImageUrl(src); // 이미지 URL 설정

            String englishName = driver.findElement(By.cssSelector(".commonGeoInfo_foreign__EtgPn .english")).getText().trim(); // 영문명
            region.setEnglishName(englishName); // 영문명 설정
        }

        driver.close(); // WebDriver 종료

        // 데이터베이스 연결
        url = "jdbc:mysql://127.0.0.1:3306/Trip_Angle_24_04?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeBehavior=convertToNull";
        Connection conn = DriverManager.getConnection(url, "root", "");
        conn.setAutoCommit(false); // 자동 커밋 설정 해제
        conn.prepareStatement(url);

        String countryInsertSql = "INSERT INTO country (regDate, updateDate, `name`) VALUES (NOW(), NOW(), ?)"; // 국가 삽입 SQL
        String regionInsertSql = "INSERT INTO region (regDate, updateDate, `name`, naverRegionCord, countryId, imageUrl, englishName) VALUES (NOW(), NOW(), ?, ?, ?, ?, ?)"; // 지역 삽입 SQL
        String currentCountryName = ""; // 현재 국가 이름
        int currentCountryId = -1; // 현재 국가 ID
        // 지역별로 반복하며 데이터베이스에 삽입
        for (RegionCrawlingDto region : regionList) {
            if (!region.getCountryName().equals(currentCountryName)) {
                PreparedStatement pstmt = conn.prepareStatement(countryInsertSql, PreparedStatement.RETURN_GENERATED_KEYS); // PreparedStatement 생성
                pstmt.setString(1, region.getCountryName()); // 매개변수 설정
                pstmt.executeUpdate(); // 쿼리 실행

                ResultSet rs = pstmt.getGeneratedKeys(); // 생성된 키 가져오기
                rs.next();
                currentCountryId = rs.getInt(1); // 현재 국가 ID 설정
                currentCountryName = region.getCountryName(); // 현재 국가 이름 설정
                pstmt.close(); // PreparedStatement 닫기
            }

            PreparedStatement pstmt = conn.prepareStatement(regionInsertSql, PreparedStatement.RETURN_GENERATED_KEYS); // PreparedStatement 생성
            pstmt.setString(1, region.getRegionName()); // 매개변수 설정
            pstmt.setString(2, region.getNaverRegionCord()); // 매개변수 설정
            pstmt.setInt(3, currentCountryId); // 매개변수 설정
            pstmt.setString(4, region.getImageUrl()); // 매개변수 설정
            pstmt.setString(5, region.getEnglishName()); // 매개변수 설정
            pstmt.executeUpdate(); // 쿼리 실행
            ResultSet rs = pstmt.getGeneratedKeys(); // 생성된 키 가져오기
            rs.next();
            region.setRegionId(rs.getInt(1)); // 지역 ID 설정
            pstmt.close(); // PreparedStatement 닫기

        }

        conn.commit(); // 커밋
        conn.close(); // Connection 닫기

        return regionList; // 지역 정보 리스트 반환
    }

    // 메인 메서드
    public static void main(String[] args) {
        RegionNameCrawler crawler = new RegionNameCrawler();
        try {
            crawler.crawling(50); // 크롤링 실행
        } catch (ClassNotFoundException e) {
            System.out.println("드라이버 로딩에 실패했습니다.");
            e.printStackTrace();
        } catch (AWTException e) {
            System.out.println("크롤링 가동에 실패했습니다.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("db처리에 실패했습니다.");
            e.printStackTrace();
        }
    }
}


               
