<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="마이일정 상세보기"></c:set>
<%@ include file="../common/head.jspf"%>
<meta charset="utf-8">

<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.min.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.structure.min.css"> -->


<script>
$(document).ready(function() {
    // 추가 버튼을 클릭할 때 실행되는 함수
    $('.create-button').click(function() {

			
	        my_modal_3.showModal();


    });
});

</script>
<!-- 관광,맛집,쇼핑 토글 창 -->
<script>
	$(document).ready(function() {
		$('.placeInfoList2').hide();
		$('.placeInfoList3').hide();
		$('.regDate_text').css('background-color', '#CDEAC0');
		$('.tour').addClass('recommendation-active-tab');
		$('.tour').click(function() {
			$('.placeInfoList1').show();
			$('.placeInfoList2').hide();
			$('.placeInfoList3').hide();
			$('.tour').addClass('recommendation-active-tab');
			$('.dining').removeClass('recommendation-active-tab');
			$('.shopping').removeClass('recommendation-active-tab');
		});
		$('.dining').click(function() {
			$('.placeInfoList2').show();
			$('.placeInfoList1').hide();
			$('.placeInfoList3').hide();
			$('.dining').addClass('recommendation-active-tab');
			$('.tour').removeClass('recommendation-active-tab');
			$('.shopping').removeClass('recommendation-active-tab');
		});

		$('.shopping').click(function() {
			$('.placeInfoList3').show();
			$('.placeInfoList1').hide();
			$('.placeInfoList2').hide();
			$('.shopping').addClass('recommendation-active-tab');
			$('.tour').removeClass('recommendation-active-tab');
			$('.dining').removeClass('recommendation-active-tab');
		});
		
		
		//패션리스트
		$('.ta-item-container.fashion-woman').hide();
		$('.ta-item-container.fashion-man').hide();
		$('.recommendation-tab.fashion-all').addClass('recommendation-active-tab');
		
		$('.recommendation-tab.fashion-all').click(function() {
			$('.ta-item-container.fashion-all').show();
			$('.ta-item-container.fashion-man').hide();
			$('.ta-item-container.fashion-woman').hide();
			$('.recommendation-tab.fashion-all').addClass('recommendation-active-tab');
			$('.recommendation-tab.fashion-man').removeClass('recommendation-active-tab');
			$('.recommendation-tab.fashion-woman').removeClass('recommendation-active-tab');
		});
		$('.recommendation-tab.fashion-man').click(function() {
			$('.ta-item-container.fashion-man').show();
			$('.ta-item-container.fashion-woman').hide();
			$('.ta-item-container.fashion-all').hide();
			$('.recommendation-tab.fashion-man').addClass('recommendation-active-tab');
			$('.recommendation-tab.fashion-woman').removeClass('recommendation-active-tab');
			$('.recommendation-tab.fashion-all').removeClass('recommendation-active-tab');
		});

		$('.recommendation-tab.fashion-woman').click(function() {
			$('.ta-item-container.fashion-woman').show();
			$('.ta-item-container.fashion-all').hide();
			$('.ta-item-container.fashion-man').hide();
			$('.recommendation-tab.fashion-woman').addClass('recommendation-active-tab');
			$('.recommendation-tab.fashion-all').removeClass('recommendation-active-tab');
			$('.recommendation-tab.fashion-man').removeClass('recommendation-active-tab');
		});
		
	});

</script>

<style>
.my-plan-detail {
	width: 70%;
	display: flex;
	justify-content: center;
	margin: 0 auto; /* Add this to center the container itself */
}

.detail-box {
	display: flex;
	gap: 20px;
	max-width: 100%;
	width: 100%;
}

@media ( max-width : 991px) {
	.detail-box { */
		flex-direction: column;
		align-items: stretch;
		gap: 0px;
	}
}

.column {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 70%;
	margin-left: 0px;
}

@media ( max-width : 991px) {
	.column {
		width: 100%;
	}
}

.div-2 {
	background-color: #fff;
	display: flex;
	margin-top: 92px;
	flex-grow: 1;
	flex-direction: column;
	width: 100%;
	padding: 57px 0;
}

@media ( max-width : 991px) {
	.div-2 {
		max-width: 100%;
		margin-top: 40px;
	}
}

