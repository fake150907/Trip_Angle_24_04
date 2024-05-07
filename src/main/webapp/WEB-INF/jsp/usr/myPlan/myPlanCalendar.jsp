<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="TRIP REVIEW LIST"></c:set>
<%@ include file="../common/head.jspf"%>
<script src='/resource/index.global.js' defer="defer"></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : function(arg) {
				var title = prompt('일정 이름:');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					});

					// Ajax 호출
					$.ajax({
						url : '/usr/myPlan/saveCalendarData', // 서버의 URL
						method : 'POST', // POST 요청
						contentType : 'application/json',
						data : JSON.stringify({
							title : title,
							start : arg.start.toISOString(), // 날짜 형식 변환
							end : arg.end ? arg.end.toISOString() : null, // 종료일이 있는 경우에만 변환
							allDay : arg.allDay
						}),
						success : function(response) {
							console.log('일정이 성공적으로 저장되었습니다.'); // 성공적으로 저장되었을 때의 처리
						},
						error : function(xhr, status, error) {
							// 저장에 실패했을 때의 처리
							console.error('일정 저장 중 오류가 발생했습니다:', error);
						}
					});
				}
				calendar.unselect();
			},
			eventClick : function(arg) {
				var calendarDataId = parseInt(arg.event.id);
				if (confirm('일정을 삭제하시겠습니까?')) {
					arg.event.remove();

					// Ajax 호출
					$.ajax({
						url : '/usr/myPlan/deleteCalendarData', // 서버의 URL
						type : 'POST', // POST 요청
						data : {
							calendarId : calendarDataId
						},
						dataType : 'json',
						success : function(response) {
							console.log('일정이 성공적으로 삭제되었습니다.'); // 성공적으로 삭제되었을 때의 처리
						},
						error : function(xhr, status, error) {

							console.error('일정 삭제 중 오류가 발생했습니다:', error);// 삭제에 실패했을 때의 처리
						}
					});
				}
			},
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events

		});

		<c:forEach items="${calendarDatas}" var="event">
		calendar.addEvent({
			id : '<c:out value="${event.id}" />',
			title : '<c:out value="${event.title}" />',
			start : '<c:out value="${event.start}" />',
			end : '<c:out value="${event.end}" />',
			allDay : <c:out value="${event.allDay}" />
		});
		</c:forEach>

		calendar.render();
	});
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
	margin-top: 100px;
}

.fc-event-title {
	color: #3b3d40;
	font-weight: 600;
}

.fc-event {
	background-color: #d5f1e2;
	border-color: #d5f1e2;
}

.fc-prev-button, .fc-prev-button, .fc-button, .fc-button-primary,
	.fc-button-group, .fc-today-button, .fc-timeGridWeek-button {
	background-color: #d5f1e2;
	border-color: #d5f1e2;
	color: #d5f1e2;
}

.btn {
	margin-top: 50px;
	background-color: #d5f1e2;
	border-color: #d5f1e2;
	background-color: #d5f1e2;
}

.btn:hover {
	background-color: #ededed;
	border-color: #ededed;
	color: black;
}
</style>

<div class="calendar" id='calendar'>
	<button class="btn btn-outline" type="button" onclick="history.back();">
		<img class="history_back_img"
			src="https://velog.velcdn.com/images/fake150907/post/2d6415a7-d5b6-4673-8cd9-83e781b2945a/image.svg"
			alt="" />
		<div class="history_back_text">내 일정으로 돌아가기</div>
	</button>
</div>


<%@ include file="../common/foot.jspf"%>