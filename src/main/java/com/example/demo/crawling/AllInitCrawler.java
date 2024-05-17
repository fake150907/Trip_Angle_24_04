package com.example.demo.crawling;

import java.awt.AWTException;
import java.sql.SQLException;
import java.util.List;

//크롤링 클래스들 통합 실행용 클래스
//main메서드 실행 후 네이버 여행 목록을 기반으로 다음과 같은 테이블 정보가 생성된다
//country(국가), region(도시), regionInfoTips(도시 정보),  recommendSpot(추천장소)
public class AllInitCrawler {
	public static void main(String[] args) {
		//도시 정보 크롤링 클래스
    	TripInfoTipsCrawler tripInfoTipsCrawler = new TripInfoTipsCrawler();
		//도시명 크롤링 클래스
    	RegionNameCrawler regionCrawling = new RegionNameCrawler();
		//추천 장소 목록 크롤링 클래스
    	PlaceCrawler placeCrawling = new PlaceCrawler();
		//추천 장소 상세 크롤링 클래스
    	PlaceInfoCrawlerForAllInit placeInfoCrawling = new PlaceInfoCrawlerForAllInit();
    	
    	List<RegionCrawlingDto> regionList = null;
    	List<TabListDTO> tabList = null;
    	List<PlaceInfoDto> placeInfoList = null;
    	
    	// 도시명, 국가명 가져오기
    	try {
    		/*
    		 *regionCrawling.crawling메서드의 매개변수를 변경하여 가져올 최대 도시수를 결정할 수 있다
    		 *매개변수를 null로하면 네이버 여행 사이트의 해외여행 도시목록 전부를 대상으로 국가명과 도시명을 가져온다
    		 */
			regionList = regionCrawling.crawling(20);
			tabList = regionCrawling.getTabList();
			
			System.out.println("여행 국가 및 도시정보 입력");
		} catch (ClassNotFoundException e) {
			System.out.println("db드라이버 에러");
			e.printStackTrace();
		} catch (AWTException e) {
			System.out.println("인터페이스 관련 에러");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("db접속 에러");
			e.printStackTrace();
		}
    	
    	//도시 정보 가져오기
    	if(regionList != null) {
    		try {
				tripInfoTipsCrawler.crawling(regionList);
				
				System.out.println("여행 도시 상세정보 입력 완료.");
			} catch (ClassNotFoundException e) {
				System.out.println("db드라이버 에러");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("db접속 에러");
				e.printStackTrace();
			}
    	}

    	//추천장소 리스트 가져오기
    	if(regionList != null && tabList != null) {
    		try {
				placeInfoList = placeCrawling.crawlPlaces(regionList, tabList);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
    	}
    	
    	System.out.println(placeInfoList);

    	//추천장소 리스트 세부정보 가져오기
    	if(placeInfoList != null) {
	    	try {
	    		placeInfoCrawling.crawlPlaceInfo(placeInfoList);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InterruptedException e) {
				e.printStackTrace();
			} catch (AWTException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
    	}
    	
    	
    	
    }
}
