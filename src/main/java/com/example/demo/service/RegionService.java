package com.example.demo.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.RegionRepository;
import com.example.demo.vo.Region;
 

@Service
public class RegionService {

	@Autowired
	private RegionRepository regionRepository;

	public RegionService(RegionRepository regionRepository) {
		this.regionRepository = regionRepository;
	}
	
	public List<Region> getRegionList() {

		return regionRepository.getRegionList();
	}

	public Region getRegionById(int regionId) {
		// TODO Auto-generated method stub
		return regionRepository.getRegionById(regionId);
	}
}
