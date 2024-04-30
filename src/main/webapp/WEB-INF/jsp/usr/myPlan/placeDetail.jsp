<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="추천 장소 상세보기"></c:set>
<%@ include file="../common/head.jspf"%>

<meta charset="utf-8">


<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06da921fb5b3ede9c345d161a3364b4e&libraries=services"></script>


<!-- 변수 -->


<script>

	var lat2 = 0.0; 
	var lon2 = 0.0;

	const params = {};
	params.id = parseInt('${param.id}');
	params.memberId = parseInt('${loginedMemberId}');
	
	console.log("params.id : "+params.id);
	console.log("params.memberId : "+params.memberId);
	
	var isAlreadyAddPlaceScrap = ${isAlreadyAddPlaceScrap};
	
	//var isAlreadyAddBadRp = ${isAlreadyAddBadRp};
	
	
</script>


<!-- 좋아요 싫어요  -->
<script>

	<!-- 좋아요 싫어요 버튼	-->
	function checkPlaceScrap() {
		if(isAlreadyAddPlaceScrap == true){
			$('#likeButton').toggleClass('btn-outline');
		}

		
		else {
			return;
		}
	}
	
	
	function doPlaceScrap(placeId) {
		
		//alert('ajax 실행됨');
		
		if(isNaN(params.memberId) == true){
			if(confirm('로그인 해야해. 로그인 페이지로 가실???')){
				var currentUri = encodeURIComponent(window.location.href);
				window.location.href = '../member/login?afterLoginUri=' + currentUri; // 로그인 페이지에 원래 페이지의 uri를 같이 보냄
			}
			return;
		}
		
		$.ajax({
			url: '/usr/placeScrap/doPlaceScrap', 
			type: 'POST',
			data: {placeId: placeId},
			dataType: 'json',
			success: function(data){
				console.log(data);
				console.log('data.data1Name : ' + data.data1Name);
				console.log('data.data1 : ' + data.data1);
				//console.log('data.data2Name : ' + data.data2Name);
				//console.log('data.data2 : ' + data.data2);
				if(data.resultCode.startsWith('S-')){
					var likeButton = $('#likeButton');
					var scrapCount = $('#scrapCount');
					//var DislikeButton = $('#DislikeButton');
					//var DislikeCount = $('#DislikeCount');
					
					if(data.resultCode == 'S-1'){
						likeButton.toggleClass('btn-outline');
						scrapCount.text(data.data1);
					}
					else if(data.resultCode == 'S-2'){
						//DislikeButton.toggleClass('btn-outline');
						//DislikeCount.text(data.data2);
						likeButton.toggleClass('btn-outline');
						scrapCount.text(data.data1);
					}else {
						likeButton.toggleClass('btn-outline');
						scrapCount.text(data.data1);
					}
					
				}else {
					alert(data.msg);
				}
		
			},
			error: function(jqXHR,textStatus,errorThrown) {
				alert('찜 오류 발생 : ' + textStatus);

			}
			
		});
	}
	

		
	$(function() {
		checkPlaceScrap();
	});
	
	
	
</script>


<!-- 댓글 수정 -->
<script>
function toggleModifybtn(placeReviewId) {
	
	console.log(placeReviewId);
	
	$('#modify-btn-'+placeReviewId).hide();
	$('#save-btn-'+placeReviewId).show();
	$('#placeReview-'+placeReviewId).hide();
	$('#modify-form-'+placeReviewId).show();
}

