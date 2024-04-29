<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="카페 상세보기"></c:set>
<%@ include file="../common/head.jspf"%>

<meta charset="utf-8">



<style>
.my-plan-detail {
	width: 80%;
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
	.detail-box {
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
	font-size: 12px;
	margin-left: 3px;
	margin-bottom: 5px;
	color: #3b3d40;
	font-weight: 600;
}

.reg-date {
	font-size: 16px;
	margin-left: 3px;
	margin-bottom: 20px;
	color: #3b3d40;
	font-weight: 600;
}

.my-plan-comment {
	font-size: 14px;
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
	font: 600 20px/140% Pretendard, sans-serif;
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
	font: 500 14px/17px Pretendard, sans-serif;
}



/* 옷 추천 탭 */
.recommendation-section {
  display: flex;
  flex-direction: column;
  justify-content: center;
  margin: 0 auto;
  width: 80%;
  align-self: start;
  margin-top: 300px;
}

/* 	width: 80%; */
/* 	display: flex; */
/* 	justify-content: center; */
/* 	margin: 0 auto; /* Add this to center the container itself */ */

.recommendation-header {
  display: flex;
  gap: 20px;
  padding: 0 20px;
}

.recommendation-title {
  font: 400 24px/28px Inter, sans-serif;
  flex: 1;
}

.recommendation-accent {
  color: #81c8a2;
}

.recommendation-tabs {
  display: none;
  gap: 14px;
  font-size: 16px;
  color: #3b3d40;
  font-weight: 600;
  line-height: 175%;
  align-items: center;
}

.recommendation-tab {
  border-bottom: solid #d5f1e2;
  border-bottom-width: 0px;
  transition-duration: 0.1s;
  cursor: pointer;
}

.recommendation-tab:hover,
.active-recommendation-tab {
  border-bottom-width: 3px;
}

.recommendation-divider {
  border-bottom: 1px solid rgba(206, 206, 206, 1);
  margin-top: 11px;
  width: 100%;
  max-width: 100%;
}

.ta-item-container {
  display: none;
  overflow: auto;
  gap: 30px;
  width: 80%;
  -ms-overflow-style: none;
  scroll-snap-type: x mandatory;
  padding-top: 10px;
  position: relative;
  justify-content: center; 
  margin: 0 auto; 

}

.ta-item-container::-webkit-scrollbar {
  display: none;
}

.ta-item-card {
  display: flex;
  flex-direction: column;
  max-width: 270px;
  border: 1px solid rgba(224, 219, 210, 1);
  border-radius: 8px;
  background-color: #fff;
  padding-bottom: 18px;
  font-weight: 400;
  position: relative;
  scroll-snap-align: start;
  min-width: 250px;
}

.ta-item-image {
  width: 100%;
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
  top: 0;
  left: 0;
  width: 100%;
  aspect-ratio: 1;
  height: 0px;
  overflow: hidden;
  background-color: #474747;
  opacity: 80%;
  z-index: 2;
  transition-duration: 500ms;
  display: flex;
  justify-content: center;
  align-items: center;
  word-wrap: break-word;
  color: white;
}

.ta-item-image-container:hover .ta-item-description {
  height: 250px;
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

.play-button-container:hover {
  background-color: #5e9d7a;
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

.detail-page-link {
  color: #81c8a2;
  margin-top: 9px;
  font: 400 11px Inter, sans-serif;
}

.loading-container {
  height: 300px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.spinner {
  animation: rotator 1.4s linear infinite;
}

@keyframes rotator {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(270deg);
  }
}

.path {
  stroke-dasharray: 187;
  stroke-dashoffset: 0;
  transform-origin: center;
  animation: dash 1.4s ease-in-out infinite, colors 5.6s ease-in-out infinite;
}

@keyframes colors {
  0%,
  100% {
    stroke: #81c8a2;
  }
}

@keyframes dash {
  0% {
    stroke-dashoffset: 187;
  }
  50% {
    stroke-dashoffset: 46.75;
    transform: rotate(135deg);
  }
  100% {
    stroke-dashoffset: 187;
    transform: rotate(450deg);
  }
}


</style>


<div class = "wall" style = "height: 120px;"> </div>
<div class="my-plan-detail">
	<div class="detail-box">
		<div class="column">
			<div class="div-2">
				<div class="div-3">
					<div class="div-4">
						<div class="destination">하와이</div>
						<div class="trip-date">2024-04-15 ~ 2024-04-24</div>
					</div>
					
					<a class="calendar-btn" href="/">캘린더 보기</a>
				</div>
				<img
					src="https://images.unsplash.com/photo-1551918120-9739cb430c6d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
					class="my-plan-img" />
			</div>

			<div class="plan-box">
				<div class="my-plan-title">연차쓰고 이번 휴가 달려</div>
				<div class="reg-date-title">나의 일정 등록일</div>
				<div class="reg-date">2024-04-11</div>
				<div class="my-plan-comment">마이일정 설명을 작성해주세요. 마이일정 설명을 작성해주세요. 마이일정 설명을 작성해주세요.마이일정 설명을 작성해주세요.마이일정 설명을 작성해주세요.마이일정 설명을 작성해주세요.마이일정 설명을 작성해주세요.마이일정 설명을 작성해주세요.마이일정 설명을 작성해주세요.마이일정 설명을 작성해주세요.마이일정 설명을 작성해주세요.마이일정 설명을 작성해주세요.마이일정 설명을 작성해주세요.마이일정 설명을 작성해주세요.</div>

			</div>

		</div>
		<div class="column-2">
			<div class="div-8">
				<div class="member-title-box">
					<div class="member-title">
						<span
							style="font-family: Pretendard, -apple-system, Roboto, Helvetica, sans-serif; font-weight: 500; color: rgba(129, 200, 162, 1);">angler1</span>님의
						<br> 마이 일정 상세페이지
					</div>
					<div class="mint-line"></div>
					<div class="btns">
						<a href="#" class="modify-btn">수정</a>
						<a href="#" class="delete-btn">삭제</a>
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
						<div class="language">일본어</div>
						<div class="currency-tip">사용 화폐</div>
						<div class="currency">가상화폐</div>
						<div class="volt-tip">전압</div>
						<div class="volt">피카츄 백만볼트</div>
						<div class="temperature-tip">기후</div>
						<div class="temperature">겁나더움</div>
					</div>
					<div class="honey-tip2">
						<div class="transportation-tip">주요 대중교통</div>
						<div class="transportation">전용기</div>
						<div class="timedifference-tip">시차</div>
						<div class="timedifference">별로안남</div>
						<div class="remark-tip">특이사항</div>
						<div class="remark">일식 존맛</div>

					</div>
				</div>
				<div class="explanation-tip">설명</div>
				<div class="explanation">나는 지금 당장 떠나고싶어 내일 학원은 안가고싶고 당장 여권챙기자 ~ 안녕 나는 튀튀.. 는 뻥이고 지금 나는 피그마 구현중이고 너무 배고프고 졸리고 하하하하와이
					~~~~~ ...더보기</div>
			</div>
		</div>
	</div>
</div>

<div class="fashion-recommendation-main">

  <div class="section-container mt-100">
    <section class="recommendation-section">
      <header class="recommendation-header">
        <h2 class="recommendation-title">
          <span>날씨에 알맞는</span>
          <span class="recommendation-accent">옷 추천</span>
        </h2>
        <nav class="recommendation-tabs">
          <div class="recommendation-tab fashion-all">전체</div>
          <div class="recommendation-tab fashion-women">여성</div>
          <div class="recommendation-tab fashion-man">남성</div>
        </nav>
      </header>
      <div class="recommendation-divider"></div>
    </section>

  </div>
  <div class="section-container">
    <div class="loading-container">
      <svg class="spinner" width="65px" height="65px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
        <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
      </svg>
      <p>지금 ai가 날씨에 맞는 옷을 찾아주는 중입니다.</p>
    </div>

    <section class="ta-item-container fashion-all"></section>
    <section class="ta-item-container fashion-women"></section>
    <section class="ta-item-container fashion-man"></section>

  </div>
</div>



<script>

fashions = [
	  {
	    name: "롱패딩",
	    brand: "뉴발란스",
	    gender: 0,
	    description:
	      "한국 겨울에 적합한 롱패딩. 보온성이 뛰어나고 스타일리시한 디자인.",
	    imageUrl:
	      "https://shopping-phinf.pstatic.net/main_8704333/87043339346.1.jpg"
	  },
	  {
	    name: "니트 가디건",
	    brand: "지오다노",
	    gender: 0,
	    description: "가벼운 니트 가디건. 쾌적한 여행을 위한 아우터로 적합.",
	    imageUrl:
	      "https://shopping-phinf.pstatic.net/main_3170904/31709040807.20220410190846.jpg"
	  },
	  {
	    name: "카고 바지",
	    brand: "리바이스",
	    gender: 0,
	    description: "다양한 수납공간이 있는 카고 바지. 편안한 착용감과 실용성.",
	    imageUrl:
	      "https://shopping-phinf.pstatic.net/main_4680554/46805540242.20240403061756.jpg"
	  },
	  {
	    name: "맨투맨",
	    brand: "에잇세컨즈",
	    gender: 0,
	    description: "편안하고 스타일리시한 맨투맨. 다양한 코디에 활용 가능.",
	    imageUrl:
	      "https://shopping-phinf.pstatic.net/main_4528440/45284407201.20240217015504.jpg"
	  },
	  {
	    name: "청바지",
	    brand: "지오다노",
	    gender: 0,
	    description: "한국에서 인기있는 지오다노 청바지. 스트레치로 편안한 착용감.",
	    imageUrl:
	      "https://shopping-phinf.pstatic.net/main_4519423/45194233182.20240111171516.jpg"
	  },
	  {
	    name: "스니커즈",
	    brand: "컨버스",
	    gender: 0,
	    description: "대중적이고 편안한 컨버스 스니커즈. 여행 중 편리한 신발.",
	    imageUrl: "https://shopping-phinf.pstatic.net/main_8637022/86370224181.jpg"
	  },
	  {
	    name: "롱패딩",
	    brand: "뉴발란스",
	    gender: 1,
	    description:
	      "한국 겨울에 적합한 롱패딩. 보온성이 뛰어나고 여성스러운 실루엣.",
	    imageUrl:
	      "https://shopping-phinf.pstatic.net/main_8680585/86805851138.3.jpg"
	  },
	  {
	    name: "캐시미어 스웨터",
	    brand: "유니클로",
	    gender: 1,
	    description: "포근한 캐시미어 스웨터. 여행 중 따뜻하고 세련된 룩.",
	    imageUrl:
	      "https://shopping-phinf.pstatic.net/main_4392540/43925409499.20231110122444.jpg"
	  },
	  {
	    name: "와이드 데님 팬츠",
	    brand: "폴로 랄프로렌",
	    gender: 1,
	    description: "스타일리시한 와이드 데님 팬츠. 여행 중 편안한 착용감.",
	    imageUrl: "https://shopping-phinf.pstatic.net/main_8771557/87715578465.jpg"
	  },
	  {
	    name: "블라우스",
	    brand: "제이에스티나",
	    gender: 1,
	    description:
	      "세련된 디자인의 블라우스. 여행 중 여성스러운 매력을 선보일 수 있음.",
	    imageUrl: "https://velog.velcdn.com/images/yunlinit/post/5d80752c-cbf7-44fd-9110-d29944d911b0/image.webp"
	  },
	  {
	    name: "롱 스커트",
	    brand: "린",
	    gender: 1,
	    description: "한국에서 유행하는 롱 스커트. 여성스러우면서도 편안한 착용감.",
	    imageUrl:
	      "https://shopping-phinf.pstatic.net/main_4092679/40926796986.20240320231821.jpg"
	  },
	  {
	    name: "로퍼",
	    brand: "존스부띠끄",
	    gender: 1,
	    description: "대중적인 존스부띠끄 로퍼. 여행 중 편리한 신발로 추천.",
	    imageUrl: "https://velog.velcdn.com/images/yunlinit/post/5d80752c-cbf7-44fd-9110-d29944d911b0/image.webp"
	  }
	];

	function printFashions() {
	  const fashionAll = document.querySelector(".ta-item-container.fashion-all");
	  const fashionMan = document.querySelector(".ta-item-container.fashion-man");
	  const fashionWomen = document.querySelector(
	    ".ta-item-container.fashion-women"
	  );

	  fashions.forEach((fashion) => {
	    // Create the article element
	    const article = document.createElement("article");
	    article.className = "ta-item-card";

	    // Create the image container div
	    const imageContainer = document.createElement("div");
	    imageContainer.className = "ta-item-image-container";

	    // Create the image element
	    const image = document.createElement("img");
	    if (fashion.imageUrl == "") {
	      image.src = "FashionNoimage.webp";
	    } else {
	      image.src = fashion.imageUrl;
	    }

	    image.alt = "Fashion Image";
	    image.className = "ta-item-image";
	    image.loading = "lazy";

	    // Append the image to the image container
	    imageContainer.appendChild(image);

	    // Create the description div
	    const description = document.createElement("div");
	    description.className = "ta-item-description";
	    description.textContent = fashion.description;

	    // Append the description to the image container
	    imageContainer.appendChild(description);

	    // Append the image container to the article
	    article.appendChild(imageContainer);

	    // Create the details div
	    const details = document.createElement("div");
	    details.className = "ta-item-details";

	    // Create the item name h3
	    const itemName = document.createElement("h3");
	    itemName.className = "ta-item-name";
	    itemName.textContent = fashion.name;

	    // Append the item name to the details div
	    details.appendChild(itemName);

	    // Create the details info div
	    const detailsInfo = document.createElement("div");
	    detailsInfo.className = "ta-item-details-info";

	    // Create and append brand name paragraph
	    const brandName = document.createElement("p");
	    brandName.className = "ta-item-info";
	    brandName.textContent = fashion.brand;
	    detailsInfo.appendChild(brandName);

	    // Create and append gender paragraph
	    const gender = document.createElement("p");
	    gender.className = "ta-item-info";
	    if (fashion.gender == 0) {
	      gender.textContent = "남성";
	    } else {
	      gender.textContent = "여성";
	    }

	    detailsInfo.appendChild(gender);

	    // Append the details info to the details div
	    details.appendChild(detailsInfo);

	    // Append the details div to the article
	    article.appendChild(details);
	    console.log(article);

	    fashionAll.appendChild(article);
	    const articleClone = article.cloneNode(true);
	    if (fashion.gender == 0) {
	      fashionMan.appendChild(articleClone);
	    } else {
	      fashionWomen.appendChild(articleClone);
	    }
	  });

	  // Append the article to the document body or any other container
	  fashionAll.style.display = "flex";
	  document.querySelector(".recommendation-tabs").style.display = "flex";
	  document.querySelector(
	    ".fashion-recommendation-main .loading-container"
	  ).style.display = "none";
	  document
	    .querySelector(".recommendation-tab.fashion-all")
	    .classList.add("active-recommendation-tab");
	}

	printFashions();


</script>
