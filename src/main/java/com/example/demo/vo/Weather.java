package com.example.demo.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data // Lombok을 사용하여 Getter, Setter, equals(), hashCode(), toString() 등을 자동으로 생성합니다.
@NoArgsConstructor // 인자 없는 생성자를 자동으로 생성합니다.
public class Weather { // Weather 클래스 선언

	private int id; // id 필드: 날씨 정보의 고유 식별자
	private String regDate; // regDate 필드: 등록일시
	private String updateDate; // updateDate 필드: 수정일시
	private String day; // day 필드: 해당 날짜
	private int minTemp; // minTemp 필드: 최저 기온
	private int maxTemp; // maxTemp 필드: 최고 기온
	private int humidity; // humidity 필드: 습도
	private String icon; // icon 필드: 날씨 아이콘
	private int scheduleId; // scheduleId 필드: 일정 고유 식별자

	// Weather 클래스의 생성자
	public Weather(String day, int minTemp, int maxTemp, int humidity, String icon, int scheduleId) {
		this.day = day; // 인자로 받은 day 값을 day 필드에 저장
		this.minTemp = minTemp; // 인자로 받은 minTemp 값을 minTemp 필드에 저장
		this.maxTemp = maxTemp; // 인자로 받은 maxTemp 값을 maxTemp 필드에 저장
		this.humidity = humidity; // 인자로 받은 humidity 값을 humidity 필드에 저장
		this.icon = icon; // 인자로 받은 icon 값을 icon 필드에 저장
		this.scheduleId = scheduleId; // 인자로 받은 scheduleId 값을 scheduleId 필드에 저장
	}

	// pullIconPath 메서드: 아이콘 경로를 생성하여 반환합니다.
	public String pullIconPath() {
		return "https://openweathermap.org/img/wn/" + icon + "@2x.png"; // 아이콘 경로를 반환합니다.
	}

	// shortenDay 메서드: 날짜 형식을 변경하여 반환합니다.
	public String shortenDay() {
		String dayWithoutFirstTwoString = day.substring(2); // day 문자열ㄴ의 앞의 두 글자를 제외한 문자열을 생성합니다.
		return dayWithoutFirstTwoString.replace("-", "/"); // "-"를 "/"로 변경하여 반환합니다.
	}
}

