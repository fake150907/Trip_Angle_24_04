<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="TripAngle | 메인"></c:set>
<%@ include file="../common/head.jspf"%>


<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- <script src="jquery.mousewheel.min.js"></script> -->
<!-- <script src="script.js"></script> -->

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Pattaya&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Nanum+Brush+Script&family=Nanum+Pen+Script&family=Pattaya&display=swap"
	rel="stylesheet">

<style>

/* 노말라이즈 */
body, ul, li, h1 {
	margin: 0;
	padding: 0;
	list-style: none;
}

/* 헤더 */
header {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
	background-color: white; /* 투명한 배경색 설정 */
	opacity: 0; /* 처음에는 투명도를 0으로 설정하여 숨김 */
	transition: opacity 0.5s ease; /* 투명도 변화에 애니메이션 적용 */
}

/* 메인 동영상 */
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

/* TripAngle 대문 로고 */

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

/* ///////////  여기서부터 건드리지마세요 ////////////*/

/* 로고 통통튀는 애니메이션 효과 CSS */

/* @keyframes waviy { */
/*   0%, 40%, 100% { a*/
/*     transform: translateY(0); */
/*   } */
/*   20% { */
/*     transform: translateY(-20px); */
/*   } */
/* } */

/* 자동들여쓰기로 코드 변형 시 위의 주석코드를 복사붙여넣기해주세요 */
 @keyframes waviy { 
   0%, 40%, 100% { a
     transform: translateY(0); 
   } 
   20% { 
     transform: translateY(-20px); 
   } 
 } 

/* ///////////  여기까지 건드리지마세요 ////////////*/

/* 스크롤 내리기 표시 "SCROLL DOWN" */
croll-down-sign1 {
	position: absolute;
	top: 79%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 30px;
	font-family: "Nanum Brush Script", cursive;
	color: white;
	z-index: 999;
}

/* 스크롤 내리기 표시 "↓" */
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

