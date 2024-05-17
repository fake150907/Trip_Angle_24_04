package com.example.demo.crawling;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TabListDTO {
    private int id; // 탭 리스트의 ID를 저장하는 변수
    private String regDate; // 등록 날짜를 저장하는 변수
    private String updateDate; // 업데이트 날짜를 저장하는 변수
    private String themeName; // 테마 이름을 저장하는 변수
}
