package com.example.demo.crawling;

import java.awt.AWTException;
import java.sql.SQLException;
import java.util.List;

public class AllInitCrawler {
	public static void main(String[] args) {
    	CrawlingTest2 crawlingTest2 = new CrawlingTest2();
    	RegionNameCrawler regionCrawling = new RegionNameCrawler();
    	PlaceCrawler placeCrawling = new PlaceCrawler();
    	PlaceInfoCrawlerForAllInit placeInfoCrawling = new PlaceInfoCrawlerForAllInit();
    	
    	List<RegionCrawlingDto> regionList = null;
    	List<TabListDTO> tabList = null;
    	List<PlaceInfoDto> placeInfoList = null;
    	
    	try {
			regionList = regionCrawling.crawling(20);
			tabList = regionCrawling.getTabList();
			
			System.out.println("여행 국가 및 도시정보 입력");
		} catch (ClassNotFoundException e) {
			System.out.println("db드라이버 에러");
			e.printStackTrace();
		} catch (AWTException e) {
			System.out.println("인터페이스 관련 에러");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("db접속 에러");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	if(regionList != null) {
    		try {
				crawlingTest2.crawling(regionList);
				
				System.out.println("여행 도시 상세정보 입력 완료.");
			} catch (ClassNotFoundException e) {
				System.out.println("db드라이버 에러");
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("db접속 에러");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	
    	if(regionList != null && tabList != null) {
    		try {
				placeInfoList = placeCrawling.crawlPlaces(regionList, tabList);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	
    	System.out.println(placeInfoList);
    	
    	if(placeInfoList != null) {
	    	try {
	    		placeInfoCrawling.crawlPlaces(placeInfoList);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (AWTException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	
    	
    	
    }
}