.plan-box {
	width: 100%;
}

.my-plan-title {
	font-size: 24px;
	font-weight: 500;
	margin-bottom: 15px;
	font-weight: 600;
	color: #3b3d40;
}

.reg-date-title {
	font-size: 11px;
	margin-left: 3px;
	margin-bottom: 5px;
	color: #3b3d40;
	font-weight: 600;
}

.reg-date {
	font-size: 12px;
	margin-left: 3px;
	margin-bottom: 20px;
	color: #3b3d40;
	font-weight: 600;
}

.my-plan-content {
	font-size: 17px;
	margin-left: 3px;
	color: #3b3d40;
	font-weight: 500;
	line-height: 160%;
	width: 80%;
}

.div-3 {
	align-self: start;
	display: flex;
	margin-left: 15px;
	gap: 16px;
}

@media ( max-width : 991px) {
	.div-3 {
		margin-left: 10px;
	}
}

.div-4 {
	display: flex;
	flex-direction: column;
	color: #3b3d40;
}

.destination {
	font: 700 40px Pretendard, sans-serif;
}

.trip-date {
	margin-top: 13px;
	font: 500 20px Pretendard, sans-serif;
}

.calendar-btn {
	justify-content: center;
	border-radius: 5px;
	background-color: #d5f1e2;
	align-self: end;
	margin-top: 49px;
	color: #000;
	text-align: center;
	padding: 3px 8px;
	font-size: 14px;
	font-weight: 500;
	height: 25px;
}

@media ( max-width : 991px) {
	.div-7 {
		margin-top: 40px;
	}
}

.my-plan-img {
	aspect-ratio: 3.33;
	object-fit: cover;
	object-position: center;
	width: 80%;
	height: 400px;
	margin-top: 30px;
	border-radius: 10px;
}

@media ( max-width : 991px) {
	.my-plan-img {
		max-width: 100%;
		margin-top: 40px;
	}
}

@media ( max-width : 991px) {
	.container {
		flex-direction: column;
	}
	.div-2, .plan-box {
		width: 100%;
	}
}

.column-2 {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 30%;
	margin-left: 20px;
}

@media ( max-width : 991px) {
	.column-2 {
		width: 100%;
	}
}

.div-8 {
	display: flex;
	flex-direction: column;
	line-height: 175%;
	padding: 0 20px;
}

@media ( max-width : 991px) {
	.div-8 {
		margin-top: 4px;
	}
}

.member-title-box {
	align-self: end;
	display: flex;
	width: 269px;
	max-width: 100%;
	flex-direction: column;
	align-items: end;
}

.member-title {
	color: #3b3d40;
	text-align: right;
	align-self: stretch;
	font: 600 20px Pretendard, sans-serif;
	line-height: 160%;
}

.mint-line {
	background-color: #d5f1e2;
	margin-top: 6px;
	width: 200px;
	height: 3px;
}

.btns {
	display: flex;
	margin-top: 12px;
	gap: 15px;
	font-size: 13px;
	color: #848484;
	font-weight: 500;
	white-space: nowrap;
	text-align: center;
}

@media ( max-width : 991px) {
	.btns {
		white-space: initial;
	}
}

.modify-btn, .delete-btn {
	font-family: Pretendard, sans-serif;
	text-decoration: none !important;
	color: #a9a9a9;
}

.div-15 {
	display: flex;
	margin-top: 83px;
	gap: 20px;
	font-size: 16px;
	color: #afafaf;
	font-weight: 500;
}

@media ( max-width : 991px) {
	.div-15 {
		padding-right: 20px;
		margin-top: 40px;
	}
}

.honey-tip1 {
	display: flex;
	flex-direction: column;
	margin-top: 60px;
}

.honey-tip-title {
	color: #81c8a2;
	font: 400 24px/28px Inter, sans-serif;
}

.language-tip {
	font-family: Pretendard, sans-serif;
	margin-top: 20px;
}

.language {
	color: #3b3d40;
	margin-top: 12px;
	font: 600 20px/140% Pretendard, sans-serif;
}

.currency-tip {
	font-family: Pretendard, sans-serif;
	margin-top: 32px;
}

.currency {
	color: #3b3d40;
	margin-top: 13px;
	font: 600 20px/140% Pretendard, sans-serif;
}

