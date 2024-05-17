package com.example.demo.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

// 값 객체(VO) 클래스를 정의
@Data // Lombok을 사용해서 Getter, Setter 등을 자동으로 생성
@NoArgsConstructor // 파라미터가 없는 생성자를 자동으로 생성
public class Fashion {
    // 패션 아이템의 고유한 ID를 저장하는 변수
    private int id;
    // 패션 아이템의 등록일을 저장하는 변수
    private String regDate;
    // 패션 아이템의 수정일을 저장하는 변수
    private String updateDate;
    // 패션 아이템의 이름을 저장하는 변수
    private String name;
    // 패션 아이템의 브랜드를 저장하는 변수
    private String brand;
    // 패션 아이템의 이미지 URL을 저장하는 변수
    private String imageUrl;
    // 패션 아이템의 성별을 저장하는 변수
    private int gender;
    // 패션 아이템의 설명을 저장하는 변수
    private String description;
    // 패션 아이템이 속한 여행 일정의 ID를 저장하는 변수
    private int scheduleId;

    // 이름, 브랜드, 이미지 URL, 성별, 일정 ID를 매개변수로 받는 생성자를 정의
    public Fashion(String name, String brand, String imageUrl, int gender, int scheduleId) {
        // 받은 매개변수로 각 필드를 초기화
        this.name = name;
        this.brand = brand;
        this.imageUrl = imageUrl;
        this.gender = gender;
        this.scheduleId = scheduleId;
    }
}