function doModifyPlaceReview(placeReviewId) {
	 console.log(placeReviewId); // 디버깅을 위해 replyId를 콘솔에 출력
	    
	    // form 요소를 정확하게 선택
	    var form = $('#modify-form-' + placeReviewId);
	    console.log(form); // 디버깅을 위해 form을 콘솔에 출력

	    // form 내의 input 요소의 값을 가져옵니다
	    var text = form.find('input[name="placeReview-text-' + placeReviewId + '"]').val();
	    console.log(text); // 디버깅을 위해 text를 콘솔에 출력

	    // form의 action 속성 값을 가져옵니다
	    var action = form.attr('action');
	    console.log(action); // 디버깅을 위해 action을 콘솔에 출력
	
    $.post({
    	url: '/usr/placeReview/doModify', // 수정된 URL
        type: 'POST', // GET에서 POST로 변경
        data: { id: placeReviewId, body: text }, // 서버에 전송할 데이터
        success: function(data) {
            $('#modify-form-'+placeReviewId).hide();
            $('#review-'+placeReviewId).text(data); // 수정된 리뷰 내용으로 업데이트
            $('#placeReview-'+placeReviewId).show();
            $('#save-btn-'+placeReviewId).hide();
            $('#modify-btn-'+placeReviewId).show();
        },
        error: function(xhr, status, error) {
            alert('리뷰 수정에 실패했습니다: ' + error);
        }
	})
}
</script>



