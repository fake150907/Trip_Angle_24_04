<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value=""></c:set>
<%@ include file="../common/head.jspf"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Title</title>
<!-- 위에 제공된 스크립트 및 링크 코드 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="jquery.mousewheel.min.js"></script>
<script src="script.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Pattaya&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Nanum+Brush+Script&family=Nanum+Pen+Script&family=Pattaya&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="fullpage.css" />

<!-- 아래는 선택사항입니다. css3:false 옵션을 쓰시면서 "linear", "swing" 또는 "easeInOutCubic" 대신 다른 전환(easing) 효과를 원하시는 경우에만 필요합니다. -->
<script src="vendors/easings.min.js"></script>

<script type="text/javascript" src="fullpage.js"></script>



<style>

/* 노말라이즈 */
body, ul, li, h1 {
	margin: 0;
	padding: 0;
	list-style: none;
}

header {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
	background-color: white; /* 투명한 배경색 설정 */
	opacity: 0; /* 처음에는 투명도를 0으로 설정하여 숨김 */
	transition: opacity 0.5s ease; /* 투명도 변화에 애니메이션 적용 */
}

.fullscreen-video {
	width: 100%;
	height: 970px;
	object-fit: cover;
	display: none;
	margin-bottom: 100px;
	border: none !important;
}

.fullscreen-video.active {
	display: block;
}

.video-container {
	position: relative;
	width: 100%; /* 이 부분을 추가하여 가로 길이를 화면의 100%로 설정합니다. */
}

/* 반응형 비디오 크기 조정 */
@media ( max-width : 991px) {
	.fullscreen-video {
		height: 910px; /* 화면 크기가 991px 이하일 때 비디오의 높이를 줄입니다. */
	}
}

.wavy-tripangle {
	z-index: 999;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-family: "Pattaya", sans-serif;
	color: white;
	text-decoration: none;
}

.wavy-tripangle span {
	position: relative;
	display: inline-block;
	font-size: 100px;
	font-family: "Pattaya", sans-serif;
	color: #fff;
	animation: waviy 3s infinite;
	animation-delay: calc(0.1s * var(--i));
}

/* 반응형 텍스트 크기 조정 */
@media ( max-width : 991px) {
	.wavy-tripangle span {
		font-size: 35px; /* 화면 크기가 991px 이하일 때 텍스트 크기를 줄입니다. */
	}
}

/* ///////////  여기서부터 건드리지마요 ////////////*/

/* ///////////  로고 통통튀는 애니메이션 효과 CSS ////////////*/

/* @keyframes waviy { */
/*   0%, 40%, 100% { */
/*     transform: translateY(0); */
/*   } */
/*   20% { */
/*     transform: translateY(-20px); */
/*   } */
/* } */
@keyframes waviy { 
0%, 40%, 100% {
	transform: translateY(0);
}

20%
{
transform: translateY(-20px);
}
}

/* ///////////  여기까지 건드리지마요 ////////////*/
.scroll-down-sign1 {
	position: absolute;
	top: 79%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 30px;
	font-family: "Nanum Brush Script", cursive;
	color: white;
	z-index: 999;
}

.scroll-down-sign2 {
	position: absolute;
	top: 83%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 30px;
	font-family: "Nanum Brush Script", cursive;
	color: white;
	z-index: 999;
}

@media ( max-width : 991px) {
	.scroll-down-sign2, .scroll-down-sign1 {
		font-size: 20px; /* 화면 크기가 991px 이하일 때 텍스트 크기를 줄입니다. */
	}
}

.text {
	position: absolute;
	top: 38%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 40px;
	font-family: "Nanum Brush Script", cursive;
	color: white;
	z-index: 999;
}

/* 반응형 텍스트 크기 조정 */
@media ( max-width : 991px) {
	.text {
		font-size: 20px; /* 화면 크기가 991px 이하일 때 텍스트 크기를 줄입니다. */
		margin-top: 65px;
	}
}

/* 아래부분 */
.section {
	display: flex;
	justify-content: center;
}

