<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="" ></c:set>
<%@ include file="../common/head.jspf"%>

<section>
  <div class="div-top">
    <div class="comment-and-search-box">
      <div class="comment-box">
        <div class="comment">
          TripAngle로 나만의 여행을
          <br />
          음악과 패션을 통해 감각적으로 계획해보세요
        </div>
      </div>
      <div class="search-area">
        <div class="search-box">
          <input type="text" class="search-input" style="border: none;" placeholder="떠나고 싶은 여행지를 알려주세요!">
          <a href="/" class="search-btn">
            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/9d1bcbb2b727b63e8a9b71f8ed09c2fbb0673fbc7961acc79bf133cb2367d88c?apiKey=725f06f0daeb4ab382150ea4b4cf3550&" alt="검색">
          </a>
        </div>
      </div>
    </div>
  </div>
  </div>

  <div class="div-bottom">
    <div class="about-trip-angle">
      <span style="color: rgba(66, 66, 66, 1)">About</span>
      <span style="color: rgba(105, 105, 105, 1)">Trip</span><span style="color: rgba(129, 200, 162, 1)">Angle</span>
    </div>
    <div class="mint-line"></div>
    <div class="trip-style-music-section">
      <div class="div-5">
        <div class="trip-box">
          <div class="trip-box-img">
            <div class="div-7 trip-title">Trip</div>
            <div class="div-8 trip-comment">
              감각적인 여행을 위해 여행지의 기온과 분위기를 </br> 고려하여 맞춤형
              스타일링과 특별한 음악을 </br>제공합니다.
            </div>
          </div>
        </div>
        <div class="style-box">
          <div class="style-box-img">
            <div class="style-title">Style</div>
            <div class="style-comment">
              전 세계의 다양한 여행지에 대한 최신 날씨 정보를 제공하고, 그에 맞는
              스타일링 팁을 제시합니다.
            </div>
          </div>
        </div>
        <div class="music-box">
          <div class="music-box-img">
            <div class="music-title">Music</div>
            <div class="music-comment">
              여행을 더욱 특별하게 만들기 위해 </br> 여행지와 어울리는 특별한
              플레이리스트를  </br>제공합니다.
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</section>


<style>	
.section {
  display: flex;
  justify-content: center; /* 자식 요소를 가로로 가운데 정렬합니다. */
}

/* top-area */

.div-top {
  border-radius: 10px;
  border: none;
  border-width: 1px;
  position: relative;
  align-items: center;
  padding: 80px 60px;
  max-width: 1280px;
  margin: auto; /* 수평 가운데 정렬합니다. */
  margin-top: 70px;
  background-image: url("https://velog.velcdn.com/images/yunlinit/post/7233e023-f724-4182-916b-1c7c373e4b3a/image.png");
  background-size: cover; /* 배경 이미지를 요소에 맞게 채우기 */
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

.div-top > * {
  position: relative; /* 배경 이미지 위에 있는 모든 요소들의 위치를 상대적으로 설정하여 불투명 필터 위에 겹쳐지도록 합니다. */
  z-index: 2; /* 배경 이미지 위에 표시되도록 설정합니다. */
}

@media (max-width: 991px) {
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

@media (max-width: 991px) {
  .div-2 {
    max-width: 100%;
    margin: 40px 0;
  }
}

.comment-box {
  gap: 20px;
  display: flex;
  width: 550px;
}

@media (max-width: 991px) {
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

@media (max-width: 991px) {
  .main-comment {
    max-width: 100%;
    margin-top: 40px;
  }
}

.search-area {
  display: flex;
  flex-direction: column;
  line-height: normal;
  width: 39%;
  margin-right: 85px;
}

@media (max-width: 991px, min-width: 200px) {
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

@media (max-width: 991px) {
  .search-box {
    margin-top: 40px;
    padding: 0 20px;
  }
}

.search-input {
  font-family: Pretendard, sans-serif;
  font-weight: 500;
  font-size: 16px;
  flex-grow: 1;
  flex-basis: auto;
  margin: auto 0;
}

.search-input:focus {
  outline: none; /* 포커스 효과 제거 */
}

.search-btn {
  aspect-ratio: 1;
  object-fit: auto;
  object-position: center;
  width: 24px;
}

/* /////////////////////////// bottom-area */

.div-bottom {
  justify-content: center;
  align-items: start;
  background-color: #fff;
  display: flex;
  flex-direction: column;
  padding: 32px 80px 80px;
  max-width: 1280px;
  margin: auto;
  margin-top: 120px;
}
@media (max-width: 991px) {
  .div-bottom {
    padding: 0 20px;
  }
}

.about-trip-angle {
  color: #81c8a2;
  font: 400 24px/28px Pretendard, sans-serif;
}
@media (max-width: 991px) {
  .about-trip-angle {
  }
}
.mint-line {
  border-color: rgba(213, 241, 226, 1);
  border-style: solid;
  border-bottom-width: 3px;
  width: 190px;
  height: 0;
  margin-top: 7px;
}
.trip-style-music-section {
  align-self: stretch;
  margin-top: 13px;
}
@media (max-width: 991px) {
  .trip-style-music-section {
    max-width: 100%;
  }
}
.div-5 {
  gap: 20px;
  display: flex;
}
@media (max-width: 991px) {
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
  width: 33%;
  margin-left: 0px;
}
@media (max-width: 991px) {
  .trip-box {
    width: 100%;
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
  background-image: url("https://velog.velcdn.com/images/yunlinit/post/995800fa-cbf0-4dfd-9b9d-846e9bb31b56/image.png");
  background-size: cover; /* 배경 이미지를 요소에 맞게 채우기 */
  border-radius: 10px;
}
@media (max-width: 991px) {
  .trip-box-img {
    margin-top: 40px;
  }
}

.trip-title {
  position: relative;
  letter-spacing: -0.8px;
  margin-top: 200px;
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
  width: 33%;
  margin-left: 20px;
}
@media (max-width: 991px) {
  .style-box {
    width: 100%;
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
  background-image: url("https://velog.velcdn.com/images/yunlinit/post/d9b5ca6f-79fa-4b55-9cb7-b66d6a2bdea4/image.png");
  background-size: cover; /* 배경 이미지를 요소에 맞게 채우기 */
  border-radius: 10px;
}
@media (max-width: 991px) {
  .style-box-img {
    margin-top: 40px;
    padding-right: 20px;
  }
}
.style-title {
  position: relative;
  letter-spacing: -0.8px;
  margin-top: 200px;
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
  width: 33%;
  margin-left: 20px;
}
@media (max-width: 991px) {
  .music-box {
    width: 100%;
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
  background-image: url("https://velog.velcdn.com/images/yunlinit/post/7741f6b1-9c7d-40e2-b8b9-c6398de90082/image.png");
  background-size: cover; /* 배경 이미지를 요소에 맞게 채우기 */
  border-radius: 10px;
}
@media (max-width: 991px) {
  .music-box-img {
    margin-top: 40px;
  }
}
.music-title {
  position: relative;
  letter-spacing: -0.8px;
  margin-top: 200px;
  font: 400 40px/96% Pattaya, sans-serif;
}

.music-comment {
  position: relative;
  margin-top: 9px;
  font: 400 16px/26px Pretendard, sans-serif;
}


</style>




<%@ include file="../common/foot.jspf"%>
