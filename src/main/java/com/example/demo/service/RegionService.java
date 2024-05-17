package com.example.demo.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.RegionRepository;
import com.example.demo.vo.Region;
 

// 도시 관련 비즈니스 로직 처리를 위한 서비스
@Service
public class RegionService {

	@Autowired
	private RegionRepository regionRepository;

	
	public RegionService(RegionRepository regionRepository) {
		this.regionRepository = regionRepository;
	}
	
	
	/*
	 * @return 도시 객체 목록
	 */
	public List<Region> getRegionList() {

		return regionRepository.getRegionList();
	}

	/*
	 * 특정 도시 id에 해당하는 도시 정보를 반환하는 메소드
	 * @param 도시 id
	 * @return 도시 객체
	 */
	public Region getRegionById(int regionId) {
		// TODO Auto-generated method stub
		return regionRepository.getRegionById(regionId);
	}
}
