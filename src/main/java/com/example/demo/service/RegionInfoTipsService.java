package com.example.demo.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.RegionInfoTipsRepository;
import com.example.demo.vo.RegionInfoTips;

/*
 * 도시 정보 관련 비즈니스 로직 처리를 위한 서비스
 */
@Service
public class RegionInfoTipsService {

	@Autowired
	private RegionInfoTipsRepository regionInfoTipsRepository;

	//특정 도시 id의 도시 상세정보 객체를 반환하는 메서드
	public RegionInfoTips getRegionInfoTipsId(int regionId) {
		
		return regionInfoTipsRepository.getRegionInfoTipsId(regionId);
	}
}
