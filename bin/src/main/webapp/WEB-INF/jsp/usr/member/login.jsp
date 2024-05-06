<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="로그인"></c:set>
<%@ include file="../common/head.jspf"%>





<section>
	<div class="Login">
		<div class="LoginBox">
			<div class="Rectangle6">
				<section class="mt-8 text-xl px-4">
					<div class="mx-auto">
						<form action="../member/doLogin" method="POST">

							<input type="hidden" name="afterLoginUri"
								value="${param.afterLoginUri}" />
							<div class="title">로그인</div>
							<div class="mint-line"></div>

							<div class="IdBox">
								<span class="material-symbols-outlined"> person </span> <input
									id="loginId" class="input input-sm w-full max-w-xs"
									autocomplete="off" type="text" placeholder="아이디를 입력해주세요"
									name="loginId" />
							</div>
							<div class="PwBox">
								<span class="material-symbols-outlined"> lock </span> <input
									id="loginPw" class="input input-sm w-full max-w-xs"
									autocomplete="off" type="password" placeholder="비밀번호를 입력해주세요"
									name="loginPw" />
							</div>

							<input class="loginBtn btn btn-sm" type="submit" value="로그인" />

						</form>
						<div class="btns">
							<button class="backBtn" type="button" onclick="history.back();">뒤로가기</button>
							<a class="joinBtn" href="../member/join">회원가입</a>

						</div>

<!-- 						<div class="spotify-wrapper"> -->
<!-- 							<a class="spotify-btn" href="/"> <img -->
<!-- 								src="https://velog.velcdn.com/images/yunlinit/post/9169e991-187d-44b4-ab8f-a8223651ad66/image.png" -->
<!-- 								alt="Spotify로 시작하기"> -->
<!-- 							</a> -->
<!-- 						</div> -->

					</div>
				</section>
			</div>
		</div>
	</div>
</section>

<style>
.mint-line {
	background-color: #d5f1e2;
	margin-top: 10px;
	height: 3px;
	width: 60px;
	margin-left: 8px;
}

.title {
	font-weight: 500;
	color: #696969;
	margin-left: 10px;
}

.Login {
	width: 100%;
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	font-family: Pretendard;
}

.LoginBox {
	width: 500px;
	height: 311px;
	position: relative;
}

.IdBox {
	width: 215px;
	height: 24px;
	left: 120px;
	top: 90px;
	position: absolute;
	display: flex;
	align-items: center;
}

.PwBox {
	width: 222px;
	height: 24px;
	left: 120px;
	top: 160px;
	position: absolute;
	display: flex;
	align-items: center;
}

.IdBox .material-symbols-outlined, .PwBox .material-symbols-outlined {
	/* 변경 */
	margin-right: 30px;
	color: #666666;
}

.Rectangle6 {
	width: 500px;
	height: 300px;
	left: 0px;
	top: 0px;
	position: absolute;
	background: rgba(255, 255, 255, 0);
	border-radius: 15px;
	border: 1px #cacaca solid;
}

.backBtn {
	width: 74px;
	height: 39px;
	position: absolute;
	right: 15px;
	bottom: 20px;
	color: #a9a9a9;
	font-size: 12px;
	font-weight: 400;
}

.joinBtn {
	width: 74px;
	height: 39px;
	position: absolute;
	right: 0px;
	top: 40px;
	color: #a9a9a9;
	font-size: 12px;
	font-weight: 400;
}

.loginBtn {
	width: 100px;
	height: 39px;
	position: absolute;
	left: 40%;
	bottom: 10%;
	background-color: #d5f1e2;
}

.loginBtn:hover {
	width: 100px;
	height: 39px;
	position: absolute;
	left: 40%;
	bottom: 10%;
	background-color: #ededed;
	border: solid #ededed;
}

.spotify-wrapper {
    position: absolute; /* 절대 위치 지정 */
    bottom: 22px; /* 원하는 위치로 조정 */
    left: 50%; /* 왼쪽으로부터 중앙에 배치 */
    transform: translateX(-50%); /* 중앙 정렬 */
}

/* .spotify-btn img { */
/*     /* 이미지에 대한 스타일 */ */
/*     width: 100px; */
/*     height: auto; */
/* } */



</style>





<%@ include file="../common/foot.jspf"%>S
