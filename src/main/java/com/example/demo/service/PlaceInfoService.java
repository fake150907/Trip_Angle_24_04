package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.crawling.PlaceInfoDto;
import com.example.demo.repository.PlaceInfoRepository;

@Service
public class PlaceInfoService {

	@Autowired
	private PlaceInfoRepository placeInfoRepository;

	// 특정 탭과 지역에 해당하는 장소 정보 목록을 가져오는 메서드
	public List<PlaceInfoDto> getplaceInfoList(int tabId, int regionId) {
		// PlaceInfoRepository를 통해 장소 정보 목록을 가져옴
		return placeInfoRepository.getplaceInfoList(tabId, regionId);
	}

	// 특정 장소의 정보를 가져오는 메서드
	public PlaceInfoDto getPlaceInfo(int id) {
		// PlaceInfoRepository를 통해 특정 장소의 정보를 가져옴
		return placeInfoRepository.getPlaceInfo(id);
	}

}
