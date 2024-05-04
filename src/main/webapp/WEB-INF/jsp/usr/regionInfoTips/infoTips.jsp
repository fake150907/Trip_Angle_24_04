<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="HONEYTIPS PAGE"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- <iframe src="http://localhost:8081/usr/article/doIncreaseHitCountRd?id=372" frameborder="0"></iframe> -->
<script>
	$(document).ready(function() {
		$('.HoneyTipsPage').hide();
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

	function hideHoneyTipsPage() {
		$('.HoneyTipsPage').hide();
	}

	hideHoneyTipsPage();
</script>
<style>
.informationPage {
	margin-left: 150px;
}

.TipInformationPage {
	display: inline-block;
	display: flex;
	position: absolute;
	top: 5%;
	left: 43%;
	width: 1300px;
}

.Tab {
	width: 224px;
	left: 400px;
	top: 70px;
	position: absolute;
	justify-content: space-between;
	align-items: center;
	display: inline-flex;
}

.InfoLabel1, .InfoLabel2 {
	width: 130px;
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
	width: 0;
	height: 3px;
	background-color: transparent;
	transition: background-color 0.3s, width 0.3s;
}

.TabContent1::after {
	left: 12px;
}

.TabContent2::after {
	left: 42px;
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

.Tab-container {
	display: flex;
	flex-grow: 1;
	flex-direction: column;
	font-size: 19px;
	text-align: center;
}

@media ( max-width : 991px) {
	.Tab-container {
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
	font: 400 15px/28px Inter, sans-serif;
	font-weight: 500;
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
	margin-top: 21px;
	font: 400 15px/28px Inter, sans-serif;
	font-weight: 500;
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
/* 꿀팁 창 */
.HoneyTipsPage {
	display: inline-block;
	display: flex;
	position: absolute;
	top: 5%;
	left: 43%;
	width: 1300px;
}

.HoneyTipsPageContainer {
	display: flex;
	margin-top: 27%;
	flex-grow: 1;
	flex-direction: column;
	color: #000;
	font-weight: 500;
	padding: 0 20px;
}

.InfoItem {
	color: #3B3D40;
	font-size: 20px;
	font-family: Pretendard;
	font-weight: 500;
	line-height: 28px;
	word-wrap: break-word;
}

.column-3 {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 60%;
	margin-right: 160px;
	margin-bottom: 50px;
}

.div-2 {
	display: flex;
	flex-grow: 1;
	flex-direction: column;
	font-size: 19px;
	text-align: center;
	position: relative;
	width: 900px;
	height: 450px;
	width: 900px;
}

.language-box, .currency-box, .voltage-box, .transportation-box,
	.time-difference-box, .significant-box {
	position: absolute;
	width: 170px;
}

.language-box {
	top: 10%;
}

.transportation-box, .time-difference-box, .significant-box {
	left: 30%;
}

.language-text {
	font-size: 25px;
}

.language {
	
}

.currency-box {
	top: 40%;
}

.currency-text {
	font-size: 25px;
}

.currency {
	
}

.voltage-box {
	top: 70%;
}

.voltage-text {
	font-size: 25px;
}

.voltage {
	
}

.transportation-box {
	top: 10%;
}

.transportation-text {
	font-size: 25px;
}

.transportation {
	
}

.time-difference-box {
	top: 40%;
}

.time-difference-text {
	font-size: 25px;
}

.time-difference {
	
}

.significant-box {
	top: 70%;
}

.significant-text {
	font-size: 25px;
}

.significant {
	
}

.ScheduleButton2 {
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	color: #3B3D40;
	font-size: 16px;
	font-family: Pretendard;
	font-weight: 500;
	text-decoration: none; /* Remove underline from links */
	border-radius: 5px;
	width: 100px;
	height: 40px;
	position: absolute;
	left: 65%;
	top: 80%;
	background: #D5F1E2;
	border-radius: 5px;
	background: #D5F1E2;
}
</style>
<div class="informationPage">
	<div class="column">
		<div class="Tab-container">
			<div class="Tab">
				<div class="InfoLabel1">
					<span class="TabContent1">기본 정보</span>
				</div>
				<div class="InfoLabel2">
					<span class="TabContent2">꿀팁</span>
				</div>
			</div>
			<img class="OsakaImage"
				src=${region.imageUrl}
				alt="오사카 이미지">
		</div>
	</div>
	<div class="TipInformationPage">
		<div class="column-2">
			<div class="InfoItemContainer">
			
				<div class="OsakaInfo">${region.englishName}</div>  <!-- ${countryName} 들어가야함--> 
				<div class="country-city-text">${region.extra__countryName} ${region.name}</div> <!-- ${regionName} 들어가야함--> 
				
				<div class="country-city">${RegionInfoTips.getInformation()}</div>
				<div class="climate-text">기후</div>
				<div class="climate">${RegionInfoTips.getClimate()}</div>
				<div class="ScheduleButton">일정 만들기</div>
			</div>
		</div>
	</div>
	<div class="HoneyTipsPage">
		<div class="column-3">
			<div class="HoneyTipsPageContainer">
				<div class="OsakaInfo">${region.englishName}</div>
				<div class="div-2">

					<div class="language-box">
						<div class="InfoItem language-text">사용 언어</div>
						<div class="InfoItem language">${RegionInfoTips.getLanguage()}</div>
					</div>

					<div class="currency-box">
						<div class="InfoItem currency-text">환율</div>
						<div class="InfoItem currency">${RegionInfoTips.getRate() }</div>
					</div>

					<div class="voltage-box">
						<div class="InfoItem voltage-text">전압</div>
						<div class="InfoItem voltage">${RegionInfoTips.getVoltage()}</div>
					</div>

					<div class="transportation-box">
						<div class="InfoItem transportation-text">팁</div>
						<div class="InfoItem transportation">${RegionInfoTips.getTips() }</div>
					</div>

					<div class="time-difference-box">
						<div class="InfoItem time-difference-text">시차</div>
						<div class="InfoItem time-difference">${RegionInfoTips.getTimeDifference() }</div>
					</div>

					<button class="ScheduleButton2">일정 만들기</button>

				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>