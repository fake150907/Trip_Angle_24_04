package com.example.demo.crawling;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.time.Duration;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class RegionNameCrawler {

    private WebDriver driver;
    private String url;

    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

    public void crawling(String location) throws AWTException {
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
        
        // Find the WebElement
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(".header_search__4UCHI")));
        WebElement element = driver.findElement(By.cssSelector(".header_search__4UCHI"));

        // Get the location and size of the WebElement
        int x = element.getLocation().getX();
        int y = element.getLocation().getY();
        
        
        Robot robot = new Robot();
        robot.mouseMove(x+216, y+191);
        //robot.mouseMove(1470, 220);
        robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
        
        
        
//        System.out.println("여긴 옴.");
//        // 네이버 지도 검색창에 원하는 검색어 입력 후 엔터
//        WebElement searchButton = driver.findElement(By.cssSelector(".header_search__4UCHI"));
//        System.out.println("여긴도 옴.");
//        Actions actions = new Actions(driver);
//        actions.moveToElement(searchButton, 25, 15).click().perform();
//        searchButton.click();
//        
//        System.out.println("안되나.");
//
        
        
        
	        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
	        wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div.searchbox_home_where__tayah>a:nth-child(2)")));
	        System.out.println("여기도 왔어.");
	        WebElement overseasButton = driver.findElement(By.cssSelector("div.searchbox_home_where__tayah>a:nth-child(2)"));
	        overseasButton.click();
	        
	        wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.cssSelector(".searchbox_home_tabs__FA2_B>a")));
	        List<WebElement> continents  = driver.findElements(By.cssSelector(".searchbox_home_tabs__FA2_B>a"));
	        System.out.println(continents.size());
//	        
//	        continents.stream().forEach(continent -> {
//	        continent.click();
//	        });
	        
	        for(WebElement continent : continents) {
	        	try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
	        	continent.click();
//	        	List<WebElement> countries  = driver.findElements(By.cssSelector("div.searchbox_home_panel__Kn11B > div"));
//	        	for(WebElement country: countries) {
//	        		System.out.println(country.getText());
//	        	}
	        	
	        }
	        
	        
        }
    
//        
//        
//        
//        
//        String inputKey = " 서구 카페";
//        inputSearch.sendKeys(location + inputKey);
//        inputSearch.sendKeys(Keys.ENTER);
//
//        try {
//            Thread.sleep(3000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        
//        // 데이터가 iframe 안에 있는 경우(HTML 안 HTML) 이동
//        driver.switchTo().frame("searchIframe");
//
//        // 원하는 요소를 찾기(스크롤할 창)
//        WebElement scrollBox = driver.findElement(By.id("_pcmap_list_scroll_container"));
//
//        Actions builder = new Actions(driver);
//
//        for (int i = 0; i < 6; i++) {
//            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", scrollBox);
//            try {
//                Thread.sleep(2000);
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
//        }
//        
//        // 사이트에서 전체 매장을 찾은 뒤 코드를 읽는다
//        List<WebElement> elements = driver.findElements(By.className("TYaxT"));
//
//        for (WebElement e : elements) {
//            e.click();
//            String key = e.getText();
//
//            try {
//                Thread.sleep(2000);
//            } catch (InterruptedException ex) {
//                ex.printStackTrace();
//            }
//
//            driver.switchTo().parentFrame();
//            driver.switchTo().frame(driver.findElement(By.id("entryIframe")));
//            
//            // 주소 
//            String address = driver.findElement(By.className("LDgIH")).getText();
//            
//            // 전화번호 있는 경우
//            String phoneNumber;
//            try {
//                phoneNumber = driver.findElement(By.className("xlx7Q")).getText();
//            } catch (Exception ex) {
//                phoneNumber = null;
//            }
//            
//            // 영업시간 1개 있는 경우
////            String businessHours;
////            try {
////                WebElement button = driver.findElement(By.className("RMgN0"));
////                button.click();
////                WebElement dayElement = driver.findElement(By.xpath("//span[@class='i8cJw']"));
////                String day = dayElement.getText();
////                WebElement timeElement = driver.findElement(By.xpath("//div[@class='w9QyJ']//div[@class='H3ua4']"));
////                String openingHours = timeElement.getText();
////                businessHours = day + " " + openingHours;
////            } catch (Exception ex) {
////                businessHours = null;
////            }
//            
//            // 영업시간이 여러개인 경우
//            String businessHours;
//            try {
//                WebElement button = driver.findElement(By.className("RMgN0"));
//                button.click();
//                List<WebElement> dayElements = driver.findElements(By.xpath("//span[@class='i8cJw']"));
//                List<WebElement> timeElements = driver.findElements(By.xpath("//div[@class='H3ua4']"));
//                StringBuilder businessHoursBuilder = new StringBuilder();
//                for (int j = 0; j < dayElements.size(); j++) {
//                    String day = dayElements.get(j).getText();
//                    String time = timeElements.get(j).getText();
//                    String temp = day + " " + time + "; ";
//                    businessHoursBuilder.append(temp);
//                }
//                businessHours = businessHoursBuilder.toString();
//            } catch (Exception ex) {
//                businessHours = null;
//            }
//           
//            // 메뉴정보를 저장할 문자열
//            // 메뉴와 가격은 ':', 메뉴 간은 ';'로 구분
//            String menuInfo;
//            try {
//                List<WebElement> menuEles = driver.findElements(By.className("VQvNX"));
//                List<WebElement> priceEles = driver.findElements(By.className("gl2cc"));
//                StringBuilder menuInfoBuilder = new StringBuilder();
//                for (int i = 0; i < menuEles.size(); i++) {
//                    String temp = menuEles.get(i).getText() + ":" + priceEles.get(i).getText() + ";";
//                    menuInfoBuilder.append(temp); 
//                }
//                menuInfo = menuInfoBuilder.toString();
//            } catch (Exception ex) {
//                menuInfo = null;
//            }
//            
//            String facilities;
//            try {
//                WebElement facilitiesElement = driver.findElement(By.className("xPvPE"));
//                facilities = facilitiesElement.getText();
//            } catch (Exception ex) {
//                facilities = null;
//            }
//
//            // Output data
//            System.out.println("Name: " + key);
//            System.out.println("Address: " + address);
//            System.out.println("Phone Number: " + phoneNumber);
//            System.out.println("Business Hours: " + businessHours);
//            System.out.println("Menu Info: " + menuInfo);
//            System.out.println("Facilities: " + facilities);
//
//            driver.switchTo().parentFrame();
//            driver.switchTo().frame("searchIframe");
//        }

//        driver.quit();
//    }

    public static void main(String[] args) {
    	RegionNameCrawler crawler = new RegionNameCrawler();
    	try {
    	crawler.crawling(WEB_DRIVER_ID);
    	}catch(AWTException e) {
    		System.out.println("왜 안되냐고 시바아아아알");
    	}
    }
}