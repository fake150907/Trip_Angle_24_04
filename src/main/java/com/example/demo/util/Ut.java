package com.example.demo.util;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;

public class Ut {
	private static final ObjectMapper objectMapper = new ObjectMapper(); // JSON 변환을 위한 ObjectMapper 인스턴스 생성

	// 포맷된 문자열을 반환하는 메서드
	public static String f(String format, Object... args) {
		return String.format(format, args); // 주어진 포맷과 인수를 사용하여 문자열 반환
	}

	// 문자열이 null이거나 비어있는지 확인하는 메서드
	public static boolean isNullOrEmpty(String str) {
		return str == null || str.trim().length() == 0; // 문자열이 null이거나 길이가 0이면 true 반환
	}

	// 데이터가 비어있으면 기본값을 반환하는 메서드
	public static <T> T ifEmpty(T data, T defaultValue) {
		if (isEmpty(data)) { // 데이터가 비어있는지 확인
			return defaultValue; // 비어있으면 기본값 반환
		}
		return data; // 비어있지 않으면 원래 데이터 반환
	}

	// 객체가 비어있는지 확인하는 메서드
	public static boolean isEmpty(Object obj) {
		if (obj == null) {
			return true; // 객체가 null이면 true 반환
		}

		if (obj instanceof Integer) {
			return (int) obj == 0; // Integer 객체가 0이면 true 반환
		}

		if (obj instanceof String) {
			return ((String) obj).trim().length() == 0; // String 객체가 비어있으면 true 반환
		}

		if (obj instanceof Map) {
			return ((Map<?, ?>) obj).isEmpty(); // Map 객체가 비어있으면 true 반환
		}

		if (obj.getClass().isArray()) {
			return Array.getLength(obj) == 0; // 배열 객체가 비어있으면 true 반환
		}

		return false; // 위 조건에 해당하지 않으면 false 반환
	}

	// 자바스크립트를 통해 이전 페이지로 이동하는 메서드 (알림 메시지 포함)
	public static String jsHistoryBack(String resultCode, String msg) {
		if (resultCode == null) {
			resultCode = ""; // resultCode가 null이면 빈 문자열로 설정
		}
		if (msg == null) {
			msg = ""; // msg가 null이면 빈 문자열로 설정
		}
		String resultMsg = resultCode + " / " + msg; // resultCode와 msg를 합친 결과 메시지

		// 자바스크립트를 사용하여 경고 메시지를 보여주고, 이전 페이지로 이동하는 HTML 스크립트 반환
		return Ut.f("""
				<script>
				    const resultMsg = '%s'.trim();
				    if(resultMsg.length > 0){
				        alert(resultMsg);
				    }
				    history.back();
				</script>
				""", resultMsg);
	}

	// 자바스크립트를 통해 특정 URL로 이동하는 메서드 (알림 메시지 포함)
	public static String jsReplace(String resultCode, String msg, String replaceUri) {
		if (resultCode == null) {
			resultCode = ""; // resultCode가 null이면 빈 문자열로 설정
		}
		if (msg == null) {
			msg = ""; // msg가 null이면 빈 문자열로 설정
		}
		if (replaceUri == null) {
			replaceUri = "/"; // replaceUri가 null이면 기본값으로 "/" 설정
		}

		String resultMsg = resultCode + " / " + msg; // resultCode와 msg를 합친 결과 메시지

		// 자바스크립트를 사용하여 경고 메시지를 보여주고, 특정 URL로 이동하는 HTML 스크립트 반환
		return Ut.f("""
				<script>
				    const resultMsg = '%s'.trim();
				    if(resultMsg.length > 0){
				        alert(resultMsg);
				    }
				    location.replace('%s');
				</script>
				""", resultMsg, replaceUri);
	}

	// 객체를 JSON 문자열로 변환하는 메서드
	public static String toJsonString(Object obj) {
		try {
			return objectMapper.writeValueAsString(obj); // 객체를 JSON 문자열로 변환
		} catch (JsonProcessingException e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
			// 실제 프로덕션 환경에서는 로깅 프레임워크를 사용하거나 적절한 예외 처리를 해야 합니다.
			return null; // 예외 발생 시 null 반환
		}
	}

	// 현재 URI를 UTF-8로 인코딩하는 메서드
	public static String getEncodedCurrentUri(String currentUri) {
		try {
			return URLEncoder.encode(currentUri, "UTF-8"); // URI를 UTF-8로 인코딩
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
			return currentUri; // 예외 발생 시 원래 URI 반환
		}
	}

