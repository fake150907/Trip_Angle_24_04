package com.example.demo.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.RegionInfoTipsRepository;
import com.example.demo.vo.regionInfoTips;

@Service
public class RegionInfoTipsService {

	@Autowired
	private RegionInfoTipsRepository regionInfoTipsRepository;

	public regionInfoTips getRegionInfoTipsId(int regionId) {
		
		return regionInfoTipsRepository.getRegionInfoTipsId(regionId);
	}
}