.volt-tip {
	font-family: Pretendard, sans-serif;
	margin-top: 31px;
}

.volt {
	color: #3b3d40;
	margin-top: 12px;
	font: 600 20px/140% Pretendard, sans-serif;
}

.temperature-tip {
	font-family: Pretendard, sans-serif;
	margin-top: 32px;
}

.temperature {
	color: #3b3d40;
	margin-top: 12px;
	font: 600 14px/140% Pretendard, sans-serif;
}

.honey-tip2 {
	display: flex;
	margin-top: 110px;
	flex-direction: column;
}

@media ( max-width : 991px) {
	.honey-tip2 {
		margin-top: 40px;
	}
}

.transportation-tip {
	font-family: Pretendard, sans-serif;
}

.transportation {
	color: #3b3d40;
	margin-top: 12px;
	font: 600 20px/140% Pretendard, sans-serif;
}

.timedifference-tip {
	font-family: Pretendard, sans-serif;
	margin-top: 32px;
}

.timedifference {
	color: #3b3d40;
	margin-top: 13px;
	font: 600 20px/140% Pretendard, sans-serif;
}

.remark-tip {
	font-family: Pretendard, sans-serif;
	margin-top: 31px;
}

.remark {
	color: #3b3d40;
	margin-top: 12px;
	font: 600 20px/140% Pretendard, sans-serif;
}

.explanation-tip {
	color: #afafaf;
	margin-top: 32px;
	font: 500 16px Pretendard, sans-serif;
}

.explanation {
	color: #3b3d40;
	margin-top: 9px;
	font: 600 14px/17px Pretendard, sans-serif;
}

/* 날씨 섹션 */
.weather-section {
/* 	width: 70%; */
/* 	display: flex; */
/* 	justify-content: center; */
/* 	align-items: center; */
/* 	margin: 0 auto; */
/* 	height: 200px; */
/* 	margin-top: 50px; */
	
	
	display: flex;
	overflow: auto;
	gap: 30px;
	width: 80%;
	align-items: center;
	height: 200px;
	justify-content: center;
	margin: 0 auto;
	-ms-overflow-style: none;
	scroll-snap-type: x mandatory;
	padding-top: 10px;
	position: relative;
}
.weather-section::-webkit-scrollbar {
	display: none;
}
/* 추천 */
/* 옷 추천 탭 */
.recommendation-section {
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin: 0 auto;
	width: 80%;
	align-self: start;
	margin-top: 50px;
}

.recommendation-header {
	align-self: start;
	display: flex;
	gap: 20px;
	padding: 0 20px;
}

.recommendation-title {
	flex: 1;
	font: 400 24px/28px Inter, sans-serif;
}

.recommendation-accent {
	color: #81c8a2;
}

.recommendation-tabs {
	display: flex;
	gap: 14px;
	font-size: 16px;
	color: #3b3d40;
	font-weight: 600;
	line-height: 175%;
	align-items: center;
}

@media ( max-width : 991px) {
	.recommendation-tabs {
		white-space: initial;
	}
}

.recommendation-tab {
	border-bottom: solid 3px;
	border-bottom-color: white;
	transition-duration: 0.1s;
	text-decoration: none;
	cursor: pointer;
}

.recommendation-tab:hover {
	border-bottom-color: #d5f1e2;
}
.recommendation-active-tab {
	border-bottom-color: #d5f1e2;
}

.recommendation-divider {
	border-bottom: 1px solid rgba(206, 206, 206, 1);
	margin-top: 11px;
	width: 100%;
}

@media ( max-width : 991px) {
	.recommendation-divider {
		max-width: 100%;
	}
}

.ta-item-container {
	/*perspective: 1000px;*/
	display: flex;
	overflow: auto;
	gap: 30px;
	width: 80%;
	justify-content: start;
	margin: 0 auto;
	-ms-overflow-style: none;
	scroll-snap-type: x mandatory;
	padding-top: 10px;
	position: relative;
}

.ta-item-container::-webkit-scrollbar {
	display: none;
}

.ta-item-card {
	display: flex;
	flex-direction: column;
	max-width: 270px;
	border: 1px solid #ededed;
	border-radius: 8px;
	background-color: #fff;
	padding-bottom: 18px;
	font-weight: 400;
	position: relative;
	scroll-snap-align: start;
	min-width: 250px;
	text-decoration: none;
}

