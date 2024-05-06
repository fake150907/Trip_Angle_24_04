<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="TRIP REVIEW LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.travel-country {
	color: #3b3d40;
	position: absolute;
	top: -10%;
	left: 46.8%;
	font: 500 36px Pretendard, sans-serif;
	text-align: center;
}

.travel-date {
	color: #3b3d40;
	position: absolute;
	top: -4%;
	left: 45%;
	text-align: center;
	font: 500 12px Pretendard, sans-serif;
	border-bottom: 3px solid #d5f1e2;
}

.ticketing-container {
	align-self: stretch;
	display: flex;
	width: 100%;
	gap: 20px;
	position: absolute;
	top: 20%;
	left: 0;
}

@media ( max-width : 991px) {
	.div-14 {
		max-width: 100%;
		flex-wrap: wrap;
	}
}

.left-ticketing-container {
	flex-grow: 1;
	flex-basis: auto;
}

@media ( max-width : 991px) {
	.left-ticketing-container {
		max-width: 100%;
	}
}

.left-ticketing-box {
	gap: 20px;
	display: flex;
}

@media ( max-width : 991px) {
	.left-ticketing-box {
		flex-direction: column;
		align-items: stretch;
		gap: 0px;
	}
}

.column {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 24%;
	margin-left: 0px;
}

@media ( max-width : 991px) {
	.column {
		width: 100%;
	}
}

.skip-box {
	display: flex;
	margin-top: 441px;
	flex-grow: 1;
	flex-direction: column;
	color: #adafb1;
	font-weight: 600;
	text-align: center;
}

@media ( max-width : 991px) {
	.skip-box {
		margin-top: 40px;
	}
}

.div-18 {
	display: flex;
	gap: 5px;
	font-size: 16px;
	white-space: nowrap;
	padding: 0 1px;
	align-self: center;
	margin-top: 150px;
}

@media ( max-width : 991px) {
	.div-18 {
		white-space: initial;
	}
}

.skip-text {
	font-family: Pretendard, sans-serif;
	flex-grow: 1;
	margin: auto 0;
}

.skip-arrow-mark {
	aspect-ratio: 1;
	object-fit: auto;
	object-position: center;
	width: 18px;
}

.skip-text2 {
	margin-top: 5px;
	font: 11px Pretendard, sans-serif;
}

.column-2 {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 76%;
	margin-left: 20px;
}

@media ( max-width : 991px) {
	.column-2 {
		width: 100%;
	}
}