/* top-area */
.div-top {
	border-radius: 10px;
	border: none;
	position: relative;
	width: 100%; /* 이 부분을 추가하여 가로 길이를 화면의 100%로 설정합니다. */
	align-items: center;
	padding: 80px 60px;
	max-width: 1280px;
	margin: auto; /* 수평 가운데 정렬합니다. */
	background-image:
		url("https://velog.velcdn.com/images/yunlinit/post/7233e023-f724-4182-916b-1c7c373e4b3a/image.png");
	background-size: cover; /* 배경 이미지를 요소에 맞게 채우기 */
	margin-bottom: 100px;
}

.div-top::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.35); /* 검정색과 투명도 조절 */
	border-radius: 10px;
}

.div-top>* {
	position: relative;
	/* 배경 이미지 위에 있는 모든 요소들의 위치를 상대적으로 설정하여 불투명 필터 위에 겹쳐지도록. */
	z-index: 2; /* 배경 이미지 위에 표시되도록 설정. */
}

@media ( max-width : 991px) {
	.div-top {
		max-width: 100%;
		padding: 0 20px;
	}
}

.comment-and-search-box {
	display: flex; /* Flexbox 사용 */
	justify-content: space-between; /* 요소들을 좌우로 분배 */
	align-items: center; /* 요소들을 세로로 가운데 정렬 */
	gap: 20px; /* 요소 사이의 간격 설정 */
	max-width: 1200px;
	margin: 151px auto 111px; /* 위 아래 여백 설정 */
}

.comment-box {
	gap: 20px;
	display: flex;
	width: 550px;
}

@media ( max-width : 991px) {
	.comment-box {
		flex-direction: column;
		align-items: stretch;
		gap: 0px;
	}
}

.comment {
	color: #fff;
	font: 600 43px/70px Pretendard, sans-serif;
}

@media ( max-width : 991px) {
	.comment {
		position: absolute;
		max-width: 100%;
		font-size: 20px;
		line-height: 1.5;
		width: 100%; /* 너비를 100%로 설정하여 가로로 채웁니다. */
		margin-top: -65px;
		margin-left: 20px;
		margin-right: 30px;
	}
}

.search-area {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 39%;
	margin-right: 85px;
}

/* 미디어 쿼리를 사용하여 화면 크기가 작을 때 가운데 정렬 */
@media ( max-width : 991px) {
	.search-area {
		width: 100%; /* 너비를 100%로 설정하여 가로로 채웁니다. */
		display: flex;
		justify-content: center; /* 수평 가운데 정렬 */
	}
}

@media ( max-width : 991px , min-width : 200px) {
	.column-2 {
		width: 100%;
	}
}

.search-box {
	justify-content: flex-end;
	border-radius: 50px;
	background-color: white;
	display: flex;
	gap: 20px;
	align-self: stretch;
	font-size: 16px;
	color: #3b3d40;
	font-weight: 600;
	width: 100%;
	margin: auto 0;
	padding: 12px 38px;
}

@media ( max-width : 991px) {
	.search-box {
		margin-top: 40px;
		padding: 0 20px;
		display: flex;
		justify-content: center; /* 가로 가운데 정렬 */
		align-items: center; /* 세로 가운데 정렬 */
	}
}

.search-input {
	font-family: Pretendard, sans-serif;
	font-size: 16px;
	flex-grow: 1;
	flex-basis: auto;
	margin: auto 0;
}

.search-input:focus {
	outline: none; /* 포커스 효과 제거 */
}

@media ( max-width : 991px) {
	.search-input {
		font-size: 9px;
	}
}

.search-btn {
	aspect-ratio: 1;
	object-fit: auto;
	object-position: center;
	width: 24px;
}

/* /////////////////////////// bottom-area */
.div-bottom {
	position: relative;
	width: 100%; /* 이 부분을 추가하여 가로 길이를 화면의 100%로 설정합니다. */
	justify-content: center;
	align-items: start;
	background-color: #fff;
	display: flex;
	flex-direction: column;
	padding: 32px 80px 80px;
	max-width: 1280px;
	margin: auto;
	margin-top: 190px;
	margin-bottom: 90px;
}

@media ( max-width : 991px) {
	.div-bottom {
		padding: 0 20px;
	}
}

.about-trip-angle {
	color: #81c8a2;
	font: 400 24px/28px Pretendard, sans-serif;
}

@media ( max-width : 991px) {
	.about-trip-angle {
		
	}
}