.ta-item-image {
/* 	width: 100%; */
	height: 270px;
	aspect-ratio: 1;
	object-fit: cover;
	object-position: center;
}

.ta-item-details {
	display: flex;
	flex-direction: column;
	margin: 36px 0 0 20px;
}

.ta-item-name {
	font: 20px;
	color: #383230;
	letter-spacing: -0.4px;
	font-weight: 500px;
}

.ta-item-info {
	font: 12px;
	color: #8c8c8c;
	margin-top: 5px;
}



.ta-item-details-info {
	display: flex;
	gap: 50px;
}

.ta-item-description {
	position: absolute;
	top: 0; /* Align top edge with the parent container */
	left: 0; /* Align left edge with the parent container */
	width: 100%; /* Match the width of the parent container */
	aspect-ratio: 1;
	height: 0px;
	/* Auto height to maintain aspect ratio, or set a fixed height */
	overflow: hidden;
	background-color: #474747; /* Solid white background */
	opacity: 60%;
	z-index: 2; /* Ensures it covers the image beneath it */
	transition-duration: 500ms;
	display: flex;
	justify-content: center;
	align-items: center;
	word-wrap: break-word;
	color: white;
	
}

.ta-item-image-container:hover .ta-item-description {
	height: 270px;
}

.play-button-container {
	background-color: #81c8a2;
	display: flex;
	gap: 30px;
	font-size: 20px;
	color: #fff;
	font-weight: 700;
	justify-content: space-between;
	height: 35px;
	align-items: center;
	padding: 0px 5px;
	cursor: pointer;
	transition-duration: 200ms;
}

@media ( max-width : 991px) {
	.play-button-container {
		white-space: initial;
	}
}

.play-button-container:hover {
	background-color: #5e9d7a;
}

.play-button-icon {
	width: 14px;
	fill: #fff;
}

.next-step-container {
	display: flex;
	flex-direction: column;
	text-align: center;
	padding: 0 20px;
}

.next-step-text {
	text-decoration: none;
	color: #383230;
	transition-duration: 200ms;
}

.next-step-text:hover {
	text-shadow: 0px -1px 1px #8c8c8c;
}

.next-step-text:active {
	color: #383230;
}

.next-step-icon {
	width: 12px;
	fill: #575757;
	align-self: start;
}

.detail-page-link {
	color: #81c8a2;
	margin-top: 9px;
	font: 400 11px Inter, sans-serif;
}

/* 옷 추천 탭 */
.bottom-buttons-section {
	display: flex;
	width: 1280px;
	justify-content: space-between;
}
/* 관광,맛집,쇼핑 탭 */
.placeInfoList1, .placeInfoList2, .placeInfoList3 {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}

.forecast-item {
	display: flex;
	flex-direction: column;
	padding-top: 3px;
	padding-bottom: 3px;
	white-space: nowrap;
	justify-items: center;
	align-items: center;
	gap: 2px;
	padding: 0px 10px;
}

.forecast-item:nth-child(even) {
	background-color: #DEDEDE;
}

@media ( max-width : 991px) {
	.forecast-item {
		white-space: initial;
	}
}

.forecast-day {
	color: #3b3d40;
 	margin: auto 0;
	font-size: 22px;
	font-weight: 500;
}

.forecast-icons {
	display: flex;
	flex-direction: column;
	align-items: center;
	font-size: 15px;
	font-weight: 0;
	color: #3b3d40;
	justify-content: baseline;
}

.forecast-temps {
	display: flex;
	align-items: center;
	justify-content: items-between;
}

@media ( max-width : 991px) {
	.forecast-temps {
		white-space: initial;
	}
}

.forecast-icon {
	object-fit: auto;
	width: 40px;
	margin-bottom: -10px;
}

.forecast-low {
	margin-top: 12px;
	color: #1279C2;
	font-size: 22px;
	font-weight: 500;
	display: block;
	width: 40px;
}

.forecast-high {
	margin-top: 12px;
	color: #DC2B89;
	font-size: 22px;
	font-weight: 500;
}

.forecast-precipitation {
	color: rgb(92, 165, 204);
	font-size: 18px;
}