/* 화면 크기가 991px 이하일 때 스크롤 관련 텍스트 크기를 줄입니다 */
@media ( max-width : 991px) {
	.scroll-down-sign2, .scroll-down-sign1 {
		font-size: 20px; 
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

/* 메인화면 - 검색창 섹션 */
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
	margin-bottom: 50px;
	margin-top: 50px;
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

.search-area {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 39%;
	margin-right: 85px;
	position: relative;
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

.search-list {
	/*   display: flex; */
	flex-direction: column;
	align-self: stretch;
	font-size: 16px;
	font-weight: 600;
	width: 91%;
	position: absolute;
	top: 120%;
	left: 4.7%;
	max-height: 230px;
	overflow-y: scroll;
	overflow-x: hidden;

	/*    background-color: #fff;  */

	/*   -ms-overflow-style: none; */
	/*   scrollbar-width: none; */
}

@media ( max-width : 991px) {
	.search-box {
		margin-top: 40px;
		display: flex;
		justify-content: center; /* 가로 가운데 정렬 */
		align-items: center; /* 세로 가운데 정렬 */
	}
}

/* 스크롤바 전체 */
.search-list::-webkit-scrollbar {
	width: 20px;
}

/*  스크롤 바 */
.search-list::-webkit-scrollbar-thumb {
	background: #d5f1e2;
	border-radius: 10px;
	border: solid 1px white;
}

/* 스크롤 배경 */
.search-list::-webkit-scrollbar-track {
	/*   background: white;  */
	background-color: rgba(255, 255, 255, 0.7);
	/
	/*   background-color:transparent; */
	/*   opacity: 0.7; */
}

.search-item {
	width: 100%;
	opacity: 0.8;
	cursor: pointer;
	background-color: white;
	transition-duration: 0.5s;
}

.search-item:hover {
	background-color: #d5f1e2;
	opacity: 1;
}

.country-region-name {
	display: flex;
	height: 100%;
	flex-direction: column;
	justify-items: center;
	padding: 5px 10px;
}

.country-name {
	font-weight: 900;
}

.region-name {
	font-weight: 200;
	margin-top: -1px;
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

/* ABOUT TRIPANGLE 섹션 */
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
	margin-top: 250px;
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
		url("https://velog.velcdn.com/images/yunlinit/post/c7f6de86-9665-48f8-8761-21e891ff6532/image.jpg");
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
		url("https://velog.velcdn.com/images/yunlinit/post/9a996b5c-ab8e-4528-b437-7bb7dc254480/image.jpg");
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

/* music-box -> weather로 바뀜 */
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
		url("https://velog.velcdn.com/images/yunlinit/post/83e60ced-f543-4e2e-9f44-04109e4c0fdb/image.jpg");
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

/* CONTACT US 섹션 */
.contactus {
	background-color: #fff;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
	padding: 13px 80px 75px;
	margin-top:100px;
}

@media ( max-width : 991px) {
	.contactus {
		padding: 0 20px;
	}
}

.title {
	color: #3b3d40;
	margin-top: 75px;
	font: 400 60px/35% Suranna, sans-serif;
}

@media ( max-width : 991px) {
	.title {
		margin-top: 40px;
		font-size: 40px;
	}
}

.message-container {
	position: relative;
	width: 100%;
	display: flex; /* 내부 요소를 가로로 정렬하기 위해 flex 사용 */
	justify-content: center; /* 가로로 가운데 정렬 */
	margin-top: 3%;
}

.message {
	position: absolute;
	color: #3b3d40;
	margin-top: 32px;
	font: 400 20px/28px Urbanist, Helvetica;
	transition: opacity 0.8s ease; /* 투명도에 대한 애니메이션 효과 적용 */
}

.message2 {
	position: absolute;
	color: #3b3d40;
	margin-top: 32px;
	font: 500 17px/28px Pretendard;
	transition: opacity 0.8s ease; /* 투명도에 대한 애니메이션 효과 적용 */
}

.message:hover {
	opacity: 0; /* hover하면 투명도를 0으로 설정하여 message 요소를 숨김 */
}

.message2 {
	opacity: 0; /* 초기에는 숨겨진 상태로 설정 */
	pointer-events: none; /* 초기에는 hover되지 않도록 함 */
}

.message-container:hover .message2 {
	opacity: 1;
	/* .message-container를 hover 했을 때 .message2 요소를 서서히 나타나게 함 */
	pointer-events: auto;
	/* .message-container를 hover 했을 때 hover 효과가 발생하도록 함 */
}

.message-container:hover .message {
	opacity: 0;
	/* .message-container를 hover 했을 때 .message2 요소를 서서히 나타나게 함 */
	pointer-events: auto;
	/* .message-container를 hover 했을 때 hover 효과가 발생하도록 함 */
}

@media ( max-width : 991px) {
	.message {
		max-width: 100%;
		font-size: 12px;
	}
}

@media ( max-width : 991px) {
	.message2 {
		max-width: 100%;
		font-size: 12px;
	}
}

.container {
	perspective: 1000px; /* 시점 설정 */
	margin-top: 19%;
	margin-bottom: 10%;
}

* {
	box-sizing: border-box;
}

.flip {
	position: relative;
}

.flip>.front, .flip>.back {
	display: block;
	transition-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
	transition-duration: 1s;
	transition-property: transform, opacity;
}

.flip>.front {
	transform: rotateY(0deg);
}

.flip>.back {
	position: absolute;
	opacity: 0;
	top: 0px;
	width: 100%;
	height: 100%;
	transform: rotateY(-180deg);
}

.flip:hover>.front {
	transform: rotateY(180deg);
}

.flip:hover>.back {
	opacity: 1;
	transform: rotateY(0deg);
}

.flip {
	display: inline-block;
	margin-right: 5px;
	margin-bottom: 1em;
	width: 235px;
}

.flip>.front {
	display: block;
	color: white;
	width: inherit;
	background-size: cover !important;
	background-position: center !important;
	height: 350px;
	padding: 5em 2em;
	background: white;
	border-radius: 10px;
}

.flip>.back {
	font-family: Urbanist;
	display: block;
	color: #696969;
	width: inherit;
	background-size: cover !important;
	background-position: center !important;
	height: 350px;
	padding: 5em 2em;
	background: white;
	border-radius: 10px;
	border: solid #ededed 1px;
}

.korean-name {
	font-weight: 500;
	font-size: 25px;
	color: #3b3d40;
	'
}

.name {
	font-family: 'Urbanist';
	font-size: 20px;
	margin-top: 95%;
	font-weight: 500px;
}

.mint-line {
	display: block;
	height: 3px;
	width: 90px;
	background-color: #d5f1e2;
	margin-left: 23.5%;
}

.button {
	margin-top: 50px;
	background-color: #d5f1e2;
	border: solid 1px #d5f1e2;
	/* background-color: rgba(213, 241, 226, 0.3);  */
	/* border: solid 1px rgba(213, 241, 226, 0.3); */
}

.button:hover {
	background-color: #ededed;
	border: solid 1px #ededed;
}

/* 슬라이드 단체사진 섹션 */

* {
	box-sizing: border-box;
}

body {
	font-family: Verdana, sans-serif;
}

.mySlides {
	display: none;
}

img {
	vertical-align: middle;
}



/* Slideshow container */
.slideshow-container {
	max-width: 400px;
	position: relative;
	margin: auto;
	margin-top: 100px;
	margin-bottom: 80px;
}

/* Caption text */
.caption {
  color: #fff;
  font-size: 23px;
  padding: 8px 12px;
  position: absolute;
  top: 100px;
  width: 100%;
  text-align: center;
  font-weight: 500;
}


/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}


.active {
	background-color: #717171;
}

/* Fading animation */
/* Fading animation */
.fade {
    -webkit-animation-name: fade;
    animation-name: fade;
    -webkit-animation-duration: 1.5s;
    animation-duration: 1.5s;
}


/* 단체사진 슬라이드 효과  */

/* @-webkit-keyframes fade { */
/*     from { */
/*         opacity: .4; */
/*     } */
/*     to { */
/*         opacity: 1; */
/*     } */
/* } */

/* @keyframes fade { */
/*     from { */
/*         opacity: .4; */
/*     } */
/*     to { */
/*         opacity: 1; */
/*     } */
/* } */


/* 자동들여쓰기 적용 시 코드 변형 되면 위의 주석코드 복사붙여넣기하세요  */

@-webkit-keyframes fade {
    from {
        opacity: .4;
    }
    to {
        opacity: 1;
    }
}

@keyframes fade {
    from {
        opacity: .4;
    }
    to {
        opacity: 1;
    }
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.text {
		font-size: 11px
	}
}



.img{
	border-radius: 20px;
	}
	
	
</style>

</head>

<body>
	<section>
		<div id="container">
		
<!-- 메인 동영상화면 섹션 -->
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

					<div class="text">여행의 온도를 걸치다</div>

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
<!-- 메인 검색창 섹션 -->
			<div class="section">
				<div class="div-top ">
					<div class="comment-and-search-box">
						<div class="comment-box">
							<div class="comment">
								TripAngle로 나만의 여행을 <br /> 여행지의 날씨에 맞게 스타일링하여 감각적으로 계획해보세요
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



							<div class="search-list flex">


							</div>


						</div>
					</div>
				</div>
			</div>
			
<!-- ABOUT TRIPANGLE 섹션 -->
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
										고려하여 맞춤형 여행 일정을 제공합니다.</div>
								</div>
							</div>
							<div class="style-box">
								<div class="style-box-img">
									<div class="style-title">Style</div>
									<div class="style-comment">전 세계의 다양한 여행지의 기온에 맞는 스타일링 팁을
										제시합니다.</div>
								</div>
							</div>
							<div class="music-box">
								<div class="music-box-img">
									<div class="music-title">Weather</div>
									<div class="music-comment">여행을 더욱 특별하게 만들기 위해 여행 날짜 별 기온과
										날씨 정보를 제공합니다.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
<!-- CONTACT US 섹션 -->
			<div class="section">
				<div class="contactus">
					<div class="title">Contact Us</div>
					<div class="message-container">
						<div class="message">
							Thanks to the project <span
								style="font-weight: 500; font-style: italic; color: rgba(129, 200, 162, 1);">
								TripAngle</span> , we've had the pleasure of exchanging ideas and
							inspirations, <br> and exploring boundless creative avenues
							through collaborative efforts. <br> Below, you'll find
							additional personal information about each of our team members. <br>
							Feel free to reach out to us anytime!
						</div>

						<div class="message2">
							<span
								style="font-weight: 500; font-style: italic; color: rgba(129, 200, 162, 1);">
								TripAngle </span> 프로젝트를 통해 우리는 다양한 아이디어와 영감을 공유하고, <br> 협력을 통해
							개개인의 무한한 창의적 가능성을 발견할 수 있었습니다. <br> 아래에서 이 프로젝트를 함께한 팀원을
							확인하실 수 있으니 <br> 언제든지 연락 주시길 바랍니다!
						</div>

					</div>

					<div class="container">
						<div class="flip">
							<div class="front"
								style="background-image: url(https://velog.velcdn.com/images/yunlinit/post/03484ed2-c09c-415c-b78c-bd098012aa8b/image.jpg)">
								<h1 class="name">Seo Myeong Won</h1>
							</div>
							<div class="back">
								<h2 class="korean-name">서명원</h2>
								<div class="mint-line"></div>
								<br>
								<p>010-4495-8592</p>
								<!--           <p>010-4495-8592</p> -->
								<!--           <button class="button btn btn-sm"> text message</button> -->
								<!--           <br> -->
								<br>
								<p>insamjoo300@gmail.com</p>
								<button class="button btn btn-sm"
									onclick="writeEmailToMyeongwon()">send e-mail</button>

							</div>
						</div>

						<div class="flip">
							<div class="front"
								style="background-image: url(https://velog.velcdn.com/images/yunlinit/post/1260ec4b-492c-41dc-9606-d9f2a8e4ca95/image.jpg)">
								<h1 class="name">Chang Yun Lin</h1>
							</div>
							<div class="back">
								<h2 class="korean-name">장윤린</h2>
								<div class="mint-line"></div>
								<br>
								<p>010-4249-0977</p>
								<!--           <p>010-4249-0977</p> -->
								<!--           <button class="button btn btn-sm">text message</button> -->
								<!--           <br> -->
								<br>
								<p>yunlinit@gmail.com</p>
								<button class="button btn btn-sm" onclick="writeEmailToYunlin()">send
									e-mail</button>
							</div>
						</div>


						<div class="flip">
							<div class="front"
								style="background-image: url(https://velog.velcdn.com/images/yunlinit/post/1ee12c41-2fee-4f8c-991d-0f05538a93df/image.jpg)">
								<h1 class="name">Yun Ga Yeon</h1>
							</div>
							<div class="back">
								<h2 class="korean-name">윤가연</h2>
								<div class="mint-line"></div>
								<br>
								<p>010-5408-4893</p>
								<!--           <p>010-5408-4893</p> -->
								<!--           <button class="button btn btn-sm">text message</button> -->
								<!--           <br> -->
								<br>
								<p>yungayeon223gmail.com</p>
								<button class="button btn btn-sm" onclick="writeEmailToGayeon()">send
									e-mail</button>
							</div>
						</div>

						<div class="flip">
							<div class="front"
								style="background-image: url(https://velog.velcdn.com/images/yunlinit/post/e11db386-253c-4de1-94cd-908cd7c5ab74/image.jpg)">
								<h1 class="name">Shin Gyu Sub</h1>
							</div>
							<div class="back">
								<h2 class="korean-name">신규섭</h2>
								<div class="mint-line"></div>
								<br>
								<p>010-7752-8687</p>
								<!--           <p>010-7752-8687</p> -->
								<!--           <button class="button btn btn-sm" >text message</button> -->
								<!--           <br> -->
								<br>
								<p>tlstlsrbrb11@gmail.com</p>
								<button class="button btn btn-sm" onclick="writeEmailToGyusub()">send
									e-mail</button>
							</div>
						</div>
					</div>
				</div>
			</div>




<!-- 팀원 단체사진 슬라이드 섹션 -->
			<div class="section">
				<div class="slideshow-container">
					<div class="mySlides fade">
						<div class="numbertext">1 / 3</div>
<!-- 						<img -->
<!-- 							src="https://velog.velcdn.com/images/yunlinit/post/ef7c6624-be57-44ec-812e-93d274a77d63/image.jpg" -->
<!-- 							style="width: 100%"> -->
							
							<img src="https://velog.velcdn.com/images/yunlinit/post/ef7c6624-be57-44ec-812e-93d274a77d63/image.jpg" style="width: 100%" class="img">
							
							 <div class="caption">“모든 것은 훌륭한 아이디어와<br>팀워크로부터 시작됩니다.” <br>- 우버 창립자 Garrett Camp </div>
						
					</div>

					<div class="mySlides fade">
						<div class="numbertext">2 / 3</div>
						<img
							src="https://velog.velcdn.com/images/yunlinit/post/e5b8b8f8-1deb-4f2a-ac7c-675754e0ab36/image.jpg"
							style="width: 100%" class="img">
							 <div class="caption">“모든 것은 훌륭한 아이디어와<br>팀워크로부터 시작됩니다.” <br>- 우버 창립자 Garrett Camp</div>
					
					</div>

					<div class="mySlides fade">
						<div class="numbertext">3 / 3</div>
						<img
							src="https://velog.velcdn.com/images/yunlinit/post/8e507583-95cd-4ebf-8006-18e423b5d79e/image.jpg"
							style="width: 100%" class="img">
							 <div class="caption">“모든 것은 훌륭한 아이디어와<br>팀워크로부터 시작됩니다.” <br>- 우버 창립자 Garrett Camp </div>
						
					</div>

				</div>
				<br>

				<div style="text-align: center">
					<span class="dot"></span> <span class="dot"></span> <span
						class="dot"></span>
				</div>
			</div>
		</div>
	</section>
	


<!-- 팀원에게 보내기 자바스크립트 함수 -->
<script>
  function writeEmailToYunlin() {
    // 여기서는 예시로 mailto 링크를 사용하여 이메일 클라이언트를 열도록 하였습니다.
    // 실제로는 백엔드와의 통신 등을 통해 이메일을 보내는 방법을 구현해야 할 수 있습니다.
    window.location.href = "/usr/home/writeEmailToYunlin";
  }
  
  function writeEmailToGayeon() {
    // 여기서는 예시로 mailto 링크를 사용하여 이메일 클라이언트를 열도록 하였습니다.
    // 실제로는 백엔드와의 통신 등을 통해 이메일을 보내는 방법을 구현해야 할 수 있습니다.
    window.location.href = "/usr/home/writeEmailToGayeon";
  }

  function writeEmailToGyusub() {
    // 여기서는 예시로 mailto 링크를 사용하여 이메일 클라이언트를 열도록 하였습니다.
    // 실제로는 백엔드와의 통신 등을 통해 이메일을 보내는 방법을 구현해야 할 수 있습니다.
    window.location.href = "/usr/home/writeEmailToGyusub";
  }

  function writeEmailToMyeongwon() {
    // 여기서는 예시로 mailto 링크를 사용하여 이메일 클라이언트를 열도록 하였습니다.
    // 실제로는 백엔드와의 통신 등을 통해 이메일을 보내는 방법을 구현해야 할 수 있습니다.
    window.location.href = "/usr/home/writeEmailToMyeongwon";
  }
</script>


<!-- 동영상이 3.5초마다 바뀌는 자바스크립트 -->
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

<!-- 헤더 사라졌다 나타났다 자바스크립트 함수 -->
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

<script>
	let isFocused = false;

	// Wait for the document to finish loading
	document.addEventListener("DOMContentLoaded", function() {
	    // Set up the interval to trigger the event listener every 0.2 seconds
	        let searchInput = document.querySelector('.search-input');
	        searchInput.addEventListener("keyup", showSearchList);
	        
	        searchInput.addEventListener("focus", () => {
	            if (!isFocused) {
	                showSearchList();
		            element.classList.add("flex");
		            element.classList.remove("hidden");
	            }
	            isFocused = true;
	        });
	        
	        searchInput.addEventListener("blur", () => {
	            isFocused = false;
	            let searchListElement = document.querySelector('.search-list');
	            element.classList.add("hidden");
	            element.classList.remove("flex");
	        });

	});


	
	// 도시명 리스트를 javascript객체화 처리
	var regionsJson = <%=request.getAttribute("regionsJson")%>;
	console.log(regionsJson);
	

	// 도시명 객체 리스트를 element화 해서 출력하는 처리
	function showSearchList(){
		
		let regionsJsonCopy = [];
		let searchInputValue = document.querySelector('.search-input').value;
		let searchListElement = document.querySelector('.search-list');
		
		
		if(!searchInputValue){
			regionsJsonCopy = deepCopyArrayOfObjects(regionsJson);
		}else{
			regionsJson.forEach(region => {
			    // region의 name이나 extra__countryName이 검색어로 시작하는지 확인
			    if (region.name.startsWith(searchInputValue) || region.extra__countryName.startsWith(searchInputValue)) {
			        // 시작하는 경우 matchedRegions 배열에 추가
			        regionsJsonCopy.push(region);
			    }
			});

		}

		
		// Loop through each selected element and remove them
		searchListElement.innerHTML = '';
		
		regionsJsonCopy.forEach(region => {
			// search-item을 담을 div 요소 생성
			var searchItemDiv = document.createElement("div");
			searchItemDiv.classList.add("search-item");
// 			searchItemDiv.href="/usr/regionInfoTips/infoTips?regionId="+region.id;
// 			searchItemDiv.target='_blank' 
			searchItemDiv.addEventListener("click", function() {
			    // Redirect to "/usr/regionInfoTips/infoTips?regionId=0"
			    console.log()
			    window.location.href = "/usr/regionInfoTips/infoTips?regionId="+region.id;
			});

			// country-region-name을 담을 div 요소 생성
			var countryRegionNameDiv = document.createElement("div");
			countryRegionNameDiv.classList.add("country-region-name");
			countryRegionNameDiv.addEventListener("click", function() {
			    // Redirect to "/usr/regionInfoTips/infoTips?regionId=0"
			    console.log("2")
			    window.location.href = "/usr/regionInfoTips/infoTips?regionId="+region.id;
			});

			// country-name을 담을 p 요소 생성
			var countryNameP = document.createElement("p");
			countryNameP.classList.add("country-name");
			countryNameP.textContent = region.name; // region.name 값 설정

			// region-name을 담을 p 요소 생성
			var regionNameP = document.createElement("p");
			regionNameP.classList.add("region-name");
			regionNameP.textContent = region.extra__countryName; // region.extra__countryName 값 설정

			// country-name과 region-name을 country-region-name에 추가
			countryRegionNameDiv.appendChild(countryNameP);
			countryRegionNameDiv.appendChild(regionNameP);

			// country-region-name을 search-item에 추가
			searchItemDiv.appendChild(countryRegionNameDiv);

			// search-item을 부모 요소에 추가
			searchListElement.appendChild(searchItemDiv);
		})
		
		
		
	}

	
	function deepCopyArrayOfObjects(arr) {
	    var copy = [];

	    for (var i = 0; i < arr.length; i++) {
	        // Check if the element is an object or array
	        if (typeof arr[i] === 'object' && arr[i] !== null) {
	            // If it's an object, deep copy it
	            copy[i] = deepCopyObject(arr[i]);
	        } else {
	            // If it's a primitive type, directly assign the value
	            copy[i] = arr[i];
	        }
	    }

	    return copy;
	}

	function deepCopyObject(obj) {
	    var copy = {};

	    for (var key in obj) {
	        if (obj.hasOwnProperty(key)) {
	            // Check if the property is an object or array
	            if (typeof obj[key] === 'object' && obj[key] !== null) {
	                // If it's an object, deep copy it
	                copy[key] = deepCopyObject(obj[key]);
	            } else {
	                // If it's a primitive type, directly assign the value
	                copy[key] = obj[key];
	            }
	        }
	    }

	    return copy;
	}
</script>
	
<script>	
// 팀원 단체사진 슬라이드 효과 자바스크립트
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>


</body>
</html>

<%@ include file="../common/foot.jspf"%>