	// 현재 시간에서 주어진 초만큼 더한 날짜 문자열을 반환하는 메서드
	public static String getDateStrLater(long seconds) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 날짜 포맷 설정
		String dateStr = format.format(System.currentTimeMillis() + seconds * 1000); // 현재 시간에 초 단위로 더한 시간 반환
		return dateStr;
	}

	// 객체를 JSON 문자열로 변환하는 메서드 (중복된 메서드)
	public static String toJsonStr(Object obj) {
		ObjectMapper mapper = new ObjectMapper(); // ObjectMapper 인스턴스 생성
		try {
			return mapper.writeValueAsString(obj); // 객체를 JSON 문자열로 변환
		} catch (JsonProcessingException e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
		}
		return ""; // 예외 발생 시 빈 문자열 반환
	}

	// 맵을 JSON 문자열로 변환하는 메서드
	public static String toJsonStr(Map<String, Object> param) {
		ObjectMapper mapper = new ObjectMapper(); // ObjectMapper 인스턴스 생성
		try {
			return mapper.writeValueAsString(param); // 맵을 JSON 문자열로 변환
		} catch (JsonProcessingException e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
		}
		return ""; // 예외 발생 시 빈 문자열 반환
	}

	// 맵에서 주어진 속성 값을 문자열로 반환하는 메서드. 속성이 없으면 기본값을 반환합니다.
	public static String getStrAttr(Map map, String attrName, String defaultValue) {
		if (map.containsKey(attrName)) {
			return (String) map.get(attrName); // 맵에 속성이 있으면 해당 속성 값 반환
		}
		return defaultValue; // 맵에 속성이 없으면 기본값 반환
	}

	// 파일 이름에서 확장자를 추출하고, 확장자에 따른 파일 타입 코드를 반환하는 메서드
	public static String getFileExtTypeCodeFromFileName(String fileName) {
		String ext = getFileExtFromFileName(fileName).toLowerCase(); // 파일 이름에서 확장자를 소문자로 추출
		switch (ext) {
		case "jpeg":
		case "jpg":
		case "gif":
		case "png":
			return "img"; // 이미지 파일 유형 반환
		case "mp4":
		case "avi":
		case "mov":
			return "video"; // 비디오 파일 유형 반환
		case "mp3":
			return "audio"; // 오디오 파일 유형 반환
		}
		return "etc"; // 기타 파일 유형 반환
	}

	// 파일 이름에서 확장자를 추출하고, 확장자에 따른 파일 타입 코드를 반환하는 메서드
	public static String getFileExtType2CodeFromFileName(String fileName) {
		String ext = getFileExtFromFileName(fileName).toLowerCase(); // 파일 이름에서 확장자를 소문자로 추출
		switch (ext) {
		case "jpeg":
		case "jpg":
			return "jpg"; // JPG 파일 유형 반환
		case "gif":
		case "png":
		case "mp4":
		case "mov":
		case "avi":
		case "mp3":
			return ext; // 기타 확장자 그대로 반환
		}
		return "etc"; // 기타 파일 유형 반환
	}

	// 파일 이름에서 확장자를 추출하는 메서드
	public static String getFileExtFromFileName(String fileName) {
		int pos = fileName.lastIndexOf("."); // 파일 이름에서 마지막 점의 위치 찾기
		String ext = fileName.substring(pos + 1); // 점 이후의 문자열(확장자) 추출
		return ext; // 확장자 반환
	}

	// 현재 날짜를 "yyyy_MM" 형식으로 반환하는 메서드
	public static String getNowYearMonthDateStr() {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy_MM"); // 날짜 포맷 설정
		String dateStr = format1.format(System.currentTimeMillis()); // 현재 날짜를 포맷에 맞게 변환
		return dateStr;
	}

	// 주어진 문자열을 특정 구분자로 나누어 정수 리스트로 반환하는 메서드
	public static List<Integer> getListDividedBy(String str, String divideBy) {
		return Arrays.asList(str.split(divideBy)) // 문자열을 구분자로 나누어 리스트로 변환
				.stream() // 스트림 생성
				.map(s -> Integer.parseInt(s.trim())) // 각 문자열을 정수로 변환
				.collect(Collectors.toList()); // 리스트로 수집하여 반환
	}

	// 파일을 삭제하는 메서드
	public static boolean deleteFile(String filePath) {
		java.io.File ioFile = new java.io.File(filePath); // 파일 객체 생성
		if (ioFile.exists()) { // 파일이 존재하면
			return ioFile.delete(); // 파일 삭제
		}
		return true; // 파일이 존재하지 않으면 true 반환
	}

	// 가변 인자를 받아 맵으로 변환하는 메서드
	public static Map<String, Object> mapOf(Object... args) {
		if (args.length % 2 != 0) {
			throw new IllegalArgumentException("인자를 짝수개 입력해주세요."); // 인자의 개수가 홀수면 예외 발생
		}

		int size = args.length / 2; // 맵의 크기 계산
		Map<String, Object> map = new LinkedHashMap<>(); // 순서가 유지되는 해시맵 생성

		for (int i = 0; i < size; i++) {
			int keyIndex = i * 2; // 키의 인덱스
			int valueIndex = keyIndex + 1; // 값의 인덱스

			String key;
			Object value;

			try {
				key = (String) args[keyIndex]; // 키를 문자열로 변환
			} catch (ClassCastException e) {
				throw new IllegalArgumentException("키는 String으로 입력해야 합니다. " + e.getMessage()); // 키가 문자열이 아니면 예외 발생
			}

			value = args[valueIndex]; // 값을 추출
			map.put(key, value); // 맵에 키-값 쌍 추가
		}

		return map; // 생성된 맵 반환
	}

	// 객체를 정수로 변환하는 메서드. 변환 실패 시 기본값 반환
	public static int getAsInt(Object object, int defaultValue) {
		if (object instanceof BigInteger) {
			return ((BigInteger) object).intValue(); // BigInteger를 정수로 변환
		} else if (object instanceof Double) {
			return (int) Math.floor((double) object); // Double을 정수로 변환
		} else if (object instanceof Float) {
			return (int) Math.floor((float) object); // Float을 정수로 변환
		} else if (object instanceof Long) {
			return (int) object; // Long을 정수로 변환
		} else if (object instanceof Integer) {
			return (int) object; // Integer를 반환
		} else if (object instanceof String) {
			return Integer.parseInt((String) object); // String을 정수로 변환
		}
		return defaultValue; // 변환 실패 시 기본값 반환
	}

	// 데이터가 null이면 기본값을 반환하는 메서드
	public static <T> T ifNull(T data, T defaultValue) {
		return data != null ? data : defaultValue; // 데이터가 null이 아니면 데이터 반환, null이면 기본값 반환
	}

	// HTTP 요청 객체에서 속성을 가져오고, null이면 기본값을 반환하는 메서드
	public static <T> T reqAttr(HttpServletRequest req, String attrName, T defaultValue) {
		return (T) ifNull(req.getAttribute(attrName), defaultValue); // 요청 객체에서 속성을 가져오고, null이면 기본값 반환
	}

	// 문자열을 SHA-256 해시로 변환하는 메서드
	public static String sha256(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256"); // SHA-256 해시 알고리즘 인스턴스 생성
			byte[] hash = md.digest(input.getBytes("UTF-8")); // 입력 문자열을 바이트 배열로 변환 후 해시 계산
			StringBuffer hexString = new StringBuffer(); // 해시 값을 16진수로 변환할 StringBuffer 생성

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]); // 해시 바이트를 16진수 문자열로 변환
				if (hex.length() == 1)
					hexString.append('0'); // 16진수 문자열 길이가 1이면 0을 추가
				hexString.append(hex); // 16진수 문자열 추가
			}

			return hexString.toString(); // 최종 해시 문자열 반환
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
			return null; // 예외 발생 시 null 반환
		}
	}

	// 임시 비밀번호를 생성하는 메서드
	public static String getTempPassword(int length) {
		int index = 0;
		char[] charArr = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f',
				'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' }; // 문자
																														// 배열
																														// 생성

		StringBuffer sb = new StringBuffer(); // 임시 비밀번호를 저장할 StringBuffer 생성

		for (int i = 0; i < length; i++) {
			index = (int) (charArr.length * Math.random()); // 0부터 charArr 길이 사이의 난수 생성
			sb.append(charArr[index]); // 난수에 해당하는 문자를 StringBuffer에 추가
		}

		return sb.toString(); // 최종 임시 비밀번호 문자열 반환
	}
}