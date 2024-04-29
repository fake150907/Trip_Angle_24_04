package com.example.demo.crawling;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class PlaceCrawler {

    private static WebDriver driver;
    private static String url;

    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

    public static void setWebDriver(WebDriver driver) {
        PlaceCrawler.driver = driver;
    }

    public static void crawlPlaces() throws InterruptedException {
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

        ChromeOptions options = new ChromeOptions();
        options.setCapability("ignoreProtectedModeSettings", true);
        driver = new ChromeDriver(options);

        driver.manage().window().maximize();

        url = "https://travel.naver.com/overseas/GRATN189433/city/topPoi/pall";
        driver.get(url);

        Thread.sleep(3000);

        // 관광, 맛집, 쇼핑 탭 선택하기
        List<WebElement> buttons = driver.findElements(By.className("tag_Tag__K3_0D"));
        for (WebElement button : buttons) {
            if (button.findElement(By.className("tag_text___rnsu")).getText().equals("맛집")) {
                button.click();
                break;
            }
        }

        // 매장 요소들 찾기
        List<WebElement> placeElements = driver.findElements(By.className("pc_button__YaxSv")); // 매장 리스트

        int count = Math.min(placeElements.size(), 5); // 매장 개수가 5개 이하일 경우를 고려하여 최대 다섯 개까지만 처리
        for (int i = 0; i < count; i++) {
            try {
                WebElement placeElement = placeElements.get(i); // i번째 매장 요소
                placeElement.click(); // 매장 요소 클릭
                Thread.sleep(3000); // 대기시간 (필요시 조정)
                WebElement markerInfoElement = driver.findElement(By.className("MarkerInfo_anchor__jZpzS")); // "명소정보상세보기" 버튼
                markerInfoElement.click(); // 명소정보상세보기 버튼 클릭하여 원하는 작업 수행
            } catch (StaleElementReferenceException e) {
                // 요소가 stale 상태라면 새로 찾기
                placeElements = driver.findElements(By.className("pc_button__YaxSv"));
                i--; // 다음 요소를 다시 확인하기 위해 인덱스를 하나 줄임
            }
        }


        // 크롤링이 끝난 후에는 WebDriver를 종료
        //driver.quit();
    }

    public static void main(String[] args) throws InterruptedException {
        crawlPlaces();
    }
}