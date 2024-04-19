package com.example.demo.crawlling;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class CrawlingTest {

	    private WebDriver driver;
	    private String url;

	    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	    public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

	    public void crawling() {
	        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

	        ChromeOptions options = new ChromeOptions();
	        options.setCapability("ignoreProtectedModeSettings", true);
	        driver = new ChromeDriver(options);

	        url = "https://travel.naver.com/overseas/JPOSA298566/city/prepare";
	        driver.get(url);

	        try {
	            Thread.sleep(500);
	        } catch (InterruptedException e) {
	            e.printStackTrace();
	        }
	        
// 여행 기초정보 클래스
//	        WebElement inputSearch = driver.findElement(By.className("list_PreparationList__B2eE_"));

// 여행정보 페이지 body 정보 모두 포함하는 클래스
	        WebElement inputSearch = driver.findElement(By.className("mainContainer_content__hzmeI"));
//	        WebElement element = driver.findElement(By.className("header"));
	        String text = inputSearch.getText();
	        System.out.println(text);
	    }

	    public static void main(String[] args) {
	    	CrawlingTest crawler = new CrawlingTest();
	        crawler.crawling();
	    }
}