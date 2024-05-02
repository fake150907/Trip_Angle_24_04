package com.example.demo.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.RegionRepository;
import com.example.demo.repository.TravelScheduleRepository;
import com.example.demo.vo.Region;
import com.example.demo.vo.TravelSchedule;

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
}
