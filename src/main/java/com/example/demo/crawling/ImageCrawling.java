package com.example.demo.crawling;

import java.awt.AWTException;
import java.time.Duration;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;




public class ImageCrawling {

    private WebDriver driver;
    private String url;

    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

    public void crawling() throws AWTException, ClassNotFoundException {
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

        ChromeOptions options = new ChromeOptions();
        options.setCapability("ignoreProtectedModeSettings", true);
        driver = new ChromeDriver(options);

        //로딩이 될 동안 기다림. 최대 10초
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
        //화면 최대로
        driver.manage().window().maximize();
        
        url = "https://travel.naver.com/overseas/GRCHI189400/city/summary";
        driver.get(url);
        
        // after선택자 선택하기 위한 로직
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(".topImages_thumb__fhc1R")));
        WebElement element = driver.findElement(By.cssSelector(".topImages_thumb__fhc1R"));
        System.out.println(element.getTagName());
        WebElement image = element.findElement(By.tagName("img"));
        String src = image.getAttribute("src");
        System.out.println(src);
        
        
        driver.close();
        
    }
    

//    }

    public static void main(String[] args) {
    	ImageCrawling crawler = new ImageCrawling();
    	try {
			crawler.crawling();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (AWTException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}