.mint-line1 {
	border-color: rgba(213, 241, 226, 1);
	border-style: solid;
	border-bottom-width: 3px;
	width: 224px;
	height: 2px;
	margin-top: 7px;
}

.trip-style-music-section {
	align-self: stretch;
	margin-top: 14px;
}

@media ( max-width : 991px) {
	.trip-style-music-section {
		max-width: 100%;
	}
}

.div-5 {
	gap: 20px;
	display: flex;
}

@media ( max-width : 991px) {
	.div-5 {
		flex-direction: column;
		align-items: stretch;
		gap: 0px;
	}
}

.trip-box {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 35%;
	height: 550px;
	margin-left: 0px;
}

@media ( max-width : 991px) {
	.trip-box {
		width: 100%;
		align-self: center;
	}
}

.trip-box-img {
	disply: flex;
	flex-direction: column;
	overflow: hidden;
	position: relative;
	display: flex;
	aspect-ratio: 0.83;
	flex-grow: 1;
	color: #fff;
	padding: 80px 14px 40px;
	background-image:
		url("https://velog.velcdn.com/images/yunlinit/post/995800fa-cbf0-4dfd-9b9d-846e9bb31b56/image.png");
	background-size: cover; /* 배경 이미지를 요소에 맞게 채우기 */
	border-radius: 10px;
}

@media ( max-width : 991px) {
	.trip-box-img {
		margin-top: 40px;
	}
}

.trip-title {
	position: relative;
	letter-spacing: -0.8px;
	margin-top: 300px;
	font: 400 40px/96% Pattaya, sans-serif;
}

.trip-comment {
	position: relative;
	margin-top: 9px;
	font: 400 16px/26px Pretendard, sans-serif;
}

.style-box {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 35%;
	margin-left: 30px;
}

@media ( max-width : 991px) {
	.style-box {
		width: 100%;
		margin-right: 20px; /* 요소들 사이의 간격을 지정합니다. */
		align-self: center; /* 가운데 정렬 */
	}
}

.style-box-img {
	disply: flex;
	flex-direction: column;
	overflow: hidden;
	position: relative;
	display: flex;
	aspect-ratio: 0.83;
	flex-grow: 1;
	color: #fff;
	padding: 80px 14px 38px;
	background-image:
		url("https://velog.velcdn.com/images/yunlinit/post/d9b5ca6f-79fa-4b55-9cb7-b66d6a2bdea4/image.png");
	background-size: cover; /* 배경 이미지를 요소에 맞게 채우기 */
	border-radius: 10px;
}

@media ( max-width : 991px) {
	.style-box-img {
		margin-top: 40px;
		padding-right: 20px;
	}
}

.style-title {
	position: relative;
	letter-spacing: -0.8px;
	margin-top: 300px;
	font: 400 40px/96% Pattaya, sans-serif;
}

.style-comment {
	position: relative;
	margin-top: 9px;
	font: 400 16px/26px Pretendard, sans-serif;
}

.music-box {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 35%;
	margin-left: 30px;
}

@media ( max-width : 991px) {
	.music-box {
		width: 100%;
		margin-right: 20px; /* 요소들 사이의 간격을 지정합니다. */
		align-self: center; /* 가운데 정렬 */
	}
}

.music-box-img {
	disply: flex;
	flex-direction: column;
	overflow: hidden;
	position: relative;
	display: flex;
	aspect-ratio: 0.83;
	flex-grow: 1;
	color: #fff;
	padding: 80px 14px 40px;
	background-image:
		url("https://velog.velcdn.com/images/yunlinit/post/7741f6b1-9c7d-40e2-b8b9-c6398de90082/image.png");
	background-size: cover; /* 배경 이미지를 요소에 맞게 채우기 */
	border-radius: 10px;
}

@media ( max-width : 991px) {
	.music-box-img {
		margin-top: 40px;
	}
}

.music-title {
	position: relative;
	letter-spacing: -0.8px;
	margin-top: 300px;
	font: 400 40px/96% Pattaya, sans-serif;
}

.music-comment {
	position: relative;
	margin-top: 19px;
	font: 400 16px/26px Pretendard, sans-serif;
}



/* CONTACT US  */


