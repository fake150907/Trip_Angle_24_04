<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="TIPINFORMATION PAGE"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- <iframe src="http://localhost:8081/usr/article/doIncreaseHitCountRd?id=372" frameborder="0"></iframe> -->
<style>
.TipInformationPage {
	width: 1440px;
	height: 729px;
	position: relative;
	background: white;
}

.InfoItemContainer {
	position: relative;
	width: 800px;
	height: 400px;
	left: 46%;
	top: 38%;
}

.InfoItem {
	color: #3B3D40;
	font-size: 20px;
	font-family: Pretendard;
	font-weight: 500;
	line-height: 28px;
	word-wrap: break-word;
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
	left: 50%;
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

.Tab {
	width: 224px;
	left: 333px;
	top: 100px;
	position: absolute;
	justify-content: center;
	align-items: center;
	display: inline-flex;
}

.InfoLabel1, .InfoLabel2 {
	width: 168.60px;
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
	left: -80%;
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

.OsakaImage {
	width: 480px;
	height: 480px;
	left: 109px;
	top: 202px;
	position: absolute;
	border-radius: 10px;
}

.OsakaInfo {
	width: 100px;
	height: 20px;
	left: 672px;
	top: 243px;
	position: absolute;
	color: #34AC80;
	font-size: 23px;
	font-family: Pretendard;
	font-weight: 700;
	line-height: 28px;
	word-wrap: break-word;
}

.Desktop2 {
	width: 1280px;
	height: 100px;
	left: 80px;
	top: 0px;
	position: absolute;
	background: white;
}

.Angle {
	width: 88px;
	height: 27px;
	left: 74px;
	top: 31px;
	position: absolute;
	color: #81C8A2;
	font-size: 32px;
	font-family: Pattaya;
	font-weight: 400;
	line-height: 27px;
	word-wrap: break-word;
}

.Trip {
	width: 114px;
	height: 27px;
	left: 29px;
	top: 30px;
	position: absolute;
	color: #696969;
	font-size: 32px;
	font-family: Pattaya;
	font-weight: 400;
	line-height: 27px;
	word-wrap: break-word;
}

.TravelTogether {
	width: 165px;
	height: 15px;
	left: 70%;
	top: 38px;
	position: absolute;
	text-align: center;
	color: #9D9D9D;
	font-size: 13px;
	font-family: Pretendard;
	font-weight: 600;
	line-height: 15px;
	word-wrap: break-word;
}

.JoinBtn {
	width: 75px;
	height: 30px;
	padding-top: 7.50px;
	padding-bottom: 7.50px;
	padding-left: 19.84px;
	padding-right: 19.80px;
	left: 1119px;
	top: 29px;
	position: absolute;
	background: #D5F1E2;
	border-radius: 4px;
	justify-content: center;
	align-items: center;
	display: inline-flex;
}

.LinkLogin {
	width: 35.36px;
	height: 15px;
	text-align: center;
	color: #3B3D40;
	font-size: 13.56px;
	font-family: Pretendard;
	font-weight: 500;
	line-height: 15px;
	word-wrap: break-word;
}

.LoginBtn {
	width: 35px;
	height: 15px;
	left: 1209px;
	top: 35px;
	position: absolute;
	text-align: center;
	color: #515458;
	font-size: 13.56px;
	font-family: Pretendard;
	font-weight: 500;
	line-height: 15px;
	word-wrap: break-word;
}

.HeaderDivider {
	width: 1246px;
	height: 2px;
	left: 17px;
	top: 69px;
	position: absolute;
	border-bottom: 1px #CECECE solid;
}

.Rectangle1 {
	width: 100px;
	height: 40px;
	left: 1189px;
	top: 600px;
	position: absolute;
	background: #D5F1E2;
	border-radius: 5px;
}

.ScheduleButton {
	width: 100%;
	height: 100%;
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
}
</style>
<div class="TipInformationPage">
	<div class="Tab">
		<div class="InfoLabel1">
			<span class="TabContent1">기본 정보</span>
		</div>
		<div class="InfoLabel2">
			<span class="TabContent2">꿀팁</span>
		</div>
	</div>
	<img class="OsakaImage"
		src="https://velog.velcdn.com/images/fake150907/post/1e16874d-8b4e-41ba-a863-a04ea355831b/image.jpg" alt="오사카 이미지">
	<div class="Tab"></div>
	<div class="OsakaInfo">OSAKA</div>
	<div class="Desktop2">
		<div class="Trip">Trip</div>
		<div class="Angle">Angle</div>
		<div class="TravelTogether">저희와 함께 여행을 떠나요!</div>
		<div class="JoinBtn">Join</div>
		<div class="LoginBtn">Login</div>
		<div class="HeaderDivider"></div>
	</div>
	<div class="InfoItemContainer">
		<div class="language-box">
			<div class="InfoItem language-text">사용 언어</div>
			<div class="InfoItem language">${language }</div>
		</div>
		<div class="currency-box">
			<div class="InfoItem currency-text">환율</div>
			<div class="InfoItem currency">${rate }</div>
		</div>
		<div class="voltage-box">
			<div class="InfoItem voltage-text">전압</div>
			<div class="InfoItem voltage">${Voltage }</div>
		</div>
		<div class="transportation-box">
			<div class="InfoItem transportation-text">팁</div>
			<div class="InfoItem transportation">${tips }</div>
		</div>
		<div class="time-difference-box">
			<div class="InfoItem time-difference-text">시차</div>
			<div class="InfoItem time-difference">${TimeDifference }</div>
		</div>
	</div>
	<div class="Rectangle1">
		<a href="schedule.jsp" class="ScheduleButton">일정 만들기</a>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>