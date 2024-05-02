package com.example.demo.crawling;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class PlaceCrawler {

    private static WebDriver driver;
    private static String url;

    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

    public static void setWebDriver(WebDriver driver) {
        PlaceCrawler.driver = driver;
    }

    public List<PlaceInfoDto> crawlPlaces(List<RegionCrawlingDto> regionList, List<TabListDTO> tabList) throws InterruptedException {
    	List<PlaceInfoDto> placeInfoList = new ArrayList<>();
    	
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

        ChromeOptions options = new ChromeOptions();
        options.setCapability("ignoreProtectedModeSettings", true);
        driver = new ChromeDriver(options);

        driver.manage().window().maximize();
        for(RegionCrawlingDto regionDto: regionList) {
	        url = String.format("https://travel.naver.com/overseas/%s/city/topPoi/pall", regionDto.getNaverRegionCord());
	        driver.get(url);
	
//	        Thread.sleep(3000);
	        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
	
	        // 관광, 맛집, 쇼핑 탭 선택하기
	        List<WebElement> buttons = driver.findElements(By.className("tag_Tag__K3_0D"));
	        for(TabListDTO tabListDto: tabList) {
		        for (WebElement button : buttons) {
		            if (button.findElement(By.className("tag_text___rnsu")).getText().equals(tabListDto.getThemeName())) {
		            	System.out.println(button.findElement(By.className("tag_text___rnsu")).getText());
		                button.click();
		                break;
		            }
		        }
		
		        // 매장 요소들 찾기
		        List<WebElement> placeElements = driver.findElements(By.className("pc_button__YaxSv")); // 매장 리스트
		
//		        int count = Math.min(placeElements.size(), 5); // 매장 개수가 5개 이하일 경우를 고려하여 최대 다섯 개까지만 처리
//		        System.out.println("카운트 : " + count + ",사이즈 :" + placeElements.size());
		        int count =5;
		        for (int i = 0; i < count; i++) {
		            try {
		                WebElement placeElement = placeElements.get(i); // i번째 매장 요소
		                placeElement.click(); // 매장 요소 클릭
		                //Thread.sleep(3000); // 대기시간 (필요시 조정)
		                WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		                WebElement markerInfoElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.className("MarkerInfo_anchor__jZpzS")));
//		                WebElement markerInfoElement = driver.findElement(By.className("MarkerInfo_anchor__jZpzS")); // "명소정보상세보기" 버튼
		                //markerInfoElement.click(); // 명소정보상세보기 버튼 클릭하여 원하는 작업 수행
		                String naverSpotCord = markerInfoElement.getAttribute("href");
		                naverSpotCord = naverSpotCord.substring(34,46);
		                
		                placeInfoList.add(new PlaceInfoDto(naverSpotCord, tabListDto.getId(), regionDto.getRegionId())); 
		                
		            } catch (StaleElementReferenceException e) {
		                // 요소가 stale 상태라면 새로 찾기
		                placeElements = driver.findElements(By.className("pc_button__YaxSv"));
		                i--; // 다음 요소를 다시 확인하기 위해 인덱스를 하나 줄임
		            } catch(IndexOutOfBoundsException e) {
		            	
		            } catch(NoSuchElementException e) {
		            	
		            }
		        }
        }
        }


        //크롤링이 끝난 후에는 WebDriver를 종료
        driver.quit();
        
        return placeInfoList;
    }

    public static void main(String[] args) throws InterruptedException {
//        crawlPlaces();
    }
}