.contactus {
  background-color: #fff;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  padding: 13px 80px 75px;
  margin-bottom: 100px;
}
@media (max-width: 991px) {
  .contactus {
    padding: 0 20px;
  }
}

.title {
  color: #3b3d40;
  margin-top: 75px;
  font: 400 60px/35% Suranna, sans-serif;
}
@media (max-width: 991px) {
  .title {
    margin-top: 40px;
    font-size: 40px;
  }
}
.message {
  color: #3b3d40;
  margin-top: 32px;
  font: italic 300 20px/28px Urbanist, -apple-system, Roboto, Helvetica,
    sans-serif;
}
@media (max-width: 991px) {
  .message {
    max-width: 100%;
    font-size: 12px;
  }
}

.container {
  perspective: 1000px; /* 시점 설정 */
  margin-top: 50px;
}


* {
  box-sizing: border-box;
}

.flip {
  position: relative;
}
.flip > .front,
.flip > .back {
  display: block;
  transition-timing-function: cubic-bezier(.175, .885, .32, 1.275);
  transition-duration: 1s;
  transition-property: transform, opacity;
}
.flip > .front {
  transform: rotateY(0deg);
}
.flip > .back {
  position: absolute;
  opacity: 0;
  top: 0px;
  width: 100%;
  height: 100%;
  transform: rotateY(-180deg);
}
.flip:hover > .front {
  transform: rotateY(180deg);
}
.flip:hover > .back {
  opacity: 1;
  transform: rotateY(0deg);
}

/* custom */
.flip {
  display: inline-block;
  margin-right: 5px;
  margin-bottom: 1em;
  width: 235px;
  
}
.flip > .front {
  display: block;
  color: white;
  width: inherit;
  background-size: cover!important;
  background-position: center!important;
  height: 350px;
  padding: 5em 2em;
  background: white;
  border-radius: 10px;

}

.flip > .back {
  font-family: Urbanist;
  display: block;
  color: #696969;
  width: inherit;
  background-size: cover!important;
  background-position: center!important;
  height: 350px;
  padding: 5em 2em;
  background: white;
  border-radius: 10px;
  border: solid #ededed 1px;

}

.korean-name {
  font-weight: 500;
  font-size: 25px;
}

.name {
  font-size: 20px;
  margin-top: 95%;
  font-family: Urbanist;
  font-weight: 500px;
  
}

.name{
  text-shadow: 1px 1px rgba(0, 0, 0, 0.04), 2px 2px rgba(0, 0, 0, 0.04), 3px 3px rgba(0, 0, 0, 0.04), 4px 4px rgba(0, 0, 0, 0.04), 0.125rem 0.125rem rgba(0, 0, 0, 0.04), 6px 6px rgba(0, 0, 0, 0.04), 7px 7px rgba(0, 0, 0, 0.04), 8px 8px rgba(0, 0, 0, 0.04), 9px 9px rgba(0, 0, 0, 0.04), 0.3125rem 0.3125rem rgba(0, 0, 0, 0.04), 11px 11px rgba(0, 0, 0, 0.04), 12px 12px rgba(0, 0, 0, 0.04), 13px 13px rgba(0, 0, 0, 0.04), 14px 14px rgba(0, 0, 0, 0.04), 0.625rem 0.625rem rgba(0, 0, 0, 0.04), 16px 16px rgba(0, 0, 0, 0.04), 17px 17px rgba(0, 0, 0, 0.04), 18px 18px rgba(0, 0, 0, 0.04), 19px 19px rgba(0, 0, 0, 0.04), 1.25rem 1.25rem rgba(0, 0, 0, 0.04);
}


.mint-line {
  display: block;
  height: 3px;
  width: 90px;
  background-color: #d5f1e2;
  margin-left: 23.5%;
}

.button {
	background-color: #d5f1e2;
}

.button:hover {
	background-color: #ededed;
	border: solid #ededed;
}

