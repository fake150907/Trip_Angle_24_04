<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="게시글 작성"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>
<!-- Article write 관련 -->
<script type="text/javascript">
//게시글 작성 폼 제출 여부를 확인하기 위한 변수
let ArticleWrite__submitFormDone = false;

// 게시글 작성 폼 제출 함수
function ArticleWrite__submit(form) {
	// 폼이 이미 제출된 경우 함수 종료
	if (ArticleWrite__submitFormDone) {
		return;
	}
	
	// 제목 필드의 값에서 공백 제거
	form.title.value = form.title.value.trim();
	
	// 제목이 비어 있는 경우 경고 메시지 출력
	if (form.title.value == 0) {
		alert('제목을 입력해주세요');
		return;
	}
	
	// Toast UI Editor 인스턴스를 가져옴
	const editor = $(form).find('.toast-ui-editor').data('data-toast-editor');
	
	// 에디터 내용에서 공백 제거
	const markdown = editor.getMarkdown().trim();
	
	// 에디터 내용이 비어 있는 경우 경고 메시지 출력 및 포커스 설정
	if (markdown.length == 0) {
		alert('내용을 입력해주세요');
		editor.focus();
		return;
	}
	
	// 이미지 파일 입력 필드의 이름 설정
	$('#fileInput').attr('name', 'file__article__' + ${currentId} + '__extra__Img__1');

	// 폼의 body 필드에 에디터 내용 설정
	form.body.value = markdown;

	// 폼이 제출되었음을 표시
	ArticleWrite__submitFormDone = true;
	
	// 폼 제출
	form.submit();
}
	}
</script>

<section class="mt-8 text-xl px-4">
	<h1 style="text-align: center; font-size: 25; margin-top: 100px; font-weight: 600;">여행 후기 작성</h1>
	<div class="mx-auto">
<%-- 		<div>${currentId }</div> --%>
		<form action="../tripReview/doReviewWrite" method="POST" onsubmit="ArticleWrite__submit(this); return false;"
			enctype="multipart/form-data">
			<input type="hidden" name=">${currentId }">
			<input type="hidden" name="body">
			<table class="write-box table-box-1 mx-auto" border="1">
				<tbody>
					<tr>
						<th style="font-weight: 600;">작성자</th>
						<td>
							<div>${rq.loginedMember.nickname }</div>
						</td>
					</tr>
					<tr>
						<th style="font-weight: 600">게시판</th>
						<td>
							<select class="select select-bordered select-sm w-full max-w-xs" name="boardId">
								<option value="2">여행 후기</option>
								<option value="1">공지사항</option>

							</select>
						</td>
					</tr>
					<tr>
						<th style="font-weight: 600">제목</th>
						<td>
							<input class="title input input-bordered input-md w-full " autocomplete="off" type="text"
								placeholder="제목을 입력해주세요" name="title" />
						</td>
					</tr>
					<tr>
						<th>첨부 이미지</th>
						<td>
							<input id="fileInput" placeholder="이미지를 선택해주세요" type="file" />
						</td>
					</tr>
					<tr>
						<th style="font-weight: 600">내용</th>
						<td>
							<div class="toast-ui-editor">
								<script type="text/x-template">
      </script>
							</div>
						</td>
					</tr>


					<tr>
						<th></th>
						<td style="text-align: left;">
							<button class="writeBtn btn btn-sm" type="submit" value="등록">등록</button>
							<span style="float: right;">
								<button class="backBtn btn btn-sm btn-ghost" class="" type="button" onclick="history.back();">뒤로가기</button>
							</span>
						</td>

					</tr>
				</tbody>
			</table>
		</form>

	</div>
</section>


<style>
.backBtn {
	color: #a9a9a9;
}

.writeBtn {
	background-color: #d5f1e2
}

.writeBtn:hover {
	background-color: #ededed;
	border: solid 1px #ededed;
}
</style>

<%@ include file="../common/foot.jspf"%>