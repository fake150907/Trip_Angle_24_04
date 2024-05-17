
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	// 이전 페이지로 이동할지 여부 확인
	var historyBack = '${historyBack} == true';
	// 메시지 변수 선언 및 값 초기화
	var msg = '${msg}'.trim();

	// 메시지가 존재할 경우 알림창 표시
	if (msg) {
		alert(msg);
	}

	// 이전 페이지로 이동
	if (historyBack) {
		history.back();
	}
</script>