<section class="place-detail-page">

	<div class="place-detail-page">
		<div class="detail-imgs">
			<div class="place-img-box-big li">
				<a href="${place.placeImgUrl1}">
					<img class="big-img"
						src="${place.placeImgUrl1} https://images.unsplash.com/photo-1484980972926-edee96e0960d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
						alt="이미지1" />
				</a>
			</div>
			<div class="place-img-box1 li">
				<a href="${place.placeImgUrl2}">
					<img class="sm-img1"
						src="${place.placeImgUrl2} https://images.unsplash.com/photo-1660495396534-c56f48502cc5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
						alt=" 이미지2" />
				</a>
			</div>
			<div class="place-img-box2 li">
				<a href="${place.placeImgUrl3}">
					<img class="sm-img2"
						src="${place.placeImgUrl3} https://images.unsplash.com/photo-1562785561-d88a65a2679e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
						alt="이미지3" />
				</a>
			</div>
			<div class="place-img-box3 li">
				<a href="${place.placeImgUrl4}">
					<img class="sm-img3"
						src="${place.placeImgUrl4} https://images.unsplash.com/photo-1533193773788-92826ee86674?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
						alt="이미지4" />
				</a>
			</div>
			<div class="place-img-box4 li">
				<a href="${place.placeImgUrl5}">
					<img class="sm-img4"
						src="${place.placeImgUrl5} https://images.unsplash.com/photo-1677517497394-87d635cf7e10?q=80&w=2050&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
						alt="이미지5" />
				</a>
			</div>
		</div>



	</div>


	<!-- 사진 아래 부분 -->

	<div class="info-and-review section-under-imgs">
		<!-- 카페 정보 -->
		<div class="place-info">
			<div class="place-name">Whowho Restaurant ${place.name}</div>
			<div class="place-address">Somewhere Ave. Honolulu, Hawaii ${place.address}</div>
			<div class="place-phone">+1-608-335-1396 ${place.phoneNum}</div>
			<div class="place-businessHours"> 매일 12:00 - 22:00
				<script>
            		// ${place.businessHours}를 세미콜론으로 분할하여 배열로 만듭니다.
            var businessHoursArray = "${place.businessHours}".split(';');

            		// 분할된 각 시간대를 화면에 표시합니다.
            businessHoursArray.forEach(function(hour) {
                document.write('<div>' + hour + '</div>');
            });
            
            console.log('${place.businessHours}');
       			</script>
			</div>
			<div class="like-count">
				<button class="material-symbols-outlined thumb_up" id="likeButton" onclick="doPlaceScrap(${param.id})">
				
					thumb_up</button>
				<div class="placeScrapCount" id="scrapCount">4.5 ${place.placeScrapCount}</div>
			</div>
			<div class="review-count">
				<div class="review-badge">리뷰</div>
				<div class="review-count-num">3 ${placeReviewsCount}</div>
			</div>

			<span class="material-symbols-outlined clock-circle" style="color: #a9a9a9"> schedule </span> <span
				class="material-symbols-outlined phone" style="color: #a9a9a9"> call </span> <span
				class="material-symbols-outlined store" style="color: #a9a9a9"> storefront </span>

			<p class="hashtag">${place.hashtag}</p>
		</div>


		<!-- 카페 지도 -->
		<div class="place-map">
			<!-- 			<img class="map-img" src="/" /> -->
			<div class="map-title">지도보기</div>

			<div id="map" style="width: 525px; height: 323px; top: 63px;"></div>
		</div>

		<!-- JavaScript 코드가 HTML 문서의 DOM 구조에 의존.
		 HTML 코드와 자바스크립트 코드가 상호 작용하기 때문에 자바스크립트 코드가 HTML 문서가 완전히 로드된 후 실행.
		 따라서 자바스크립트 코드를 HTML 문서의 아래에 배치. 
		 페이지의 모든 요소가 로드되고 DOM이 완전히 준비된 후에 자바스크립트 코드가 실행됨. -->

		<!-- 카페 지도API Javascript -->
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    		mapOption = {
        		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        		level: 3 // 지도의 확대 레벨
   		 	};  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${place.address}', function(result, status) {
   			// 정상적으로 검색이 완료됐으면 
     		if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        
		        //카페의 위도(lat|y) 경도(long|x)를 콘솔에 출력
		       	console.log("위도(lat|y) : " + result[0].y);
		       	console.log("경도(long|x) : " + result[0].x);
		       	
		       	lat2 = String(result[0].y);
		       	lon2 = String(result[0].x);
		       	
		       	console.log("new위도(lat|y) : " + lat2)
		        console.log("new경도(long|x) : " + lon2);
		       	
		       	showLatLon(lat2,lon2);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		
		        var marker = new kakao.maps.Marker({
		    		map: map,
		    		position: coords,
		    		image: new kakao.maps.MarkerImage(
		        	'https://velog.velcdn.com/images/yunlinit/post/8c994474-03a4-481f-9294-a3a3e201cb72/image.png',
		        new kakao.maps.Size(39, 39),
		        { offset: new kakao.maps.Point(16, 32) }
				    )
				});
		        	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0; font-size: 15px; color: black;">${place.name}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
    		} 
		});    
		
		function showLatLon(lat2, lon2) {
			var myLat, myLon;
			
			// 크롬브라우저 전용 사용자의 위도와 경도를 불러오는 함수
			navigator.geolocation.getCurrentPosition(function(position) {
	            myLat = position.coords.latitude;
	            myLon = position.coords.longitude;
	            
	            $.ajax({
			        type: "POST",
			        url: "/usr/findplace/distance", // 요청을 처리할 컨트롤러의 URL
			        contentType: "application/json", // id도 넘겨줘........ 
			        data: JSON.stringify({
			        	'myLat': myLat,
			        	'myLon': myLon,
			        	'placeLat': lat2,
			        	'placeLon': lon2
			        }),
			        //dataType: 'json',
			        success: function(distanceInKm) {
			            //alert("위도와 경도를 서버로 전송했습니다.\n * distanceInKm_Response : " + distanceInKm);
			            // 성공적으로 처리되었을 때 실행할 코드
			            $('.distance-num').text(distanceInKm+"km");
			        },
			        error: function(xhr, status, error) {
			            alert("에러면 표시 " + JSON.stringify(lat2));
			            // 오류 발생 시 실행할 코드
			            //JSON.stringify(lat2)
			        }
			    });
			});
		}
		
		</script>



		<!-- 카페정보 하단 -->
		<div class="review-group reviewlist-and-write">
			<!-- 리뷰 부분 -->
			<div class="review-section">
				<!-- 리뷰 작성 -->

				<div class="write-review-section">
					<div class="write-review">리뷰 작성</div>

					<c:if test="${rq.isLogined() }">
						<div class="review-input-area">

							<form action="../placeReview/doWrite" method="POST">
								<input type="hidden" name="placeId" value="${place.id }" /> <input type="text" autocomplete="off"
									placeholder="리뷰를 남겨주세요" name="body" class="review-input-box input input-bordered input-md w-full " />
								<!-- 								<button class="review-write-btn btn btn-sm">등록</button> -->
								<input class="review-write-btn btn btn-sm" type="submit" value="등록" />
							</form>
						</div>
					</c:if>
					<c:if test="${!rq.isLogined() }">
						<a href="${rq.loginUri }" style="text-decoration: underline; font-weight: 600;">로그인</a> 후 이용해주세요.
				</c:if>
				</div>

				<!-- 리뷰 목록 -->
				<div class="review-list">
					<div class="review-title">리뷰 (${placeReviewsCount})</div>

					<c:forEach var="placeReview" items="${placeReviews }">
						<div class="show-review-box">
							<div class="user-nickname 리뷰작성자">${placeReview.extra__writer }
								<div id="reviewRegDate-${placeReview.id }" style="font-size: 11px; font-weight: 300; color: #a9a9a9;">${placeReview.regDate.substring(0,10) }</div>
							</div>


							<div class="review-body 리뷰내용">
								<span id="review-${placeReview.id }">${placeReview.body }</span>
								<form method="POST" id="modify-form-${placeReview.id }"
									style="display: none; position: absolute; top: 20px; left: 0; width: 100%; z-index: 1;"
									action="/usr/placeReview/doModify">
									<input style="width: 1110px; height: 35px; margin-top: -17px;" type="text" value="${placeReview.body }"
										name="placeReview-text-${placeReview.id }" />
								</form>
							</div>

							<!-- 	수정 삭제 버튼		 -->
							<div class="mod-del-btns"
								style="font-weight: 500; color: #a9a9a9; margin-top: 89px; margin-left: 17px; font-size: 11px;">
								<c:if test="${placeReview.userCanModify }">
									<button onclick="toggleModifybtn('${placeReview.id}');" id="modify-btn-${placeReview.id }"
										style="white-space: nowrap;">수정</button>
									<button onclick="doModifyPlaceReview('${placeReview.id}');" style="white-space: nowrap; display: none;"
										id="save-btn-${placeReview.id }">저장</button>

								</c:if>

								<c:if test="${placeReview.userCanDelete }">
									<a style="white-space: nowrap; margin-left: 10px;" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
										href="../placeReview/doDelete?id=${placeReview.id }">삭제</a>
								</c:if>
							</div>

						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>





