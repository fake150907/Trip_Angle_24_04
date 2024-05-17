<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="회원가입"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- lodash debounce -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
<script>
let submitJoinFormDone = false;
let validLoginId = "";

// 회원가입 폼 제출 함수 주석
function submitJoinForm(form) {
    // 이미 제출된 폼이면 실행 중단
    if (submitJoinFormDone) {
        alert('처리 중입니다.');
        return;
    }
    
    // 로그인 아이디 trim 처리
    form.loginId.value = form.loginId.value.trim();
    // 아이디 입력값이 없을 경우 알림
    if (form.loginId.value == 0) {
        alert('아이디를 입력해주세요.');
        return;
    }

    // 유효한 아이디가 아닐 경우 알림
    if (form.loginId.value != validLoginId) {
        alert('사용할 수 없는 아이디입니다.');
        form.loginId.focus();
        return;
    }
    
    // 로그인 비밀번호 trim 처리
    form.loginPw.value = form.loginPw.value.trim();
    // 비밀번호 입력값이 없을 경우 알림
    if (form.loginPw.value == 0) {
        alert('비밀번호를 입력해주세요.');
        return;
    }
    
    // 비밀번호 확인 trim 처리
    form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
    // 비밀번호 확인 입력값이 없을 경우 알림
    if (form.loginPwConfirm.value == 0) {
        alert('비밀번호 확인을 입력해주세요.');
        return;
    }
    
    // 비밀번호 일치 여부 확인
    if (form.loginPwConfirm.value != form.loginPw.value) {
        alert('비밀번호가 일치하지 않습니다.');
        form.loginPw.focus();
        return;
    }
    
    // 이름 trim 처리
    form.name.value = form.name.value.trim();
    // 이름 입력값이 없을 경우 알림
    if (form.name.value == 0) {
        alert('이름을 입력해주세요.');
        return;
    }
    
    // 닉네임 trim 처리
    form.nickname.value = form.nickname.value.trim();
    // 닉네임 입력값이 없을 경우 알림
    if (form.nickname.value == 0) {
        alert('닉네임을 입력해주세요.');
        return;
    }
    
    // 이메일 trim 처리
    form.email.value = form.email.value.trim();
    // 이메일 입력값이 없을 경우 알림
    if (form.email.value == 0) {
        alert('이메일을 입력해주세요.');
        return;
    }
    
    // 전화번호 trim 처리
    form.cellphoneNum.value = form.cellphoneNum.value.trim();
    // 전화번호 입력값이 없을 경우 알림
    if (form.cellphoneNum.value == 0) {
        alert('전화번호를 입력해주세요.');
        return;
    }
    
    // 폼 제출 완료 상태로 변경
    submitJoinFormDone = true;
    // 폼 제출
    form.submit();
}

//로그인 아이디 중복 확인 함수 주석
function checkLoginIdDup(el) {
    // 중복 확인 메시지 영역 비우기
    $('.checkDup-msg').empty();
    // 폼 요소 가져오기
    const form = $(el).closest('form').get(0);
    // 로그인 아이디 값이 없으면 유효한 아이디 초기화 후 종료
    if (form.loginId.value.length == 0) {
        validLoginId = '';
        return;
    }
    // AJAX를 통해 중복 확인 요청
    $.get('../member/getLoginIdDup', {
        isAjax: 'Y',
        loginId: form.loginId.value
    }, function (data) {
        // 중복 확인 메시지 출력
        $('.checkDup-msg').html('<div class="mt-2">' + data.msg + '</div>')
        // 중복이 아닐 경우 유효한 아이디 설정
        if (data.success) {
            validLoginId = data.data1;
        } else {
            validLoginId = '';
        }
    }, 'json');
}

// 중복 확인 디바운스 처리 함수
const checkLoginIdDupDebounced = _.debounce(checkLoginIdDup, 600);
</script>
<style>
.mint-line {
	background-color: #d5f1e2;
	margin-top: 10px;
	height: 3px;
	width: 75px;
	margin-left: 8px;
}

.title {
	font-weight: 500;
	color: #666666;
	margin-left: 10px;
}

.Join {
	width: 100%;
	height: 100vh;
	display: flex;
	flex-direction: column;
	margin-top: 10%;
	align-items: center;
	font-family: Pretendard;
}

