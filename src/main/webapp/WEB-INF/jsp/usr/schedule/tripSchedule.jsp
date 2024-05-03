<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Schedule PAGE"></c:set>
<%@ include file="../common/head.jspf"%>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 제이쿼리  -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.structure.min.css">

<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

@charset "UTF-8";

@import
	url("https://fonts.googleapis.com/css?family=Raleway:400,300,600");

/* 제이쿼리 datepicker 시작 */
.ui-datepicker.ui-datepicker-multi {
	width: 100% !important;
	max-width: 24em;
	margin: auto;
}

.ui-datepicker td a.ui-state-active, .ui-datepicker td span.ui-state-active
	{
	background-color: #D5F1E2;
	border-radius: 5px;
}

.ui-datepicker td.ui-datepicker-reserved a, .ui-datepicker td.ui-datepicker-reserved span
	{
	background-color: rgba(222, 222, 222, 0.5); /*까만색(0,0,0) 20% 불투명도 */
	color: #696969;
	border-radius: 5px;
}

.ui-datepicker td.ui-datepicker-reserved.ui-datepicker-checkin a,
	.ui-datepicker td.ui-datepicker-reserved.ui-datepicker-checkin span,
	.ui-datepicker td.ui-datepicker-reserved.ui-datepicker-checkout a,
	.ui-datepicker td.ui-datepicker-reserved.ui-datepicker-checkout span {
	background-color: #D5F1E2;
	color: black;
	border-radius: 5px;
}

.ui-datepicker .ui-datepicker-prev, .ui-datepicker .ui-datepicker-next {
	border-radius: 0.5em;
	text-align: center;
	text-indent: 0;
}

.ui-datepicker .ui-datepicker-prev:before, .ui-datepicker .ui-datepicker-prev:after,
	.ui-datepicker .ui-datepicker-next:before, .ui-datepicker .ui-datepicker-next:after
	{
	display: inline-block;
}

.ui-datepicker .ui-datepicker-prev.ui-state-hover, .ui-datepicker .ui-datepicker-next.ui-state-hover
	{
	top: 2px;
}

.ui-datepicker .ui-datepicker-prev:before {
	content: "←";
	align-content: center;
	align-items: center;
	top: 100px;
}

.ui-datepicker .ui-datepicker-prev, .ui-datepicker .ui-datepicker-prev.ui-state-hover
	{
	left: 10px;
}

.ui-datepicker .ui-datepicker-next:after {
	content: "→";
}

.ui-datepicker .ui-datepicker-next, .ui-datepicker .ui-datepicker-next.ui-state-hover
	{
	right: 10px;
}

hide {
	opacity: 0;
}

show {
	opacity: 1;
}

.fade-in {
	-webkit-animation-duration: 1s;
	animation-duration: 1s;
	-webkit-animation-name: fade-in;
	animation-name: fade-in;
}

/* Larger than mobile */
@media ( min-width : 400px) {
	.ui-datepicker {
		min-width: 18em;
	}
}
/* Larger than phablet (also point when grid becomes active) */
/* Larger than tablet */
@media ( min-width : 750px) {
	.ui-datepicker {
		min-width: 34em;
	}
	.arrow {
		margin-top: 0;
		font-size: 3em;
	}
}
/* Larger than desktop */
@media ( min-width : 1000px) {
	.ui-datepicker {
		min-width: 51em;
	}
}

/* Larger than Desktop HD */
@-webkit-keyframes fade-in { 
	0% {
	opacity: 0;
	}
	100% {
	opacity:1;
	}
}
@keyframes fade-in { 0% {
	opacity: 0;
}
	100%{
		opacity:1;
	}
}
/* 제이쿼리 datepicker 끝 */

/* 데이트피커 한국분이 만든 UI */
.ui-widget-header {
	border: 0px solid #dddddd;
	background: #fff;
}

.ui-datepicker-calendar>thead>tr>th {
	font-size: 17px !important;
}

.ui-datepicker .ui-datepicker-header {
	position: relative;
	padding: 0px 0;
	font-family: 'Pretendard-Regular';
	font-weight: 400;
	font-style: normal;
}

.ui-state-default, .ui-widget-content .ui-state-default,
	.ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover,
	html .ui-button.ui-state-disabled:active {
	border: 0px solid #c5c5c5;
	background-color: transparent;
	font-weight: normal;
	color: #454545;
	text-align: center;
}

.ui-datepicker .ui-datepicker-title {
	margin: 30px;
	line-height: 16px;
	text-align: center;
	font-size: 20px;
	padding: 0px;
}