<div class="slide-overlay">
	<button class="close-btn">
		<span class="material-symbols-outlined close"> close </span>
	</button>
	<button class="slide-btn --prev">
		<span class="material-symbols-outlined left "> chevron_left </span>
	</button>
	<button class="slide-btn --next">
		<span class="material-symbols-outlined right"> chevron_right </span>
	</button>
	<div class="slide__container">
		<ul class="slides">
			<li><img src="" alt="이미지1"></li>
			<li><img src="" alt="이미지2"></li>
			<li><img src="" alt="이미지3"></li>
			<li><img src="" alt="이미지4"></li>
			<li><img src="" alt="이미지5"></li>
		</ul>
	</div>
</div>



<style>
/* 슬라이드 팝업창 */
.slide-overlay {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.8);
	display: none;
	z-index: 999; /* 다른 요소 위에 보이도록 설정 */
}

.slide__container {
	position: absolute;
	height: 100%; /* 이미지에 맞게 자동 조정되도록 변경 */
	max-width: 80%; /* 최대 너비 설정 */
	max-height: 70%; /* 최대 높이 설정 */
	top: 50%;
	left: 50%;
	transform: translate(-50%, -45%);
	overflow: hidden;
}

.slide__container>img {
	position: absolute;
	left: 50%;
	transform: translate(-50%, -50%);
	max-width: 100%; /* 이미지의 원본 비율을 유지하면서 이미지의 더 긴쪽에 맞춤 */
	max-height: 100%; /* 이미지의 원본 비율을 유지하면서 이미지의 더 긴쪽에 맞춤 */
}