.forecast-item-alt {
	display: flex;
	margin-top: 15px;
	gap: 15px;
}

.forecast-temps-alt {
	display: flex;
	align-items: start;
	gap: 17px;
	font-size: 22px;
	color: #3b3d40;
	font-weight: 500;
	white-space: nowrap;
	justify-content: space-between;
	flex: 1;
}

@media ( max-width : 991px) {
	.forecast-temps-alt {
		white-space: initial;
	}
}

.forecast-day-alt {
	margin-top: 12px;
}

.forecast-icon-alt {
	object-fit: auto;
	object-position: center;
	width: 25px;
	fill: #fff;
}

.forecast-low-alt {
	margin-top: 12px;
}

.forecast-high-container-alt {
	align-self: start;
	display: flex;
	margin-top: 12px;
	gap: 7px;
	flex: 1;
}

.forecast-high-alt {
	color: #3b3d40;
}

.forecast-precipitation-alt {
	color: #81cffa;
	align-self: start;
	margin-left: 69px;
}

@media ( max-width : 991px) {
	.forecast-precipitation-alt {
		margin-left: 10px;
	}
}

</style>





<div class="wall" style="height: 120px;"></div>


<div class="my-plan-detail">
	<div class="detail-box">
		<div class="column">
			<div class="div-2">
				<div class="div-3">
					<div class="div-4">
						<div class="destination">${tripSchedule.extra__regionName}</div>
						<div class="trip-date">2024-04-15 ~ 2024-04-24</div>
					</div>

					<a class="calendar-btn" href="/usr/myPlan/myPlanCalendar">캘린더
						보기</a>
				</div>
				<img
					src="https://images.unsplash.com/photo-1551918120-9739cb430c6d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
					class="my-plan-img" />
			</div>

			<div class="plan-box">
				<div class="my-plan-title">${tripSchedule.title}</div>
				<div class="reg-date-title">나의 일정 등록일</div>
				<div class="reg-date">${tripSchedule.regDate}</div>
				<div class="my-plan-content">${tripSchedule.content}</div>

			</div>

		</div>
		<div class="column-2">
			<div class="div-8">
				<div class="member-title-box">
					<div class="member-title">
						<span
							style="font-family: Pretendard, -apple-system, Roboto, Helvetica, sans-serif; font-weight: 500; color: rgba(129, 200, 162, 1);">angler1</span>
						님의 <br> 나의 일정 상세페이지
					</div>
					<div class="mint-line"></div>
					<div class="btns">
						<a href="#" class="modify-btn create-button">수정</a> <a href="#"
							class="delete-btn">삭제</a>
					</div>
				</div>
				<div class="div-15">
					<div class="honey-tip1">
						<div class="honey-tip-title">
							<span
								style="font-family: Pretendard, -apple-system, Roboto, Helvetica, sans-serif; font-weight: 500; color: rgba(105, 105, 105, 1);">
								여행 </span> <span
								style="font-family: Pretendard, -apple-system, Roboto, Helvetica, sans-serif; font-weight: 500; color: rgba(129, 200, 162, 1);">
								꿀팁 </span>
						</div>
						<div class="language-tip">사용 언어</div>
						<div class="language">${regionInfoTips.language }</div>
						<div class="currency-tip">환율</div>
						<div class="currency">${regionInfoTips.rate }</div>
						<div class="volt-tip">전압</div>
						<div class="volt">${regionInfoTips.voltage }</div>
						<div class="temperature-tip">기후</div>
						<div class="temperature">${regionInfoTips.climate }</div>
					</div>
					<div class="honey-tip2">
						<div class="transportation-tip">팁</div>
						<div class="transportation">${regionInfoTips.tips }</div>
						<div class="timedifference-tip">시차</div>
						<div class="timedifference">${regionInfoTips.timeDifference }</div>
						<!-- 						<div class="remark-tip">설명</div> -->
						<%-- 						<div class="remark">${regionInfoTips.information }</div> --%>

					</div>
				</div>
				<div class="explanation-tip">설명</div>
				<div class="explanation">${regionInfoTips.information }</div>
			</div>
		</div>
	</div>
</div>

