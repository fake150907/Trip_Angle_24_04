package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 값 객체(VO) 클래스를 정의
@Data // Lombok을 사용해서 Getter, Setter 등을 자동으로 생성
@NoArgsConstructor // 파라미터가 없는 생성자를 자동으로 생성
@AllArgsConstructor // 모든 필드를 매개변수로 받는 생성자를 자동으로 생성
public class RegionInfoTips {
    // 지역 정보 팁의 고유한 ID를 저장하는 변수
    private int id;
    // 지역에 대한 정보를 저장하는 변수
    private String information;
    // 전압 정보를 저장하는 변수
    private String voltage;
    // 사용되는 언어 정보를 저장하는 변수
    private String language;
    // 기후 정보를 저장하는 변수
    private String climate;
    // 환율 정보를 저장하는 변수
    private String rate;
    // 여행 팁을 저장하는 변수
    private String tips;
    // 지역 ID를 저장하는 변수
    private int regionId;
    // 시차 정보를 저장하는 변수
    private String timeDifference;
}