.slide__container>img {
	position: absolute;
	left: 50%;
	transform: translate(-50%, -50%);
	max-width: 100%; /* 이미지의 원본 비율을 유지하면서 이미지의 더 긴쪽에 맞춤 */
	max-height: 100%; /* 이미지의 원본 비율을 유지하면서 이미지의 더 긴쪽에 맞춤 */
}

.slides {
	display: flex; /* Flexbox를 사용하여 이미지를 가로로 나열 */
	justify-content: center;
}

.slides>li {
	flex: 0 0 auto; /* Flex 아이템이 컨테이너 크기에 맞게 자동으로 크기 조정 */
	list-style: none; /* 목록 마커 제거 */
	margin-right:; /* 이미지 간격 조정 */
	display: none; /* 이미지 간격 없애고 숨김 */
}

.slides>li:first-child {
	display: block; /* 첫 번째 이미지만 보이도록 설정 */
}

/*------------- 요기부터 수정 하지마~-------------*/
.slide-btn {
	color: white;
	font-size: 200px;
	font-weight: 800;
	position: absolute;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	border: none;
	background-color: transparent;
	cursor: pointer;
	top: 50%;
	transform: translateY(-50%);
	z-index: 999; /* 다른 요소 위에 보이도록 설정 */
}

.--prev {
	left: 20%;
}

.--next {
	right: 20%;
}

.close {
	text-align: center;
	font-size: 50px;
}

.left, .right {
	text-align: center;
	font-size: 60px;
}

.close-btn {
	right: 20%;
	color: white;
	font-weight: 600;
	position: absolute;
	background-color: transparent;
	cursor: pointer;
	top: 15%;
	transform: translateY(-50%);
	z-index: 999; /* 다른 요소 위에 보이도록 설정 */
}

#bullets {
	position: absolute;
	bottom: 3%;
	left: 50%;
	transform: translateX(-50%);
}

#bullets>li {
	float: left;
	margin: 0 8px;
	list-style: none; /* 목록 마커 제거 */
}

#bullets>li>a {
	display: block;
	text-decoration: none;
	color: transparent;
	width: 1em;
	height: 1em;
	background-color: rgb(165, 165, 165);
	border-radius: 50%;
	transition: 0.2s;
}

#bullets>li>a.on {
	background-color: white;
}

/* -----------------여기는 기본 레이아웃------------------------- */
.place-detail-page {
	margin: 0 auto; /* 화면 좌우 가운데 정렬 */
	/* 그 외의 스타일 속성들 */
}

.place-detail-page {
	background-color: #ffffff;
	display: flex;
	flex-direction: row;
	justify-content: center;
	margin-top: 80px;
	/* 	width: 100%; */
}

.place-detail-page {
	background-color: #ffffff;
	width: 1155px;
	/* 	height: 1024px; */
	position: relative;
}

.place-detail-page .section-under-imgs {
	position: absolute;
	width: 1160px;
	height: 1130px;
	top: 508px;
	/* 	left: 60px; */
}

.place-detail-page .review-group {
	width: 1155px;
	top: 10px;
	left: 5px;
	padding-bottom: 20px; /* review-box 밑에 20px 공간을 만듭니다 */
}

.place-detail-page .review-section {
	position: absolute;
	width: 1155px;
	top: 500px;
	left: 0;
	bottom: 0;
}

.place-detail-page .review-box {
	position: absolute;
	width: 1155px;
	top: 401px;
	left: 0;
	background-color: #f5f5f5;
	border-radius: 10px;
}

.place-detail-page .user-nickname {
	position: absolute;
	width: 207px;
	height: 32px;
	top: 10px;
	left: 17px;
	font-weight: 600;
	color: #333333;
	font-size: 18px;
	letter-spacing: 0;
	line-height: normal;
}

