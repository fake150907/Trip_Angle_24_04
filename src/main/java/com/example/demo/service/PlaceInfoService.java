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

	public List<PlaceInfoDto> getplaceInfoList(int tabId, int regionId) {

		return placeInfoRepository.getplaceInfoList(tabId, regionId);
	}

	public PlaceInfoDto getPlaceInfo(int id) {
		return placeInfoRepository.getPlaceInfo(id);
	}

}