</style>
<body>
	<section>

		<div id="container">
			<div class="section">
				<div class="video-container">
					<video muted autoplay loop class="fullscreen-video active">
						<source
							src="https://videos.pexels.com/video-files/5363146/5363146-hd_1920_1080_25fps.mp4">
					</video>
					<video muted autoplay loop class="fullscreen-video">
						<source
							src="https://videos.pexels.com/video-files/3015510/3015510-hd_1920_1080_24fps.mp4">
					</video>
					<video muted autoplay loop class="fullscreen-video">
						<source
							src="https://videos.pexels.com/video-files/9113144/9113144-uhd_3840_2160_30fps.mp4">
					</video>
					<video muted autoplay loop class="fullscreen-video">
						<source
							src="https://videos.pexels.com/video-files/1550080/1550080-uhd_3840_2160_30fps.mp4">
					</video>

					<div class="text">여행을 듣다, 여행을 입다</div>

					<a href="#" id="wavy-tripangle" class="wavy-tripangle"> <span
						style="--i: 1">T</span> <span style="--i: 2">r</span> <span
						style="--i: 3">i</span> <span style="--i: 4">p</span> <span
						style="--i: 5">A</span> <span style="--i: 6">n</span> <span
						style="--i: 7">g</span> <span style="--i: 8">l</span> <span
						style="--i: 9">e</span>
					</a>

					<div class="scroll-down-sign1">SCROLL DOWN</div>
					<div class="scroll-down-sign2">↓</div>

				</div>

			</div>

			<div class="section">
				<div class="div-top">
					<div class="comment-and-search-box">
						<div class="comment-box">
							<div class="comment">
								TripAngle로 나만의 여행을 <br /> 음악과 패션을 통해 감각적으로 계획해보세요
							</div>
						</div>
						<div class="search-area">
							<div class="search-box">
								<input type="text" class="search-input" style="border: none;"
									placeholder="떠나고 싶은 여행지를 알려주세요!"> <a href="/"
									class="search-btn"> <img
									src="https://cdn.builder.io/api/v1/image/assets/TEMP/9d1bcbb2b727b63e8a9b71f8ed09c2fbb0673fbc7961acc79bf133cb2367d88c?apiKey=725f06f0daeb4ab382150ea4b4cf3550&"
									alt="검색">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="section">
				<div class="div-bottom">
					<div class="about-trip-angle">
						<span style="color: rgba(66, 66, 66, 1)">About</span> <span
							style="color: rgba(105, 105, 105, 1)">Trip</span> <span
							style="color: rgba(129, 200, 162, 1)">Angle</span>
					</div>
					<div class="mint-line1"></div>
					<div class="trip-style-music-section">
						<div class="div-5">
							<div class="trip-box">
								<div class="trip-box-img">
									<div class="div-7 trip-title">Trip</div>
									<div class="div-8 trip-comment">감각적인 여행을 위해 여행지의 기온과 분위기를
										고려하여 맞춤형 스타일링과 특별한 음악을 제공합니다.</div>
								</div>
							</div>
							<div class="style-box">
								<div class="style-box-img">
									<div class="style-title">Style</div>
									<div class="style-comment">전 세계의 다양한 여행지에 대한 최신 날씨 정보를
										제공하고, 그에 맞는 스타일링 팁을 제시합니다.</div>
								</div>
							</div>
							<div class="music-box">
								<div class="music-box-img">
									<div class="music-title">Music</div>
									<div class="music-comment">여행을 더욱 특별하게 만들기 위해 여행지와 어울리는
										특별한 플레이리스트를 제공합니다.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="section">

				<div class="contactus">
  <div class="title">Contact Us</div>
  <div class="message">
    Thanks to the project
    <span style="
        font-weight: 500;
        font-style: italic;
        color: rgba(129, 200, 162, 1);
      ">
      TripAngle
    </span>
    , we've had the pleasure of exchanging ideas and inspirations,</br> exploring
    boundless creative avenues through collaborative efforts. </br> Below, you'll
    find additional personal information about each of our team members. </br>Feel
    free to reach out to us anytime!
  </div>