.ui-datepicker {
	display: none;
	background-color: #fff;
	border-radius: 10px;
	margin-top: 10px;
	margin-left: 0px;
	margin-right: 0px;
	padding: 20px;
	padding-bottom: 10px;
	width: 300px;
	box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1);
}

.ui-widget.ui-widget-content {
	border: 1px solid #eee;
}

#datepicker:focus>.ui-datepicker {
	display: block;
}

.ui-datepicker-prev, .ui-datepicker-next {
	cursor: pointer;
}

.ui-datepicker-next {
	float: right;
}

.ui-state-disabled {
	cursor: auto;
	color: hsla(0, 0%, 80%, 1);
}

.ui-datepicker-title {
	text-align: center;
	padding: 10px;
	font-weight: 100;
	font-size: 20px;
}

.ui-datepicker-calendar {
	width: 100%;
}

.ui-datepicker-calendar>thead>tr>th {
	padding: 5px;
	font-size: 20px;
	font-weight: 400;
}

.ui-datepicker-calendar>tbody>tr>td>a {
	color: #000;
	font-size: 15px !important;
	font-weight: !important;
	text-decoration: none;
}

.ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover {
	cursor: auto;
	background-color: #fff;
}

.ui-datepicker-calendar>tbody>tr>td {
	border-radius: 100%;
	width: 44px;
	height: 30px;
	cursor: pointer;
	padding: 5px;
	font-weight: 100;
	text-align: center;
	font-size: 12px;
}

.ui-datepicker-calendar>tbody>tr>td:hover {
	background-color: transparent;
	opacity: 0.6;
}

.ui-state-hover, .ui-widget-content .ui-state-hover, .ui-widget-header .ui-state-hover,
	.ui-state-focus, .ui-widget-content .ui-state-focus, .ui-widget-header .ui-state-focus,
	.ui-button:hover, .ui-button:focus {
	border: 0px solid #cccccc;
	background-color: transparent;
	font-weight: normal;
	color: #2b2b2b;
}

.ui-widget-header .ui-icon {
	background-image: url('./btns.png');
}

.ui-icon-circle-triangle-e {
	background-position: -20px 0px;
	background-size: 36px;
}

.ui-icon-circle-triangle-w {
	background-position: -0px -0px;
	background-size: 36px;
}

.ui-datepicker-calendar>tbody>tr>td:first-child a {
	color: red !important;
}

.ui-datepicker-calendar>tbody>tr>td:last-child a {
	color: #0099ff !important;
}

.ui-datepicker-calendar>thead>tr>th:first-child {
	color: red !important;
}

.ui-datepicker-calendar>thead>tr>th:last-child {
	color: #0099ff !important;
}

.ui-state-highlight, .ui-widget-content .ui-state-highlight,
	.ui-widget-header .ui-state-highlight {
	border: 0px;
	background: #f1f1f1;
	border-radius: 50%;
	padding-top: 10px;
	padding-bottom: 10px;
}

.inp {
	padding: 10px 10px;
	background-color: #f1f1f1;
	border-radius: 4px;
	border: 0px;
}

.inp:focus {
	outline: none;
	background-color: #eee;
}

#calendar {
	margin: 50px;
}

* {
	list-style-type: none;
	color: black;
}

header {
	padding: 20px;
}

.logo {
	font-size: 30px;
	padding-bottom: 20px;
}

a {
	color: black;
}


.ui-state-default {
	height: 35px;
	align-content: center;
	align-items: center;
	font-family: 'Pretendard-Regular';
	font-weight: 400;
	font-style: normal;
	font-size: 15px;
}

.ui-datepicker-week-end, th {
	font-family: 'Pretendard-Regular';
	font-weight: 400;
	font-style: normal;
}
/* 데이트피커 한국분이 만든 UI 끝*/


/* 헤더 fixed로 인해 요소 겹치지 않게 헤더 크기만큼 div 높이 생성 */

.wall {
	height: 90px;
}

/* 도시명, 여행기간 텍스트 시작 */

.div {
 	display: flex;
	flex-direction: column;
	align-items: center;
	color: #3b3d40;
	font-weight: 500;
	text-align: center;
	padding: 0 20px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
}

.div-2 {
	font: 36px Pretendard, sans-serif;
}

.div-3 {
	background-color: #d5f1e2;
	margin-top: 10px;
	width: 165px;
	height: 3px;
}

.div-4 {
	margin-top: 45px;
	font: 16px Pretendard, sans-serif;
}

.div-5 {
	color: #81c8a2;
	align-self: stretch;
	margin-top: 5px;
	width: 100%;
	font: 14px Pretendard, sans-serif;
}