.place-detail-page .review-body {
	position: absolute;
	width: 1130px;
	height: 39px;
	top: 47px;
	left: 17px;
	font-weight: 500;
	color: #333333;
	font-size: 15px;
	letter-spacing: 0;
	line-height: 20px;
	overflow-y: auto;
}

.place-detail-page .review-list {
	position: absolute;
	width: 1155px;
	/* 	height: 100%; */
	top: 223px;
	left: 0;
	display: flex;
	flex-direction: column;
}

.place-detail-page .review-box-2 {
	top: 0;
	position: absolute;
	width: 1155px;
	height: 130px;
	left: 0;
	background-color: #f5f5f5;
	border-radius: 10px;
}

.place-detail-page .text-wrapper {
	all: unset;
	box-sizing: border-box;
	width: 30px;
	top: 12px;
	left: 135px;
	color: #6d6d6d;
	position: absolute;
	height: 32px;
	font-weight: 600;
	font-size: 12px;
	text-align: center;
	letter-spacing: 0;
	line-height: normal;
}

.place-detail-page .show-review-box {
	top: 53px;
	/* 	position: absolute; */
	width: 1155px;
	height: 110px;
	left: 0;
	background-color: #f5f5f5;
	border-radius: 10px;
	margin-bottom: 20px;
	position: relative;
}

.place-detail-page .review-title {
	width: 814px;
	height: 39px;
	top: -1px;
	left: 2px;
	font-weight: 600;
	color: #222222;
	font-size: 24px;
	letter-spacing: 0;
	position: absolute;
	line-height: normal;
}

.place-detail-page .write-review-section {
	width: 1171px;
	height: 100%;
	top: 59px;
	position: absolute;
	left: 0;
}

.place-detail-page .review-input-box {
	position: relative;
	width: 1148px;
	height: 83px;
	top: 0;
	left: 4px;
	background-color: #ffffff;
	border-radius: 10px;
	border: 1px solid;
	border-color: #d9d9d9;
}

.place-detail-page .review-write-btn {
	margin-top: 10px;
	margin-left: 4px;
}

.place-detail-page .placeholder {
	width: 243px;
	height: 43px;
	top: 5px;
	left: 16px;
	font-weight: 400;
	color: #a8a8a8;
	font-size: 15px;
	letter-spacing: 0;
	position: absolute;
	line-height: normal;
}

.place-detail-page .write-review {
	width: 814px;
	height: 39px;
	top: -54px;
	left: 2px;
	font-weight: 600;
	color: #222222;
	font-size: 24px;
	letter-spacing: 0;
	position: absolute;
	line-height: normal;
}

.place-detail-page .place-map {
	width: 525px;
	height: 323px;
	left: 627px;
	position: absolute;
	top: 0;
}

.place-detail-page .map-img {
	position: absolute;
	width: 397px;
	height: 235px;
	top: 47px;
	left: 36px;
	object-fit: cover;
	background-color: #a9a9a9;
}

.place-detail-page .map-title {
	width: 269px;
	height: 28px;
	top: 16px;
	left: 10px;
	font-weight: 600;
	color: #222222;
	font-size: 20px;
	letter-spacing: 0;
	position: absolute;
	line-height: normal;
}

.place-detail-page .place-info {
	width: 621px;
	height: 500px;
	left: 0;
	overflow: hidden;
	position: absolute;
	top: 0;
}

.place-detail-page .place-distance {
	position: absolute;
	width: 60px;
	height: 20px;
	top: 85px;
	left: 6px;
	background-color: #e3e3e3;
	border-radius: 5px;
}

.place-detail-page .num-km-group {
	width: 35px;
	height: 15px;
	left: 6px;
	position: relative;
	top: -1px;
}

.place-detail-page .km {
	position: absolute;
	width: 20px;
	height: 15px;
	top: 3px;
	left: 30px;
	font-family: "Pretendard";
	font-weight: 600;
	color: #000000;
	font-size: 13px;
	letter-spacing: 0;
	line-height: normal;
}