.JoinBox {
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

.checkDup-msg {
	width: 215px;
	height: 24px;
	left: 184px;
	top: 120px;
	font-size: 12px;
	color: red;
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

.PwCheckBox {
	width: 222px;
	height: 24px;
	left: 120px;
	top: 230px;
	position: absolute;
	display: flex;
	align-items: center;
}

.NameBox {
	width: 215px;
	height: 24px;
	left: 120px;
	top: 300px;
	position: absolute;
	display: flex;
	align-items: center;
}

.NicknameBox {
	width: 215px;
	height: 24px;
	left: 120px;
	top: 370px;
	position: absolute;
	display: flex;
	align-items: center;
}

.PhoneNumBox {
	width: 222px;
	height: 24px;
	left: 120px;
	top: 440px;
	position: absolute;
	display: flex;
	align-items: center;
}

.EmailBox {
	width: 215px;
	height: 24px;
	left: 120px;
	top: 510px;
	position: absolute;
	display: flex;
	align-items: center;
}

.IdBox .material-symbols-outlined, .PwBox .material-symbols-outlined,
	.PwCheckBox .material-symbols-outlined, .NameBox .material-symbols-outlined,
	.NicknameBox .material-symbols-outlined, .PhoneNumBox .material-symbols-outlined,
	.EmailBox .material-symbols-outlined {
	/* 변경 */
	margin-right: 30px;
	color: #666666;
}

.Rectangle6 {
	width: 500px;
	height: 670px;
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
	font-weight: 500;
}

.loginBtn {
	width: 74px;
	height: 39px;
	position: absolute;
	right: 0px;
	top: 40px;
	color: #a9a9a9;
	font-size: 12px;
	font-weight: 500;
}

.joinBtn {
	width: 100px;
	height: 39px;
	position: absolute;
	left: 40%;
	bottom: 30px;
	background-color: #d5f1e2;
}

.joinBtn:hover {
	width: 100px;
	height: 39px;
	position: absolute;
	left: 40%;
	bottom: 30px;
	background-color: #ededed;
	border: solid #ededed;
}
</style>




<section>
	<div class="Join">
		<div class="JoinBox">
			<div class="Rectangle6">
				<section class="mt-8 text-xl px-4">
					<form action="../member/doJoin" method="POST">
						<!-- 					<form method="POST" action="../member/doJoin" onsubmit="submitJoinForm(this); return false;"> -->
						<!-- 					내가 뭔가 잘못 복붙해온듯.... -->

						<input type="hidden" name="afterLoginUri"
							value="${param.afterLoginUri}" />
						<div class="title">회원가입</div>
						<div class="mint-line"></div>

						<div class="IdBox">
							<span class="material-symbols-outlined"> person_edit </span> <input
								id="loginId" onkeyup="checkLoginIdDupDebounced(this);"
								class="input input-sm w-full max-w-xs" autocomplete="off"
								type="text" placeholder="아이디를 입력해주세요" name="loginId" />
						</div>
						<div class="checkDup-msg "></div>

						<div class="PwBox">
							<span class="material-symbols-outlined"> lock </span> <input
								id="loginPw" class="input input-sm w-full max-w-xs"
								autocomplete="off" type="password" placeholder="비밀번호를 입력해주세요"
								name="loginPw" />
						</div>

						<div class="PwCheckBox">
							<span class="material-symbols-outlined"> check_circle </span> <input
								id="loginPwCheck" class="input input-sm w-full max-w-xs"
								autocomplete="off" type="password" placeholder="비밀번호를 확인해주세요"
								name="loginPwCheck" />
						</div>
						<div class="NameBox">
							<span class="material-symbols-outlined"> person </span> <input
								id="name" class="input input-sm w-full max-w-xs"
								autocomplete="off" type="text" placeholder="이름을 입력해주세요"
								name="name" />
						</div>
						<div class="NicknameBox">
							<span class="material-symbols-outlined"> person_edit </span> <input
								id="name" class="input input-sm w-full max-w-xs"
								autocomplete="off" type="text" placeholder="닉네임 입력해주세요"
								name="nickname" />
						</div>
						<div class="PhoneNumBox">
							<span class="material-symbols-outlined"> call </span> <input
								id="cellphoneNum" class="input input-sm w-full max-w-xs"
								autocomplete="off" type="text" placeholder="전화번호를 입력해주세요"
								name="cellphoneNum" />
						</div>
						<div class="EmailBox">
							<span class="material-symbols-outlined"> mail </span> <input
								id="email" class="input input-sm w-full max-w-xs"
								autocomplete="off" type="text" placeholder="이메일을 입력해주세요"
								name="email" />
						</div>

						<input class="joinBtn btn btn-sm" type="submit" value="회원가입" />

					</form>
					<div class="btns">
						<button class="backBtn" type="button" onclick="history.back();">뒤로가기</button>
						<a class="loginBtn" href="../member/login">로그인</a>

					</div>
				</section>
			</div>
		</div>
	</div>
</section>


<%@ include file="../common/foot.jspf"%>