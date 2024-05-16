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

    // WebDriver 관련 설정
    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

    // WebDriver 설정
    public static void setWebDriver(WebDriver driver) {
        PlaceCrawler.driver = driver;
    }

    // 여행지 정보를 수집하는 메서드
    public List<PlaceInfoDto> crawlPlaces(List<RegionCrawlingDto> regionList, List<TabListDTO> tabList) throws InterruptedException {
        List<PlaceInfoDto> placeInfoList = new ArrayList<>();

        // WebDriver 설정
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
        ChromeOptions options = new ChromeOptions();
        options.setCapability("ignoreProtectedModeSettings", true);
        driver = new ChromeDriver(options);
        driver.manage().window().maximize();

        // 각 지역별로 관광지, 맛집, 쇼핑 정보 수집
        for (RegionCrawlingDto regionDto : regionList) {
            // 네이버 여행 페이지로 이동
            url = String.format("https://travel.naver.com/overseas/%s/city/topPoi/pall", regionDto.getNaverRegionCord());
            driver.get(url);
            // 페이지가 로드될 때까지 대기
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));

            // 관광, 맛집, 쇼핑 탭 선택
            List<WebElement> buttons = driver.findElements(By.className("tag_Tag__K3_0D"));
            for (TabListDTO tabListDto : tabList) {
                for (WebElement button : buttons) {
                    if (button.findElement(By.className("tag_text___rnsu")).getText().equals(tabListDto.getThemeName())) {
                        // 탭 클릭
                        button.click();
                        break;
                    }
                }

                // 매장 요소들 찾기
                List<WebElement> placeElements = driver.findElements(By.className("pc_button__YaxSv"));
                int count = 5; // 최대 다섯 개의 매장 정보만 수집
                for (int i = 0; i < count; i++) {
                    try {
                        WebElement placeElement = placeElements.get(i);
                        // 매장 요소 클릭
                        placeElement.click();
                        // 페이지가 로드될 때까지 대기
                        Thread.sleep(500);
                        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
                        WebElement markerInfoElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.className("MarkerInfo_anchor__jZpzS")));
                        // 매장 정보 추출
                        String naverSpotCord = markerInfoElement.getAttribute("href").substring(34, 46);
                        placeInfoList.add(new PlaceInfoDto(naverSpotCord, tabListDto.getId(), regionDto.getRegionId()));
                    } catch (StaleElementReferenceException e) {
                        // 요소가 스태일 상태라면 새로고침
                        placeElements = driver.findElements(By.className("pc_button__YaxSv"));
                        i--;
                    } catch (IndexOutOfBoundsException | NoSuchElementException e) {
                        // 예외 발생 시 처리
                    }
                }
            }
        }
        // WebDriver 종료
        driver.quit();
        return placeInfoList;
    }

    // 테스트용 main 메서드
    public static void main(String[] args) throws InterruptedException {
     
    }
}