/* 도시명, 여행기간 텍스트 끝 */



.button-flex {
	width: 750px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.create-button {
	display: block;
	margin-left: auto;
	background-color: #D5F1E2;
	border: white;
	font: 14px Pretendard, sans-serif;
	margin-top: 100px;
}

/* 모달창 - 마이일정 생성하기 도시명 */
.modal-schedule-region {
	text-align: center;
	font-size: 25px;
	margin-top: 3px;
	margin-bottom: 5px;
}

/* 모달창 - 선택 날짜 */
#checkDateModal {
	text-align: center;
	margin-bottom: 10px;
}

/* 모달창 박스 */
.modal-box {
	width: 475px;
	max-width: 1000px;
	max-height: 1000px;
	min-height: 335px;
	border-radius: 15px;
}

/* 모달창 - 일정명 */
.schedule-title {
	display: block;
	width: 360px;
	min-height: 30px;
	max-height: 30px;
	margin-left: auto;
	margin-right: auto;
}

/* 모달창 - 내용 */
.schedule-content {
	display: block;
	width: 360px;
	min-height: 115px;
	max-height: 115px;
	margin-left: auto;
	margin-right: auto;
}

/* input 노멀라이즈 */
input {
	display: flex;
	max-height: 1000px;
}

form {
	margin-bottom: 0%;
}

/* 모달창 - 마이일정 생성하기 텍스트 박스 */
.modal-schedule-create-text-box {
	position: relative;
}

/* 모달창 - 마이일정 생성하기 텍스트 */
.modal-schedule-create-text {
	display: inline-block;
	text-align: center;
	position: absolute;
	left: 37.5%;
	color: #81c8a2;
	margin-top: 5px;
}

/* 모달창 닫기 버튼 */
.close-button {
	display: inline-block;
	border: none;
	margin-left: 93%;
	margin-bottom: 0%;
	font-size: 16px;
}

/* 모달창 생성 버튼 */
.modal-create-button {
	background-color: #D5F1E2;
	border: white;
	font: 14px Pretendard, sans-serif;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.schedule-content::placeholder {
	position: absolute;
	left: 32%;
	color: #c8c8c8;
	font-weight: 100;
}

.schedule-title::placeholder {
	position: absolute;
	left: 30%;
	color: #c8c8c8;
	font-weight: 100;
}

</style>

<script>
$(function() {
	  'use strict';

	  var checkIn, checkOut, numberOfMonths = [1, 2],
	      $calendar = $('#calendar').datepicker({
	        numberOfMonths: numberOfMonths,
	        prevText: '',
	        nextText: '',
	        beforeShowDay: function(date) {
	          date = moment(date);

	          var now = moment(),
	              show = date.isAfter(now),
	              css = '';

	          if (checkIn && checkOut 
	              && date.isSameOrAfter(checkIn)
	              && date.isSameOrBefore(checkOut)) {
	            css = 'ui-datepicker-reserved';

	            if (date.isSame(checkIn)) css += ' ui-datepicker-checkin';
	            if (date.isSame(checkOut)) css += ' ui-datepicker-checkout';
	          }

	          return [show, css];
	        },
	        onSelect: function(value) {
	          var date = moment($calendar.datepicker('getDate'));

	          if (checkIn && !checkOut
	              && date.isSameOrAfter(checkIn)) 
	            checkOut = date;
	          else {
	            checkIn = date;
	            checkOut = null;
	          }
	          
	          $('#check-in-date').text(checkIn ? checkIn.format('YYYY-MM-DD') : '날짜를 선택하세요');
	          $('#check-out-date').text(checkOut ? checkOut.format('YYYY-MM-DD') : '날짜를 선택하세요');
	        },
	        onChangeMonthYear: function() {
	          $calendar.addClass('fade-in');
	        }
	      }).on('animationend webkitAnimationEnd', function() {
	        $calendar.removeClass('fade-in');
	      });
 
	  function resize() {
	    var element = $('.ui-datepicker').get(0),
	        style = window.getComputedStyle(element).getPropertyValue('min-width'), 
	        value;

	    switch (style) {
	      case '765px': value = [1, 2]; break;
	      case '510px': value = [2, 1]; break;
	      default: value = [2, 1]; break;
	    }

	    if (numberOfMonths !== value) {
	      if (checkIn) $calendar.datepicker('setDate', checkIn.toDate());

	      $calendar.datepicker('option', 'numberOfMonths', numberOfMonths = value);
	    }
	  }

	  $(window).on('resize', resize);

	  resize();
	});
	
$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});

	$(function () {
	  $('.datepicker').datepicker();
	});

	$(document).ready(function() {
	    // 추가 버튼을 클릭할 때 실행되는 함수
	    $('.create-button').click(function() {
	        // 선택한 체크인 날짜와 체크아웃 날짜 가져오기
	        var checkInDate = $('#check-in-date').text();
	        var checkOutDate = $('#check-out-date').text();
	        
	        // hidden input 태그에 선택한 날짜 설정
	        $('#checkInDateInput').val(checkInDate);
	        $('#checkOutDateInput').val(checkOutDate);
	        
	        if(checkInDate.trim() == "") {
	        	alert("날짜를 2일 이상으로 선택해주세요");
	        	return;
	        } else if(checkOutDate.trim() == "날짜를 선택하세요"){
	        	alert("날짜를 2일 이상으로 선택해주세요");
	        	return;
	        }
	        
	        // 선택 시작 날짜, 종료 날짜.
	        console.log(checkInDate);
	        console.log(checkOutDate);
	        
	        // 날짜 사이의 차이를 구하는 함수
	        const getDateDiff = (d1, d2) => {
	        	  const date1 = new Date(d1);
	        	  const date2 = new Date(d2);

	        	  const diffDate = date1.getTime() - date2.getTime();

	        	  return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
	        	}

				// 오늘 날짜를 구하는 함수
		        function getToday(){
	        	    var date = new Date();
	        	    var year = date.getFullYear();
	        	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	        	    var day = ("0" + date.getDate()).slice(-2);

	        	    return year + "-" + month + "-" + day;
	        	}
		        
				// 현재 날짜로부터 15일 이상 선택시 알람
		        if(getDateDiff(getToday(), checkOutDate) > 15) {
		        	alert("오늘 날짜로부터 15일 이하로 선택해 주세요.");
		        	return;
		        }
				
		        $('#checkDateModal').text(checkInDate + " 부터 " + checkOutDate);
				
		        my_modal_3.showModal();

// 		        console.log(getDateDiff(getToday(), checkOutDate));
		        
// 	        	console.log(getDateDiff(checkInDate, checkOutDate) + 1);

	        // form 제출
// 	        $('form').submit();
	    });
	});
	
