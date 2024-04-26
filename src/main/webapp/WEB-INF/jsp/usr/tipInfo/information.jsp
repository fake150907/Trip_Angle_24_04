<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="HONEYTIPS PAGE"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- <iframe src="http://localhost:8081/usr/article/doIncreaseHitCountRd?id=372" frameborder="0"></iframe> -->
<script>
	$(document).ready(function() {
		$('.regDate_text').css('background-color', '#CDEAC0');
		$('.InfoLabel1').click(function() {
			$('.TipInformationPage').show();
			$('.HoneyTipsPage').hide();
		});

		$('.InfoLabel2').click(function() {
			$('.HoneyTipsPage').show();
			$('.TipInformationPage').hide();
		});
	});
</script>
<style>
.TipInformationPage {
	display: inline-block;
	display: flex;
}

@media ( max-width : 991px) {
	.TipInformationPage {
		flex-direction: column;
		align-items: stretch;
		gap: 0px;
	}
}

.Tab {
	width: 224px;
	left: 333px;
	top: 100px;
	position: absolute;
	justify-content: space-between;
	align-items: center;
	display: inline-flex;
}

.InfoLabel1, .InfoLabel2 {
	width: 215.60px;
	height: 53px;
	left: 137px;
	top: 127px;
	position: absolute;
	top: 20%;
	text-align: center;
	color: #959595;
	font-size: 19.38px;
	font-family: Inter;
	font-weight: 500;
	line-height: 28px;
	word-wrap: break-word;
}

.InfoLabel1 {
	left: -106%;
}

.InfoLabel2 {
	left: -3%;
}

.TabContent1::after, .TabContent2::after {
	width: 168.60px;
	height: 53px;
	position: absolute;
	text-align: center;
	color: #3B3D40;
	content: "";
	bottom: 0;
	left: 0;
	width: 0;
	height: 3px;
	background-color: transparent;
	transition: background-color 0.3s, width 0.3s;
}

.TabContent1, .TabContent2 {
	width: 168.60px;
	height: 53px;
	text-align: center;
	color: #3B3D40;
	font-size: 23px;
	font-family: Inter;
	font-weight: 500;
	line-height: 28px;
	word-wrap: break-word;
}

.InfoLabel1:hover>.TabContent1::after {
	width: 100%;
	background-color: #D5F1E2;
	color: black;
}

.InfoLabel1:hover>.TabContent1 {
	color: black;
}

.InfoLabel2:hover>.TabContent2::after {
	width: 100%;
	background-color: #D5F1E2;
}

.InfoLabel2:hover>.TabContent2 {
	color: black;
}

.column {
	display: flex;
	display: inline-block;
	line-height: normal;
	width: 40%;
	margin-left: 0px;
	flex-direction: column;
}

@media ( max-width : 991px) {
	.column {
		width: 100%;
	}
}

.div-2 {
	display: flex;
	flex-grow: 1;
	flex-direction: column;
	font-size: 19px;
	text-align: center;
}

@media ( max-width : 991px) {
	.div-2 {
		max-width: 100%;
		margin-top: 40px;
	}
}

.Tab {
	margin-top: 50px;
	display: flex;
}

@media ( max-width : 991px) {
	.Tab {
		max-width: 100%;
		flex-wrap: wrap;
	}
}

.OsakaImage {
	aspect-ratio: 1;
	object-fit: auto;
	border-radius: 10px;
	width: 70%; /* You can adjust the width as needed */
	margin-top: 35%;
	margin-left: auto; /* This will push it to the right */
	margin-right: 120px;
	object-position: center; /* Resetting margin-right */
}

@media ( max-width : 991px) {
	.OsakaImage {
		max-width: 100%;
	}
}

.column-2 {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 60%;
	margin-right: 160px;
	margin-bottom: 50px;
}

@media ( max-width : 991px) {
	.column-2 {
		width: 100%;
	}
}

.InfoItemContainer {
	display: flex;
	margin-top: 27%;
	flex-grow: 1;
	flex-direction: column;
	color: #000;
	font-weight: 500;
	padding: 0 20px;
}

@media ( max-width : 991px) {
	.InfoItemContainer {
		max-width: 100%;
		margin-top: 40px;
	}
}

.OsakaInfo {
	width: 100px;
	height: 20px;
	color: #34AC80;
	font-size: 23px;
	font-family: Pretendard;
	font-weight: 700;
	line-height: 28px;
	color: #34ac80;
	font-weight: bold;
	padding-right: 200px;
	margin-bottom: 20px;
}

