<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="마이 일정 리스트"></c:set>

<%@ include file="../common/head.jspf"%>

<!-- 페이지제목 -->
<div class="page-title">
	<div class="result">
		'${rq.loginedMember.nickname }'님의 나의 일정
		<div class="mint-line"></div>
	</div>
</div>

<style>
.heart {
	color: #eb4034;
	font-size: 25px;
	font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 30
}
</style>

<!-- 찜 한 카페 페이지  -->
<section class="my-plan-list-page">


	<section class="my-plan-list">
		<!-- 찜한 카페목록 -->
		<div class="search-result plan-list" id="search-result">
			<c:forEach var="tripSchedule" items="${tripSchedules}">

				<a href="myPlanDetail?id=${tripSchedule.id}&regionId=${tripSchedule.regionId}" class="linkbox１">
					<div class="content-info-box content-1">
						<div class="my-plan-img-box">
							<img
								src="${tripSchedule.extra__regionImageUrl }"
								alt="마이 일정 이미지" />
						</div>
						<div class="name-regdate">
							<div class="my-plan-name">${tripSchedule.title}</div>
							<p class="regdate">마이일정 등록일 : ${tripSchedule.regDate}</p>
						</div>
						<div class="div line"></div>

						<div class="destination-schedule">
							<div class="my-destination">${tripSchedule.extra__regionName}</div>
							<p class="my-schedule">${tripSchedule.startDate} ~ ${tripSchedule.endDate}</p>
						</div>

					</div>
				</a>
			</c:forEach>
		</div>
	</section>



</section>



<!-- 페이지제목 css -->

<style>
.line {
	position: absolute;
	border-color: #cacaca;
	border-style: solid;
	border-bottom-width: 1px;
	height: 5px;
	width: 325px;
	top: 50%;
	margin-left: 66%;
}

.page-title {
	position: relative;
	top: 100px;
	font-family: "Pretendard";
	font-weight: 500;
	font-family: "Pretendard";
	font-size: 30px;
	color: #3B3D40;
}

.result {
	margin-left: 31%;
}

.mint-line {
	background-color: #d5f1e2;
	margin-top: 10px;
	height: 3px;
	width: 200px;
	margin-left: 0;
}

/* 나의일정리스트 */
.my-plan-list-page {
	display: flex;
	justify-content: center; /* 좌우 중앙 정렬 */
 	margin-top: 150px; 
	margin-bottom: 100px;
}


.my-plan-list {
	position: absolute;
}

.content-info-box {
	position: relative;
	width: 750px;
	height: 247px;
	margin-bottom: 80px; 
}

.content-info-box .name-regdate {
	position: absolute;
	width: 296px;
	height: 43px;
	top: 6px;
	left: 490px;
}

.content-info-box .my-plan-name {
	height: 24px;
	top: 5px;
	font-family: "Pretendard";
	font-weight: 600;
	font-size: 20px;
	position: absolute;
	width: 296px;
	color: #000000;
	letter-spacing: 0;
	line-height: normal;
}

.content-info-box .regdate {
	height: 20px;
	top: 32px;
	font-family: Pretendard;
	font-weight: 500;
	font-size: 11px;
	position: absolute;
	width: 296px;
	margin-left: 1px;
	color: #666666;
	letter-spacing: 0;
	line-height: normal;
}

.destination-schedule {
	position: absolute;
	width: 296px;
	height: 43px;
	top: 60%;
	left: 490px;
}

.content-info-box .my-destination {
	height: 24px;
	top: 5px;
	font-family: "Pretendard";
	font-weight: 600;
	font-size: 20px;
	position: absolute;
	width: 296px;
	color: #81C8A2;
	letter-spacing: 0;
	line-height: normal;
}

.content-info-box .my-schedule {
	height: 20px;
	top: 32px;
	font-family: Pretendard;
	font-weight: 500;
	font-size: 15px;
	position: absolute;
	width: 296px;
	margin-left: 1px;
	color: #666666;
	letter-spacing: 0;
	line-height: normal;
}

/* 리스트 이미지 hover 하면 이미지 확대 효과 */
.content-info-box .my-plan-img-box {
	position: relative; /* 상대적 위치 설정 */
	width: 467px;
	height: 247px;
	border-radius: 20px;
	overflow: hidden; /* 내용이 넘치는 경우 숨김 처리 */
}

.content-info-box .my-plan-img-box img {
	position: absolute; /* 절대적 위치 설정 */
	width: 100%; /* 부모 요소에 대해 100% 너비를 갖도록 설정 */
	height: 100%; /* 부모 요소에 대해 100% 높이를 갖도록 설정 */
	top: 0; /* 부모 요소의 맨 위에 위치 */
	left: 0; /* 부모 요소의 맨 왼쪽에 위치 */
	object-fit: cover; /* 이미지를 박스에 맞게 crop */
	transition: transform 0.2s linear; /* 변형 효과 설정 */
}

.content-info-box .my-plan-img-box:hover img {
	transform: scale(1.1); /* 이미지 확대 효과 */
}
</style>





<%@ include file="../common/foot.jspf"%>