</script>

<div class="wall"></div>

<div class="div">
	<div class="div-2">하와이</div>
	<div class="div-3"></div>
	<div class="div-4">여행 기간을 선택해주세요</div>
	<div class="div-5">여행지 출발 날짜와, 여행지 도착 날짜로 입력해주세요.</div>
</div>

<div id="calendar"></div>
<div class="container">
	<div id="calendar-details"></div>
</div>

<div class="check-in">
	<!--       <h5>Check-In</h5> -->
	<h6>
		<input type="" hidden"" id="check-in-date">
	</h6>
</div>
<div class="arrow"></div>
<div class="check-out">
	<!--        <h5>Check-Out</h5> -->
	<h6>
		<input type="hidden" id="check-out-date">
	</h6>
</div>

<!-- <form action="/usr/tipInfo/information" method="get"> -->

<div class="button-flex">
	<button type="button" class="create-button">추가</button>
</div>
<!-- </form> -->

<!-- <button class="btn" onclick="my_modal_1.showModal()">open modal</button> -->
<dialog id="my_modal_3" class="modal">
<div class="modal-box w-11/12 max-w-5xl">
	<form method="dialog">
		<div class="modal-schedule-create-text-box">
			<!--       <button class="btn btn-sm btn-circle btn-ghost absolute close-button">✕</button> -->
			<div class="modal-schedule-create-text">마이일정 생성하기</div>
		</div>
		<button class="btn btn-ghost close-button">✕</button>
		</form>
		<div class="modal-schedule-region">오사카</div>
		<div id="checkDateModal"></div>
<!-- 달력 CSS로 input 포커싱 색상이 바뀌지않아 태그로 직접 변경 -->
<form action="/usr/schedule/ticketing" method="get">
<input name="title" class="focus:outline-none focus:ring-1 focus:ring-green-100 focus:border-transparent schedule-title" placeholder="일정명을 입력해주세요." style="border-color: #ededed;" type="text" />
    <input name="content" class="focus:outline-none focus:ring-1 focus:ring-green-100 focus:border-transparent schedule-content" placeholder="내용을 작성해주세요." style="border-color: #ededed;" type="text" />
	<input type="hidden" id="checkInDateInput" name="checkInDate">
    <input type="hidden" id="checkOutDateInput" name="checkOutDate">
		<button class="modal-create-button">생성</button>
		</form>
</div>
</dialog>

<%@ include file="../common/foot.jspf"%>