<div class="container">
  <div class="flip">
    <div class="front" style="background-image: url(https://images.unsplash.com/photo-1552960394-c81add8de6b8?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D)">
      <h1 class="name">Seo Myeong Won</h1>
    </div>
    <div class="back">
      <h2 class="korean-name">서명원</h2>
      <div class ="mint-line"></div>
      </br>
      <p>010-1234-1234</p>
      <button class="button btn btn-xs">text message</button>
      </br>
    </br>
      <p>insamjoo300@gmail.com</p>
      <button class="button btn btn-xs">send e-mail</button>


    </div>
  </div>

  <div class="flip">
    <div class="front" style="background-image: url(https://images.unsplash.com/photo-1543269664-56d93c1b41a6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D)">
      <h1 class="name">Chang Yun Lin</h1>
    </div>
    <div class="back">
      <h2 class="korean-name">장윤린</h2>
       <div class ="mint-line"></div>
     </br>
      <p>010-1234-1234</p>
      <button class="button btn btn-xs">text message</button>
      </br>
    </br>
      <p>insamjoo300@gmail.com</p>
      <button class="button btn btn-xs">send e-mail</button>
    </div>
  </div>

  <div class="flip">
    <div class="front" style="background-image: url(https://images.unsplash.com/photo-1571365689578-618663443bd7?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D)">
      <h1 class="name">Yun Ga Yeon</h1>
    </div>
    <div class="back">
      <h2 class="korean-name">윤가연</h2>
       <div class ="mint-line"></div>
      </br>
      <p>010-1234-1234</p>
      <button class="button btn btn-xs">text message</button>
      </br>
    </br>
      <p>insamjoo300@gmail.com</p>
      <button class="button btn btn-xs">send e-mail</button>
    </div>
  </div>

  <div class="flip">
    <div class="front" style="background-image: url(https://images.unsplash.com/photo-1507537297725-24a1c029d3ca?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D)">
      <h1 class="name">Shin Gyu Seob</h1>
    </div>
    <div class="back">
      <h2 class="korean-name">신규섭</h2>
       <div class ="mint-line"></div>
      </br>
      <p>010-1234-1234</p>
      <button class="button btn btn-xs">text message</button>
      </br>
    </br>
      <p>insamjoo300@gmail.com</p>
      <button class="button btn btn-xs">send e-mail</button>
    </div>
  </div>
</div>
</div>


			</div>


		</div>
	</section>



	<script>
    document.addEventListener("DOMContentLoaded", function () {
        const videos = document.querySelectorAll(".fullscreen-video");
        let currentVideoIndex = 0;

        function changeVideo() {
            videos.forEach((video, index) => {
                if (index === currentVideoIndex) {
                    video.classList.add("active");
                    video.play();
                } else {
                    video.classList.remove("active");
                    video.pause();
                }
            });

            currentVideoIndex++;
            if (currentVideoIndex >= videos.length) {
                currentVideoIndex = 0;
            }
        }

        // Change video every 3.5 seconds
        setInterval(changeVideo, 3500);
    });

    // Scroll to center function
    const link = document.querySelector("#wavy-tripangle");

    function scrollToCenter(event) {
        event.preventDefault();
        const divTop = document.querySelector(".div-top");
        const windowHeight = window.innerHeight;
        const divTopHeight = divTop.offsetHeight;
        const scrollPosition = divTop.offsetTop - (windowHeight - divTopHeight) / 2;
        window.scrollTo({
            top: scrollPosition,
            behavior: "smooth"
        });
    }

    link.addEventListener("click", scrollToCenter);

    // Scroll animation using jQuery
    $(document).ready(function () {
        var win_h = $(window).height();

        $(".section").each(function (index) {
            $(this).attr("data-index", win_h * index);
        });

        $(".section").on("mousewheel", function (e) {
            var sectionPos = parseInt($(this).attr("data-index"));
            if (e.originalEvent.wheelDelta >= 0) {
                $("html, body")
                    .stop()
                    .animate({ scrollTop: sectionPos - win_h });
                return false;
            } else if (e.originalEvent.wheelDelta < 0) {
                $("html,body")
                    .stop()
                    .animate({ scrollTop: sectionPos + win_h });
                return false;
            }
        });
    });
</script>


	<script>
	window.addEventListener('scroll', function() {
		var scroll = window.scrollY;
		var header = document.querySelector('header');

		// 스크롤이 일정 양 이상 되면 헤더를 나타나게 함
		if (scroll > 870) {
			header.style.opacity = 1;
			header.style.backgroundColor = 'white'; // 헤더의 배경색을 흰색으로 변경
		} else {
			header.style.opacity = 0;
			header.style.backgroundColor = 'transparent'; // 헤더의 배경색을 투명으로 변경
		}
	});
</script>


</body>
</html>

<%@ include file="../common/foot.jspf"%>