<div class="weather-section">
	<c:forEach var="weather" items="${weathers}">
		<div class="forecast-item">
			<time class="forecast-day">${weather.shortenDay()}</time>


			<div class="forecast-icons">
				<img src="${weather.pullIconPath() }" alt="Low temperature icon"
					class="forecast-icon" />
				<div class="forecast-precipitation">${weather.humidity}%</div>
			</div>

			<div class="forecast-temps">
				<span class="forecast-low">${weather.minTemp}°</span> <span
					class="forecast-high">${weather.maxTemp}°</span>
			</div>
		</div>



	</c:forEach>
</div>


<!-- 스타일 추천 -->
<div class="fashion-recommendation-main">
	<div class="section-container mt-100">
		<section class="recommendation-section">
			<header class="recommendation-header">
				<h2 class="recommendation-title">
					<span>날씨에 알맞는</span> <span class="recommendation-accent">옷
						추천</span>
				</h2>
				<nav class="recommendation-tabs">
					<div class="recommendation-tab fashion-all">전체</div>
					<div class="recommendation-tab fashion-woman">여성</div>
					<div class="recommendation-tab fashion-man">남성</div>
				</nav>
			</header>
			<div class="recommendation-divider"></div>
		</section>

	</div>
	<div class="section-container">

		<section class="ta-item-container fashion-all">
			<c:forEach var="fashion" items="${fashions}">
				<article class="ta-item-card">
					<div class="ta-item-image-container">
						<c:choose>
							<c:when test="${fashion.imageUrl==''}">
								<img src="/resource/image/FashionNoimage.webp"
									alt="Fashion Image" class="ta-item-image" loading="lazy">
							</c:when>

							<c:otherwise>
								<img src="${fashion.imageUrl }" alt="Fashion Image"
									class="ta-item-image" loading="lazy">
							</c:otherwise>
						</c:choose>
						<div class="ta-item-description">${fashion.description}</div>
					</div>
					<div class="ta-item-details">
						<h3 class="ta-item-name">${fashion.name}</h3>
						<div class="ta-item-details-info">
							<p class="ta-item-info">${fashion.brand}</p>
							<p class="ta-item-info">
								<c:if test="${fashion.gender==1}">
							        여성
							    </c:if>
								<c:if test="${fashion.gender==0}">
							        남성
							    </c:if>

							</p>
						</div>
					</div>
				</article>
			</c:forEach>
			<!-- 이하 article 요소들도 위와 같이 정렬 -->
		</section>
		</section>
		
		<section class="ta-item-container fashion-woman">
			<c:forEach var="fashion" items="${fashions}">
				<c:if test="${fashion.gender==1}">
					<article class="ta-item-card">
						<div class="ta-item-image-container">
						<c:choose>
							<c:when test="${fashion.imageUrl==''}">
								<img src="/resource/image/FashionNoimage.webp"
									alt="Fashion Image" class="ta-item-image" loading="lazy">
							</c:when>

							<c:otherwise>
								<img src="${fashion.imageUrl }" alt="Fashion Image"
									class="ta-item-image" loading="lazy">
							</c:otherwise>
						</c:choose>
							<div class="ta-item-description">${fashion.description}</div>
						</div>
						<div class="ta-item-details">
							<h3 class="ta-item-name">${fashion.name}</h3>
							<div class="ta-item-details-info">
								<p class="ta-item-info">${fashion.brand}</p>
								<p class="ta-item-info">여성</p>
							</div>
						</div>
					</article>
				</c:if>
			</c:forEach>
		</section>
		
		<section class="ta-item-container fashion-man">
			<c:forEach var="fashion" items="${fashions}">
				<c:if test="${fashion.gender==0}">
					<article class="ta-item-card">
						<div class="ta-item-image-container">
						<c:choose>
							<c:when test="${fashion.imageUrl==''}">
								<img src="/resource/image/FashionNoimage.webp"
									alt="Fashion Image" class="ta-item-image" loading="lazy">
							</c:when>

							<c:otherwise>
								<img src="${fashion.imageUrl }" alt="Fashion Image"
									class="ta-item-image" loading="lazy">
							</c:otherwise>
						</c:choose>
							<div class="ta-item-description">${fashion.description}</div>
						</div>
						<div class="ta-item-details">
							<h3 class="ta-item-name">${fashion.name}</h3>
							<div class="ta-item-details-info">
								<p class="ta-item-info">${fashion.brand}</p>
								<p class="ta-item-info">남성</p>
							</div>
						</div>
					</article>
				</c:if>
			</c:forEach>
		</section>

	</div>
