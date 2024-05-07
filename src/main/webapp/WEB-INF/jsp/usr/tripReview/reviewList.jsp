<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="TRIP REVIEW LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.trip-review-list-page {
	display: flex;
	justify-content: center; /* Horizontally center the container */
	flex-wrap: wrap;
	/* Allow items to wrap if they exceed container width */
}

.container {
	display: flex;
	justify-content: center; /* Horizontally center the container */
	flex-wrap: wrap;
	margin-top: 170px;
	position: absolute;
	/* Allow items to wrap if they exceed container width */
}

.trip-review-container {
	
}

.trip-review-box {
	border-radius: 10px;
	border-color: rgba(217, 217, 217, 1);
	border-style: solid;
	border-width: 1px;
	background-color: rgba(0, 0, 0, 0);
	display: flex;
	padding-bottom: 9px;
	margin: 30px;
	flex-direction: column;
	flex: 1;
	width: 200px;
	display: inline-block;
}

.trip-review-thumbnail {
	aspect-ratio: 1.19;
	object-fit: auto;
	object-position: center;
	width: 200px;
	align-self: center;
	border-top-left-radius: 9.3px;
	border-top-right-radius: 9.3px;
}

.trip-review-hashTag-box {
	display: flex;
	margin-top: 7px;
	gap: 11px;
	font-size: 12px;
	color: rgba(0, 0, 0, 0.5);
	line-height: 117%;
}

@media ( max-width : 991px) {
	.trip-review-hashTag-box {
		white-space: initial;
	}
}

.trip-review-information-box {
	display: flex;
	align-items: start;
	gap: 8px;
	margin: 6px 11px 0;
}

@media ( max-width : 991px) {
	.trip-review-information-box {
		white-space: initial;
		margin: 0 10px;
	}
}

.profile-image {
	aspect-ratio: 1;
	object-fit: auto;
	object-position: center;
	width: 35px;
	border-radius: 50%;
}

.trip-review-information {
	display: flex;
	flex-direction: column;
}

@media ( max-width : 991px) {
	.trip-review-information {
		white-space: initial;
	}
}

.div-8 {
	display: flex;
	gap: 20px;
	font-size: 14px;
	color: #000;
	line-height: 100%;
}

@media ( max-width : 991px) {
	.div-8 {
		white-space: initial;
	}
}

.trip-review-title {
	font-family: IBM Plex Mono, sans-serif;
	width: 107px;
}

.goodReaction-btn {
	aspect-ratio: 1.23;
	object-fit: auto;
	object-position: center;
	width: 16px;
	fill: #f00;
}

.div-10 {
	display: flex;
	margin-top: 7px;
	gap: 20px;
	justify-content: space-between;
}

@media ( max-width : 991px) {
	.div-10 {
		white-space: initial;
	}
}

.member-nickName {
	color: rgba(0, 0, 0, 0.7);
	font: 12px/117% IBM Plex Mono, sans-serif;
}

.trip-review-regDate {
	color: rgba(0, 0, 0, 0.5);
	font: 10px/140% IBM Plex Mono, sans-serif;
}

/* Tab */
.Tab {
	width: 200px;
	height: 53px;
	margin-top: 100px;
	margin-left: 150px;
	position: relative;
	left: -3.8%;
	display: flex;
}

.InfoLabel1 {
	width: 215.60px;
	height: 53px;
	text-align: center;
	color: black;
	font-size: 19.38px;
	font-family: Inter;
	font-weight: bold;
	line-height: 28px;
	word-wrap: break-word;
	position: relative; /* Added position relative */
}

.TabContent1::after {
	content: "";
	width: 200px;
	height: 3px;
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%); /* Center the bar */
	background-color: #D5F1E2;
}

.pagination {
	margin-top: 850px;
}
</style>

<div class="trip-review-list-page">
	<div class="Tab">
		<div class="InfoLabel1">
			<span class="TabContent1">여행 후기</span>
		</div>
	</div>
	<div class="container">
		<div class="trip-review-container">
			<div class="review-line">
				<%
				int count = 0;
				%>
				<c:forEach var="review" items="${reviewList }">
					<%
					if (count != 0 && count % 4 == 0) {
					%>
				
			</div>
			<div class="review-line">
				<%
				}
				%>
				<a href="detail?id=${review.id }">
					<div class="trip-review-box">
						<%-- <img src="${rq.getImgUri(review.id,relTypeCode)}"
							class="trip-review-thumbnail" /> --%>
						<img
							src="https://velog.velcdn.com/images/fake150907/post/610545eb-1a33-45ed-961a-df84f459b696/image.jpg"
							class="trip-review-thumbnail" />
						<div class="trip-review-information-box">
							<img
								src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
								class="profile-image" />
							<div class="trip-review-information">
								<div class="div-8">
									<div class="trip-review-title">${review.title }</div>
									<img
										src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2147d3e6324d81dc1a2909baba66e07251a734c79e0eac31516cc6774a33f87?"
										class="goodReaction-btn" />
								</div>
								<div class="div-10">
									<div class="member-nickName">${review.extra__writer }</div>
									<div class="trip-review-regDate">${review.regDate.substring(0,10)}</div>
								</div>
							</div>
						</div>
					</div>
				</a>
				<%
				count++;
				%>
				</c:forEach>
			</div>
		</div>
	</div>
</div>


<div class="pagination flex justify-center mt-3">
	<c:set var="paginationLen" value="3" />
	<c:set var="startPage"
		value="${page -  paginationLen  >= 1 ? page - paginationLen : 1}" />
	<c:set var="endPage"
		value="${page +  paginationLen  <= pagesCount ? page + paginationLen : pagesCount}" />

	<c:set var="baseUri" value="?boardId=${boardId }" />

	<c:if test="${startPage > 1 }">
		<a class="btn btn-sm" href="${baseUri }&page=1">1</a>
		<button class="btn btn-sm btn-disabled">...</button>
	</c:if>

	<c:forEach begin="${startPage }" end="${endPage }" var="i">
		<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }"
			href="${baseUri }&page=${i }">${i }</a>
	</c:forEach>

	<c:if test="${endPage < pagesCount }">
		<button class="btn btn-sm btn-disabled">...</button>
		<a class="btn btn-sm" href="${baseUri }&page=${pagesCount }">${pagesCount }</a>
	</c:if>
</div>

<%-- <div class="recipe-container">
	<div class="recipe-line">
		<%
		int count = 0;
		%>
		<c:forEach var="review" items="${reviewList }">
			<%
			if (count != 0 && count % 5 == 0) {
			%>
		
	</div>
	<div class="recipe-line">
		<%
		}
		%>
		<a href="detail?id=${review.id }">
			<div class="recipe-box">
				<img class="Thumbnail" src="${rq.getImgUri(review.id,relTypeCode)}"
					onerror="${rq.profileFallbackImgOnErrorHtml}" alt="" />
				<div class="div-6">
					<img
						src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-img" />
					<div class="div-7">
						<div class="div-8">
							<div class="recipe-title">${review.title}</div>
						</div>
						<div class="div-10">
							<div class="recipe-writer">${review.extra__writer }</div>
							<div class="recipe-regDate">${review.regDate.substring(0,10) }</div>
						</div>
					</div>
				</div>
			</div>
		</a>
		<%
		count++;
		%>
		</c:forEach>
	</div>
</div>
 --%>

<div></div>

<%@ include file="../common/foot.jspf"%>