.place-detail-page .distance-num {
	position: absolute;
	width: 25px;
	height: 15px;
	top: 3px;
	left: 0;
	font-family: "Pretendard";
	font-weight: 600;
	color: #000000;
	font-size: 13px;
	letter-spacing: 0;
	line-height: normal;
}

.place-detail-page .place-name {
	width: 814px;
	height: 39px;
	top: 10px;
	left: 6px;
	font-weight: 600;
	color: #222222;
	font-size: 32px;
	letter-spacing: 0;
	position: absolute;
	line-height: normal;
}

.place-detail-page .place-address {
	width: 796px;
	height: 17px;
	top: 60px;
	left: 6px;
	font-weight: 600;
	color: #666666;
	font-size: 16px;
	letter-spacing: 0;
	white-space: nowrap;
	position: absolute;
	line-height: normal;
}

.place-detail-page .place-businessHours {
	width: 550px;
	height: 17px;
	top: 265px;
	left: 44px;
	font-weight: 500;
	color: #333333;
	font-size: 16px;
	letter-spacing: 0;
	white-space: nowrap;
	position: absolute;
	line-height: normal;
	word-wrap: normal;
}

.place-detail-page .place-phone {
	position: absolute;
	width: 796px;
	height: 17px;
	top: 173px;
	left: 44px;
	font-weight: 500;
	color: #333333;
	font-size: 16px;
	letter-spacing: 0;
	line-height: normal;
	white-space: nowrap;
}

.place-detail-page .place-facility {
	width: 796px;
	height: 17px;
	top: 219px;
	left: 44px;
	font-weight: 500;
	color: #333333;
	font-size: 16px;
	letter-spacing: 0;
	white-space: nowrap;
	position: absolute;
	line-height: normal;
}

.place-detail-page .like-count {
	position: absolute;
	width: 63px;
	height: 21px;
	top: 110px;
	left: 7px;
}

.place-detail-page .thumb_up {
	position: absolute;
	color: black;
	font-size: 20px;
	top: 1px;
}

.place-detail-page .placeScrapCount {
	left: 23px;
	position: absolute;
	width: 20px;
	height: 15px;
	top: 2px;
	font-weight: 500;
	color: #000000;
	font-size: 16px;
	letter-spacing: 0;
	line-height: normal;
	white-space: nowrap;
}

.place-detail-page .review-count {
	position: absolute;
	width: 63px;
	height: 21px;
	top: 110px;
	left: 78px;
}

.place-detail-page .review-badge {
	width: 30px;
	height: 15px;
	top: 2px;
	left: 1px;
	font-weight: 500;
	color: #000000;
	font-size: 16px;
	letter-spacing: 0;
	white-space: nowrap;
	position: absolute;
	line-height: normal;
}

.place-detail-page .review-count-num {
	left: 34px;
	position: absolute;
	width: 20px;
	height: 15px;
	top: 2px;
	font-weight: 500;
	color: #000000;
	font-size: 16px;
	letter-spacing: 0;
	line-height: normal;
	white-space: nowrap;
}

.place-detail-page .clock-circle {
	position: absolute;
	width: 24px;
	height: 24px;
	top: 265px;
	left: 6px;
}

.place-detail-page .phone {
	position: absolute;
	width: 24px;
	height: 24px;
	top: 173px;
	left: 6px;
}

.place-detail-page .store {
	position: absolute;
	width: 24px;
	height: 24px;
	top: 219px;
	left: 6px;
}

.place-detail-page .hashtag {
	width: 500x;
	height: 15px;
	top: 143px;
	left: 7px;
	font-weight: 500;
	color: #333333;
	font-size: 13px;
	letter-spacing: 0;
	position: absolute;
	line-height: normal;
}

.place-detail-page .detail-imgs {
	position: absolute;
	width: 1149px;
	height: 466px;
	top: -60px;
	overflow: hidden;
	background-color: white;
}

.place-detail-page .sm-img4 {
	position: absolute;
	width: 261px;
	height: 229px;
	top: 237px;
	left: 889px;
	object-fit: cover;
}