@media ( max-width : 991px) {
	.OsakaInfo {
		max-width: 100%;
	}
}

.country-city-text {
	margin-top: 42px;
	font: 36px/78% Pretendard, sans-serif;
}

@media ( max-width : 991px) {
	.country-city-text {
		max-width: 100%;
		margin-top: 40px;
	}
}

.country-city {
	margin-top: 21px;
	font: 400 14px/28px Inter, sans-serif;
}

@media ( max-width : 991px) {
	.country-city {
		max-width: 100%;
	}
}

.climate-text {
	margin-top: 44px;
	font: 36px/78% Pretendard, sans-serif;
}

@media ( max-width : 991px) {
	.climate-text {
		max-width: 100%;
		margin-top: 40px;
	}
}

.climate {
	margin-top: 22px;
	font: 14px/28px Pretendard, sans-serif;
}

@media ( max-width : 991px) {
	.climate {
		max-width: 100%;
	}
}

.ScheduleButton {
	border-radius: 5px;
	background-color: #d5f1e2;
	align-self: end;
	margin-top: 52px;
	color: #3b3d40;
	text-align: center;
	justify-content: center;
	padding: 13px 15px;
	font: 16px Pretendard, sans-serif;
}

@media ( max-width : 991px) {
	.ScheduleButton {
		margin-top: 40px;
	}
}
</style>
<div>
	<div class="column">
		<div class="div-2">
			<div class="Tab">
				<div class="InfoLabel1">
					<span class="TabContent1">기본 정보</span>
				</div>
				<div class="InfoLabel2">
					<span class="TabContent2">꿀팁</span>
				</div>
			</div>
			<img class="OsakaImage"
				src="https://velog.velcdn.com/images/fake150907/post/1e16874d-8b4e-41ba-a863-a04ea355831b/image.jpg"
				alt="오사카 이미지">
		</div>
	</div>
	<div class="TipInformationPage">
		<div class="column-2">
			<div class="InfoItemContainer">
				<div class="OsakaInfo">OSAKA</div>
				<div class="country-city-text">일본 오사카</div>
				<div class="country-city">일본 오사카는 일본의 중부 서쪽에 위치한 도시로, 현대적인 도시와
					전통적인 일본 문화가 공존하는 곳입니다. 오사카는 맛집이 많고 음식 다양한 것으로 유명합니다. 돈키호테와 같은 대형 쇼핑
					몰과 전통 시장들이 함께 있어 쇼핑하기에 좋은 도시이기도 합니다. 또한, 오사카성, 우메다 스카이 빌딩, 도톤보리 등의
					명소가 있어 여행객들에게 인기가 많습니다. 관광 명소 뿐만 아니라, 교토나 나라 등 주변 관광지와 접근성이 좋아 일본을
					여행하는 분들에게 좋은 출발점이기도 합니다.</div>
				<div class="climate-text">기후</div>
				<div class="climate">오사카의 기후는 온습한 기후로, 여름에는 무더운 날씨가 이어지고, 겨울에는
					비교적 추운 기운이 느껴집니다. 봄과 가을은 기온이 쾌적하며 여행하기 좋은 계절로 알려져 있습니다. 비가 많이 내리는
					편이며, 특히 여름철에는 열대성 폭염이 올라오기도 합니다.</div>
				<div class="ScheduleButton">일정 만들기</div>
			</div>
		</div>
	</div>
	<div class="HoneyTipsPage">
		<div class="column-2">
			<div class="InfoItemContainer">
				<div class="OsakaInfo">OSAKA</div>
				<div class="div">
					<div class="div-2">
						<div class="column">
							<div class="div-3">
								<div class="language-text">사용 언어</div>
								<div class="language">일본어</div>
								<div class="currency-text">사용 화폐</div>
								<div class="currency">가상화폐</div>
								<div class="voltage-text">전압</div>
								<div class="voltage">피카츄 백만볼트</div>
							</div>
						</div>
						<div class="column-2">
							<div class="div-10">
								<div class="transportation-text">주요 대중교통</div>
								<div class="transportation">전용기</div>
								<div class="time-difference-text">시차</div>
								<div class="time-difference">별로안남</div>
								<div class="significant-text">특이사항</div>
								<div class="significant">일식 존맛</div>
							</div>
						</div>
						<div class="column-3">
							<div class="ScheduleButton">일정 만들기</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




<%@ include file="../common/foot.jspf"%>