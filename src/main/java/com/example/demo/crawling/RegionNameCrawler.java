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


record Region(String countryName, String naverRegionCord, String regionName){
	
}

public class RegionNameCrawler {

    private WebDriver driver;
    private String url;

    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

    public void crawling() throws AWTException, SQLException, ClassNotFoundException {
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

        ChromeOptions options = new ChromeOptions();
        options.setCapability("ignoreProtectedModeSettings", true);
        driver = new ChromeDriver(options);

        //로딩이 될 동안 기다림. 최대 10초
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
        //화면 최대로
        driver.manage().window().maximize();
        
        url = "https://travel.naver.com/domestic";
        driver.get(url);
        
        // after선택자 선택하기 위한 로직
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(".header_search__4UCHI")));
        WebElement element = driver.findElement(By.cssSelector(".header_search__4UCHI"));
        int x = element.getLocation().getX();
        int y = element.getLocation().getY();
        
        Robot robot = new Robot();
        robot.mouseMove(x+216, y+191);
        robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
        
        

        
        
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div.searchbox_home_where__tayah>a:nth-child(2)")));
        WebElement overseasButton = driver.findElement(By.cssSelector("div.searchbox_home_where__tayah>a:nth-child(2)"));
        overseasButton.click();
        

        wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.cssSelector(".searchbox_home_tabs__FA2_B")));
        List<WebElement> continents  = driver.findElements(By.cssSelector(".searchbox_home_tabs__FA2_B>a"));
        List<Region> regionList = new ArrayList<>();
        
        for(WebElement continent : continents) {
        	continent.click();
        	//wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.cssSelector("div.searchbox_home_panel__Kn11B > div.searchbox_home_PanelItem__fH6Nu > a")));
        	try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
        	List<WebElement> countryButtons  = driver.findElements(By.cssSelector("div.searchbox_home_panel__Kn11B > div.searchbox_home_PanelItem__fH6Nu > a"));
        	for(WebElement countryButton: countryButtons) {
        		String countryName = countryButton.getText().trim();
        		countryButton.click();
	        	try {
					Thread.sleep(200);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        	
	        	
        		
        		List<WebElement> regionButtons = driver.findElements(By.cssSelector("div.searchbox_home_regions__N8aCL > a"));
        		
        		for(WebElement regionButton: regionButtons) {
        			String naverRegionCord = regionButton.getAttribute("data-id");
        			String regionName = regionButton.findElement(By.tagName("b")).getText().trim();
        			String type = regionButton.findElement(By.tagName("i")).getText().trim();
        			
        			if(type.equals("도시")) {
        				regionList.add(new Region(countryName, naverRegionCord, regionName));
        			}
        			
        			
        		}
        	}
        	
        	
        }
        driver.close();
        
        
        String url = "jdbc:mysql://127.0.0.1:3306/Trip_Angle_24_04?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeBehavior=convertToNull";
        Connection conn = DriverManager.getConnection(url, "root", "");
        conn.setAutoCommit(false);
        conn.prepareStatement(url);
        
        
        
        String countryInsertSql = "INSERT INTO country (regDate, updateDate, `name`) VALUES (NOW(), NOW(), ?)";
        String regionInsertSql = "INSERT INTO region (regDate, updateDate, `name`, naverRegionCord, countryId) VALUES (NOW(), NOW(), ?, ?, ?)";
        String currentCountryName= "";
        int currentCountryId = -1;
        for(Region region: regionList) {
        	if(!region.countryName().equals(currentCountryName)) {
        		PreparedStatement pstmt = conn.prepareStatement(countryInsertSql, PreparedStatement.RETURN_GENERATED_KEYS);
        		pstmt.setString(1, region.countryName());
        		pstmt.executeUpdate();
        		
        		ResultSet rs = pstmt.getGeneratedKeys();
        		rs.next();
        		currentCountryId = rs.getInt(1); 
        		currentCountryName = region.countryName();
        		pstmt.close();
        	}
        	
        	PreparedStatement pstmt = conn.prepareStatement(regionInsertSql);
        	pstmt.setString(1, region.regionName());
        	pstmt.setString(2, region.naverRegionCord());
        	pstmt.setInt(3, currentCountryId);
        	pstmt.executeUpdate();
        	pstmt.close();
        	
        }
        
        conn.commit();
        conn.close();
        
    }
    

//    }

    public static void main(String[] args) {
    	RegionNameCrawler crawler = new RegionNameCrawler();
    	try {
    	  crawler.crawling();
    	}catch(ClassNotFoundException e) {
    		System.out.println("드라이버 로딩에 실패했습니다.");
    		e.printStackTrace();
    	}catch(AWTException e) {
    		System.out.println("크롤링 가동에 실패했습니다.");
    		e.printStackTrace();
    	}catch(SQLException e) {
    		System.out.println("db처리에 실패했습니다.");
    		e.printStackTrace();
    	}
    }
}