.place-detail-page .sm-img3 {
	position: absolute;
	width: 261px;
	height: 230px;
	top: 0;
	left: 889px;
	object-fit: cover;
}

.place-detail-page .sm-img2 {
	position: absolute;
	width: 261px;
	height: 229px;
	top: 237px;
	left: 621px;
	object-fit: cover;
}

.place-detail-page .sm-img1 {
	position: absolute;
	width: 261px;
	height: 230px;
	top: 0;
	left: 621px;
	object-fit: cover;
}

/* 제일 큰 사진 */
.place-detail-page .big-img {
	position: absolute;
	width: 614px;
	height: 466px;
	top: 0;
	left: 0;
	object-fit: cover;
}
</style>

<script>


const overlay = document.querySelector(".slide-overlay");
const slides = document.querySelectorAll(".slides > li > img");
const thumbnails = document.querySelectorAll(
  ".place-detail-page .detail-imgs .li img"
);
const photoCount = slides.length;
const duration = 400;
let bullets = 0;
let photoIndex = 0;

thumbnails.forEach((thumbnail, index) => {
  thumbnail.addEventListener("click", (e) => {
    e.preventDefault();
    overlay.style.display = "block";
    photoIndex = index;
    setCurrentSlide(photoIndex);
  });
});

document.querySelector(".close-btn").addEventListener("click", () => {
  overlay.style.display = "none";
});

function setCurrentSlide(index) {
  slides.forEach((slide, i) => {
    slide.src = thumbnails[(index + i) % thumbnails.length].src;
  });
}

function createBullets() {
  const bulletsList = document.createElement("ul");
  bulletsList.setAttribute("id", "bullets");
  overlay.appendChild(bulletsList);
  slides.forEach((slide, index) => {
    const a = document.createElement("a");
    a.setAttribute("href", "#");
    a.innerHTML = `${index}`;
    const li = document.createElement("li");
    li.appendChild(a);
    bulletsList.appendChild(li);
  });
  return (bullets = document.querySelectorAll("#bullets > li > a"));
}
createBullets();
bulletLink();

function bulletLink() {
  bullets.forEach((bullet, index) => {
    bullet.addEventListener("click", (e) => {
      e.preventDefault();
      const clickedIndex = index;
      let step = clickedIndex - photoIndex;
      photoIndex = clickedIndex;
      bulletClassReset();
      bullets[clickedIndex].classList.add("on");
      slides.forEach((slide, i) => {
        slide.src = thumbnails[(photoIndex + i) % thumbnails.length].src;
      });
    });
  });
}

thumbnails.forEach((thumbnail, index) => {
  thumbnail.addEventListener("click", (e) => {
    e.preventDefault();
    const clickedIndex = index;
    photoIndex = clickedIndex;
    bulletClassReset();
    bullets[clickedIndex].classList.add("on");
    slides.forEach((slide, i) => {
      slide.src = thumbnails[(photoIndex + i) % thumbnails.length].src;
    });
  });
});

document.querySelector(".--next").addEventListener("click", nextSlideImage);
document.querySelector(".--prev").addEventListener("click", prevSlideImage);

function nextSlideImage() {
  photoIndex++;
  photoIndex %= photoCount;
  bulletClassReset();
  bullets[photoIndex].classList.add("on");
  slides.forEach((slide, i) => {
    slide.src = thumbnails[(photoIndex + i) % thumbnails.length].src;
  });
}

function prevSlideImage() {
  photoIndex--;
  if (photoIndex < 0) {
    photoIndex = photoCount - 1;
  }
  bulletClassReset();
  bullets[photoIndex].classList.add("on");
  slides.forEach((slide, i) => {
    slide.src = thumbnails[(photoIndex + i) % thumbnails.length].src;
  });
}

function bulletClassReset() {
  bullets.forEach((bullet) => {
    bullet.classList.remove("on");
  });
}


</script>






<%-- <%@ include file="../common/foot.jspf"%> --%>