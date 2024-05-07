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
	/* Allow items to wrap if they exceed container width */
	margin-top: 180px;
	margin-right: 20px;
	border: 1px solid red;
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

@media ( max-width : 991px) {
	.trip-review-box {
		white-space: initial;
	}
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

.hashTag {
	font-family: IBM Plex Mono, sans-serif;
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
	display: flex;
	border: 1px solid pink;
}

@media ( max-width : 991px) {
	.Tab {
		max-width: 100%;
		flex-wrap: wrap;
	}
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
</style>
<div class="trip-review-list-page">
	<div class="Tab">
		<div class="InfoLabel1">
			<span class="TabContent1">여행 후기</span>
		</div>
	</div>
	<div class="container">
		<div class="trip-review-container">
			<div class="trip-review-box">
				<img
					src="https://velog.velcdn.com/images/fake150907/post/16f9b770-cbf8-4b89-983c-929f7ad2843e/image.jpg"
					class="trip-review-thumbnail" />
				<div class="trip-review-hashTag-box">
					<div class="hashTag">#캠핑</div>
					<div class="hashTag">#알프스산맥</div>
					<div class="hashTag">#방구</div>
				</div>
				<div class="trip-review-information-box">
					<img
						src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-image" />
					<div class="trip-review-information">
						<div class="div-8">
							<div class="trip-review-title">후후여행후기&gt;&lt;</div>
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2147d3e6324d81dc1a2909baba66e07251a734c79e0eac31516cc6774a33f87?"
								class="goodReaction-btn" />
						</div>
						<div class="div-10">
							<div class="member-nickName">고수달</div>
							<div class="trip-review-regDate">2024.04.17</div>
						</div>
					</div>
				</div>
			</div>
			<div class="trip-review-box">
				<img
					src="https://velog.velcdn.com/images/fake150907/post/16f9b770-cbf8-4b89-983c-929f7ad2843e/image.jpg"
					class="trip-review-thumbnail" />
				<div class="trip-review-hashTag-box">
					<div class="hashTag">#캠핑</div>
					<div class="hashTag">#알프스산맥</div>
					<div class="hashTag">#방구</div>
				</div>
				<div class="trip-review-information-box">
					<img
						src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-image" />
					<div class="trip-review-information">
						<div class="div-8">
							<div class="trip-review-title">후후여행후기&gt;&lt;</div>
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2147d3e6324d81dc1a2909baba66e07251a734c79e0eac31516cc6774a33f87?"
								class="goodReaction-btn" />
						</div>
						<div class="div-10">
							<div class="member-nickName">고수달</div>
							<div class="trip-review-regDate">2024.04.17</div>
						</div>
					</div>
				</div>
			</div>
			<div class="trip-review-box">
				<img
					src="https://velog.velcdn.com/images/fake150907/post/16f9b770-cbf8-4b89-983c-929f7ad2843e/image.jpg"
					class="trip-review-thumbnail" />
				<div class="trip-review-hashTag-box">
					<div class="hashTag">#캠핑</div>
					<div class="hashTag">#알프스산맥</div>
					<div class="hashTag">#방구</div>
				</div>
				<div class="trip-review-information-box">
					<img
						src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-image" />
					<div class="trip-review-information">
						<div class="div-8">
							<div class="trip-review-title">후후여행후기&gt;&lt;</div>
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2147d3e6324d81dc1a2909baba66e07251a734c79e0eac31516cc6774a33f87?"
								class="goodReaction-btn" />
						</div>
						<div class="div-10">
							<div class="member-nickName">고수달</div>
							<div class="trip-review-regDate">2024.04.17</div>
						</div>
					</div>
				</div>
			</div>
			<div class="trip-review-box">
				<img
					src="https://velog.velcdn.com/images/fake150907/post/16f9b770-cbf8-4b89-983c-929f7ad2843e/image.jpg"
					class="trip-review-thumbnail" />
				<div class="trip-review-hashTag-box">
					<div class="hashTag">#캠핑</div>
					<div class="hashTag">#알프스산맥</div>
					<div class="hashTag">#방구</div>
				</div>
				<div class="trip-review-information-box">
					<img
						src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-image" />
					<div class="trip-review-information">
						<div class="div-8">
							<div class="trip-review-title">후후여행후기&gt;&lt;</div>
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2147d3e6324d81dc1a2909baba66e07251a734c79e0eac31516cc6774a33f87?"
								class="goodReaction-btn" />
						</div>
						<div class="div-10">
							<div class="member-nickName">고수달</div>
							<div class="trip-review-regDate">2024.04.17</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="trip-review-container">
			<div class="trip-review-box">
				<img
					src="https://velog.velcdn.com/images/fake150907/post/16f9b770-cbf8-4b89-983c-929f7ad2843e/image.jpg"
					class="trip-review-thumbnail" />
				<div class="trip-review-hashTag-box">
					<div class="hashTag">#캠핑</div>
					<div class="hashTag">#알프스산맥</div>
					<div class="hashTag">#방구</div>
				</div>
				<div class="trip-review-information-box">
					<img
						src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-image" />
					<div class="trip-review-information">
						<div class="div-8">
							<div class="trip-review-title">후후여행후기&gt;&lt;</div>
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2147d3e6324d81dc1a2909baba66e07251a734c79e0eac31516cc6774a33f87?"
								class="goodReaction-btn" />
						</div>
						<div class="div-10">
							<div class="member-nickName">고수달</div>
							<div class="trip-review-regDate">2024.04.17</div>
						</div>
					</div>
				</div>
			</div>
			<div class="trip-review-box">
				<img
					src="https://velog.velcdn.com/images/fake150907/post/16f9b770-cbf8-4b89-983c-929f7ad2843e/image.jpg"
					class="trip-review-thumbnail" />
				<div class="trip-review-hashTag-box">
					<div class="hashTag">#캠핑</div>
					<div class="hashTag">#알프스산맥</div>
					<div class="hashTag">#방구</div>
				</div>
				<div class="trip-review-information-box">
					<img
						src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-image" />
					<div class="trip-review-information">
						<div class="div-8">
							<div class="trip-review-title">후후여행후기&gt;&lt;</div>
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2147d3e6324d81dc1a2909baba66e07251a734c79e0eac31516cc6774a33f87?"
								class="goodReaction-btn" />
						</div>
						<div class="div-10">
							<div class="member-nickName">고수달</div>
							<div class="trip-review-regDate">2024.04.17</div>
						</div>
					</div>
				</div>
			</div>
			<div class="trip-review-box">
				<img
					src="https://velog.velcdn.com/images/fake150907/post/16f9b770-cbf8-4b89-983c-929f7ad2843e/image.jpg"
					class="trip-review-thumbnail" />
				<div class="trip-review-hashTag-box">
					<div class="hashTag">#캠핑</div>
					<div class="hashTag">#알프스산맥</div>
					<div class="hashTag">#방구</div>
				</div>
				<div class="trip-review-information-box">
					<img
						src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-image" />
					<div class="trip-review-information">
						<div class="div-8">
							<div class="trip-review-title">후후여행후기&gt;&lt;</div>
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2147d3e6324d81dc1a2909baba66e07251a734c79e0eac31516cc6774a33f87?"
								class="goodReaction-btn" />
						</div>
						<div class="div-10">
							<div class="member-nickName">고수달</div>
							<div class="trip-review-regDate">2024.04.17</div>
						</div>
					</div>
				</div>
			</div>
			<div class="trip-review-box">
				<img
					src="https://velog.velcdn.com/images/fake150907/post/16f9b770-cbf8-4b89-983c-929f7ad2843e/image.jpg"
					class="trip-review-thumbnail" />
				<div class="trip-review-hashTag-box">
					<div class="hashTag">#캠핑</div>
					<div class="hashTag">#알프스산맥</div>
					<div class="hashTag">#방구</div>
				</div>
				<div class="trip-review-information-box">
					<img
						src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-image" />
					<div class="trip-review-information">
						<div class="div-8">
							<div class="trip-review-title">후후여행후기&gt;&lt;</div>
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2147d3e6324d81dc1a2909baba66e07251a734c79e0eac31516cc6774a33f87?"
								class="goodReaction-btn" />
						</div>
						<div class="div-10">
							<div class="member-nickName">고수달</div>
							<div class="trip-review-regDate">2024.04.17</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="trip-review-container">
			<div class="trip-review-box">
				<img
					src="https://velog.velcdn.com/images/fake150907/post/16f9b770-cbf8-4b89-983c-929f7ad2843e/image.jpg"
					class="trip-review-thumbnail" />
				<div class="trip-review-hashTag-box">
					<div class="hashTag">#캠핑</div>
					<div class="hashTag">#알프스산맥</div>
					<div class="hashTag">#방구</div>
				</div>
				<div class="trip-review-information-box">
					<img
						src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-image" />
					<div class="trip-review-information">
						<div class="div-8">
							<div class="trip-review-title">후후여행후기&gt;&lt;</div>
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2147d3e6324d81dc1a2909baba66e07251a734c79e0eac31516cc6774a33f87?"
								class="goodReaction-btn" />
						</div>
						<div class="div-10">
							<div class="member-nickName">고수달</div>
							<div class="trip-review-regDate">2024.04.17</div>
						</div>
					</div>
				</div>
			</div>
			<div class="trip-review-box">
				<img
					src="https://velog.velcdn.com/images/fake150907/post/16f9b770-cbf8-4b89-983c-929f7ad2843e/image.jpg"
					class="trip-review-thumbnail" />
				<div class="trip-review-hashTag-box">
					<div class="hashTag">#캠핑</div>
					<div class="hashTag">#알프스산맥</div>
					<div class="hashTag">#방구</div>
				</div>
				<div class="trip-review-information-box">
					<img
						src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-image" />
					<div class="trip-review-information">
						<div class="div-8">
							<div class="trip-review-title">후후여행후기&gt;&lt;</div>
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2147d3e6324d81dc1a2909baba66e07251a734c79e0eac31516cc6774a33f87?"
								class="goodReaction-btn" />
						</div>
						<div class="div-10">
							<div class="member-nickName">고수달</div>
							<div class="trip-review-regDate">2024.04.17</div>
						</div>
					</div>
				</div>
			</div>
			<div class="trip-review-box">
				<img
					src="https://velog.velcdn.com/images/fake150907/post/16f9b770-cbf8-4b89-983c-929f7ad2843e/image.jpg"
					class="trip-review-thumbnail" />
				<div class="trip-review-hashTag-box">
					<div class="hashTag">#캠핑</div>
					<div class="hashTag">#알프스산맥</div>
					<div class="hashTag">#방구</div>
				</div>
				<div class="trip-review-information-box">
					<img
						src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-image" />
					<div class="trip-review-information">
						<div class="div-8">
							<div class="trip-review-title">후후여행후기&gt;&lt;</div>
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2147d3e6324d81dc1a2909baba66e07251a734c79e0eac31516cc6774a33f87?"
								class="goodReaction-btn" />
						</div>
						<div class="div-10">
							<div class="member-nickName">고수달</div>
							<div class="trip-review-regDate">2024.04.17</div>
						</div>
					</div>
				</div>
			</div>
			<div class="trip-review-box">
				<img
					src="https://velog.velcdn.com/images/fake150907/post/16f9b770-cbf8-4b89-983c-929f7ad2843e/image.jpg"
					class="trip-review-thumbnail" />
				<div class="trip-review-hashTag-box">
					<div class="hashTag">#캠핑</div>
					<div class="hashTag">#알프스산맥</div>
					<div class="hashTag">#방구</div>
				</div>
				<div class="trip-review-information-box">
					<img
						src="https://velog.velcdn.com/images/fake150907/post/6e82a95f-9874-4838-9862-a90c025c101a/image.jpg"
						class="profile-image" />
					<div class="trip-review-information">
						<div class="div-8">
							<div class="trip-review-title">후후여행후기&gt;&lt;</div>
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2147d3e6324d81dc1a2909baba66e07251a734c79e0eac31516cc6774a33f87?"
								class="goodReaction-btn" />
						</div>
						<div class="div-10">
							<div class="member-nickName">고수달</div>
							<div class="trip-review-regDate">2024.04.17</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../common/foot.jspf"%>