.airPlane-ticketing-box {
	display: flex;
	flex-grow: 1;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

@media ( max-width : 991px) {
	.airPlane-ticketing-box {
		margin-top: 40px;
	}
}

.airPlane-ticketing-text {
	color: #3b3d40;
	font: 700 20px Pretendard, sans-serif;
}

.airPlane-ticketing-explain {
	color: #81c8a2;
	margin-top: 13px;
	font: 500 14px Pretendard, sans-serif;
}

.airPlane-ticketing-img {
	aspect-ratio: 0.77;
	object-fit: auto;
	object-position: center;
	width: 70%;
	align-self: stretch;
	margin-top: 14px;
	margin-left: 95px;
}

.mid-line {
	background-color: rgba(206, 206, 206, 1);
	border-style: solid;
	width: 2.5px;
	height: 500px;
	margin: auto 0;
	z-index: 100;
}

.right-ticketing-container {
	flex-grow: 1;
	flex-basis: auto;
}

@media ( max-width : 991px) {
	.right-ticketing-container {
		max-width: 100%;
	}
}

.right-ticketing-box {
	gap: 20px;
	display: flex;
}

@media ( max-width : 991px) {
	.right-ticketing-box {
		flex-direction: column;
		align-items: stretch;
		gap: 0px;
	}
}

.column-3 {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 78%;
	margin-left: 0px;
}

@media ( max-width : 991px) {
	.column-3 {
		width: 100%;
	}
}

.lodging-ticketing-box {
	display: flex;
	flex-grow: 1;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

@media ( max-width : 991px) {
	.lodging-ticketing-box {
		margin-top: 40px;
	}
}

.lodging-ticketing-text {
	color: #3b3d40;
	font: 700 20px Pretendard, sans-serif;
}

.lodging-ticketing-explain {
	color: #81c8a2;
	margin-top: 13px;
	font: 500 14px Pretendard, sans-serif;
}

.lodging-ticketing-img {
	aspect-ratio: 0.77;
	object-fit: auto;
	object-position: center;
	width: 68%;
	align-self: stretch;
	margin-top: 14px;
	margin-left: 105px;
}

.column-4 {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 22%;
	margin-left: 20px;
}

@media ( max-width : 991px) {
	.column-4 {
		width: 100%;
	}
}

.next-step-box {
	display: flex;
	margin-top: 440px;
	flex-grow: 1;
	flex-direction: column;
	font-weight: 600;
	text-align: center;
}

@media ( max-width : 991px) {
	.next-step-box {
		margin-top: 40px;
	}
}

.div-31 {
	align-self: center;
	display: flex;
	gap: 5px;
	font-size: 16px;
	color: #505967;
	white-space: nowrap;
	margin-top: 150px;
}

@media ( max-width : 991px) {
	.div-31 {
		white-space: initial;
	}
}

.next-step-text {
	font-family: Pretendard, sans-serif;
	flex-grow: 1;
	margin: auto 0;
}

.next-step-arrow-mark {
	aspect-ratio: 1;
	object-fit: auto;
	object-position: center;
	width: 18px;
}

.next-step-text2 {
	color: #81c8a2;
	margin-top: 6px;
	font: 11px Pretendard, sans-serif;
}
</style>
<div class="ticketing-container">
	<div class="travel-country">하와이</div>
	<div class="travel-date">2024-04-15 부터 2024-04-24</div>

	<div class="left-ticketing-container">
		<div class="left-ticketing-box">
			<div class="column">
				<div class="skip-box">
					<div class="div-18">
						<div class="skip-text">건너뛰기</div>
						<img
							src="https://cdn.builder.io/api/v1/image/assets/TEMP/f6d8feafb09c985236bfa1aecfa5f51956e9e7e61daf75f07f4063c11f68706b?"
							class="skip-arrow-mark" />
					</div>
					<div class="skip-text2">따로 예약 했어요!</div>
				</div>
			</div>
			<div class="column-2">
				<div class="airPlane-ticketing-box">
					<div class="airPlane-ticketing-text">항공권 예매하러 가기</div>
					<div class="airPlane-ticketing-explain">보다 편리하게 항공권을 예매해보세요.</div>
					<a href="https://www.skyscanner.co.kr/" target='_blank'> <img
						srcset="https://velog.velcdn.com/images/fake150907/post/de0e3a94-e894-415d-bc02-e8991022efec/image.png"
						class="airPlane-ticketing-img" /></a>
				</div>
			</div>
		</div>
	</div>
	<div class="mid-line"></div>
	<div class="right-ticketing-container">
		<div class="right-ticketing-box">
			<div class="column-3">
				<div class="lodging-ticketing-box">
					<div class="lodging-ticketing-text">숙소 예약하러 가기</div>
					<div class="lodging-ticketing-explain">합리적인 가격의 멋진 숙소를 찾아보세요.</div>
					<a target='_blank'
						href="https://www.booking.com/index.ko.html?aid=2311236;label=ko-kr-booking-desktop-7KDVySvzJqtRopnHc_axVAS652828999093:pl:ta:p1:p2:ac:ap:neg:fi:tikwd-334108349:lp1009880:li:dec:dm;ws=&gad_source=1&gclid=Cj0KCQjwir2xBhC_ARIsAMTXk851OkKTozqKLKBn2CduqfiAzzMhRoI8da_8l0kDXRKPYUqW8ckkhOwaAl_iEALw_wcB">
						<img
						src="https://velog.velcdn.com/images/fake150907/post/9b5995ca-7aa4-414a-bbf3-c550862846cf/image.png"
						class="lodging-ticketing-img" />
					</a>
				</div>
			</div>
			<div class="column-4">
				<div class="next-step-box">
					<div class="div-31">
						<div class="next-step-text">다음단계</div>
						<img
							src="https://cdn.builder.io/api/v1/image/assets/TEMP/5e372a9baab8fc46ea66803d8658d232670e223da22264d0b874230a858f60b9?"
							class="next-step-arrow-mark" />
					</div>
					<div class="next-step-text2">스타일링페이지로 이동</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>


<%@ include file="../common/foot.jspf"%>