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
					})
				}
				calendar.unselect()
			},
			eventClick : function(arg) {
				if (confirm('일정을 삭제하시겠습니까?')) {
					arg.event.remove()
				}
			},
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events

		});

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
	margin-top: 200px;
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
</style>

<div class="calendar" id='calendar'></div>


<%@ include file="../common/foot.jspf"%>