</div>
<div class="section-container ">
	<section class="recommendation-section ">
		<header class="recommendation-header">
			<h2 class="recommendation-title">
				<span>쇼핑 추천 </span>
				<span class="recommendation-accent">리스트</span>
			</h2>
		</header>
		<div class="recommendation-divider"></div>
	</section>

</div>

<div class="section-container">
		<section class="ta-item-container shopping-list">
		<c:forEach var="shoppingList" items="${shoppingLists}">

			<article class="ta-item-card">
                    <div class="ta-item-image-container">
                    						<c:choose>
							<c:when test="${shoppingList.imageUrl==''}">
								<img src="/resource/image/ShoppingListNoimage.webp"
									alt="Fashion Image" class="ta-item-image" loading="lazy">
							</c:when>

							<c:otherwise>
								<img src="${shoppingList.imageUrl }" alt="Fashion Image"
									class="ta-item-image" loading="lazy">
							</c:otherwise>
						</c:choose>
                        <div class="ta-item-description">${shoppingList.description }</div>
                    </div>

                    <div class="ta-item-details">
                        
                    <h3 class="ta-item-name">${shoppingList.name }</h3>

                    </div>
                </article>
</c:forEach>



		</section>
</div>

<div class="section-container">

<!-- 장소 추천 -->
<div class="place-recommendation-main">
	<div class="section-container">
		<section class="recommendation-section">
			<header class="recommendation-header">
				<h2 class="recommendation-title">
					<span>장소 </span> <span class="recommendation-accent">추천</span>
				</h2>
				<div class="recommendation-tabs">
					<span class="recommendation-tab tour">관광</span> <span
						class="recommendation-tab dining">맛집</span> <span
						class="recommendation-tab shopping">쇼핑</span>
				</div>
			</header>
			<div class="recommendation-divider"></div>
		</section>
	</div>
</div>


<div class="section-container">

	<div class="placeInfoList1">
		<section class="ta-item-container">
			<c:forEach var="place" items="${placeInfoList1}">
				<a href="/usr/myPlan/placeDetail?id=${place.id}"
					class="ta-item-card"> <span class="ta-item-image-container">
						<img src="${place.imageUrl1 }" alt="Fashion Image"
						class="ta-item-image" /> <span class="ta-item-description">
							Click </span>
				</span> <span class="ta-item-details"> <span class="ta-item-name">${place.name }</span>
						<span class="ta-item-details-info"> <span
							class="ta-item-info">${place.address }</span>
					</span>
				</span>
				</a>
			</c:forEach>
		</section>
	</div>
	<div class="placeInfoList2">
		<section class="ta-item-container">
			<c:forEach var="place" items="${placeInfoList2}">
				<a href="/usr/myPlan/placeDetail?id=${place.id}"
					class="ta-item-card"> <span class="ta-item-image-container">
						<img src="${place.imageUrl1 }" alt="Fashion Image"
						class="ta-item-image" /> <span class="ta-item-description">
							Click </span>
				</span> <span class="ta-item-details"> <span class="ta-item-name">${place.name }</span>
						<span class="ta-item-details-info"> <span
							class="ta-item-info">${place.address }</span>
					</span>
				</span>
				</a>
			</c:forEach>
		</section>
	</div>
	<div class="placeInfoList3">
		<section class="ta-item-container">
			<c:forEach var="place" items="${placeInfoList3}">
				<a href="/usr/myPlan/placeDetail?id=${place.id}"
					class="ta-item-card"> <span class="ta-item-image-container">
						<img src="${place.imageUrl1 }" alt="Fashion Image"
						class="ta-item-image" /> <span class="ta-item-description">
							Click </span>
				</span> <span class="ta-item-details"> <span class="ta-item-name">${place.name }</span>
						<span class="ta-item-details-info"> <span
							class="ta-item-info">${place.address }</span>
					</span>
				</span>
				</a>
			</c:forEach>
		</section>
	</div>

</div>





<div class="wall" style="height: 120px;"></div>

<%@ include file="../common/foot.jspf"%>