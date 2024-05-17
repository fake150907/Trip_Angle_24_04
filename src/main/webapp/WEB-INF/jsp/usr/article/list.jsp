S<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="TripAngle | #{board.name }"></c:set>
<%-- <c:set var="pageTitle" value="#{board.name }"></c:set> --%>
<%@ include file="../common/head.jspf"%>

<style>
.writeBtn {
	background-color: #d5f1e2
}

.writeBtn:hover {
	background-color: #ededed;
	border: solid 1px #ededed;
}
</style>

</head>

<!-- 리스트 -->
<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto">


		<h1 style="text-align: center; font-size: 25; margin-top: 100px;">${board.name}</h1>
		<div class="area-for-badge mx-auto"
			style="width: 50%; position: relative;">
			<div class="badge badge-outline" style="margin-bottom: 10px;">${articlesCount }개</div>
		</div>

	</div>
	<table class="table-box-1 table mx-auto custom-table"
		style="width: 50%;">
		<colgroup>
			<col style="width: 8%" />
			<col style="width: 50%" />
			<col style="width: 10%" />
			<col style="width: 15%" />
			<col style="width: 5%" />
			<col style="width: 5%" />
			<col style="width: 5%" />
		</colgroup>
		<thead>
			<tr>
				<th style="background-color: #F2FBF6;">번호</th>
				<th style="text-align: center; background-color: #F2FBF6;">제목</th>
				<th style="background-color: #F2FBF6;">작성자</th>
				<th style="text-align: center; background-color: #F2FBF6;">날짜</th>
				<th style="text-align: center; background-color: #F2FBF6;">조회수</th>
				<th style="text-align: center; background-color: #F2FBF6;">좋아요</th>
				<th style="text-align: center; background-color: #F2FBF6;">싫어요</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="article" items="${articles }">
				<!-- articles 리스트를 반복하면서 각 article 객체를 처리 -->
				<tr class="hover">
					<td>${article.id }</td>
					<!-- article의 id 출력 -->
					<td><a href="detaiSl?id=${article.id }"> ${article.title }
							<!-- article의 제목 출력 --> <c:if
								test="${article.extra__repliesCnt > 0 }">
								<!-- 댓글 개수가 0보다 크면 -->
								<span style="color: red;">[${article.extra__repliesCnt }]</span>
								<!-- 댓글 개수 출력 -->
							</c:if>
					</a></td>
					<td>${article.extra__writer }</td>
					<!-- article 작성자 출력 -->
					<td style="text-align: center;">${article.regDate.substring(0,10) }</td>
					<!-- 등록 날짜 출력 (YYYY-MM-DD 형식) -->
					<td style="text-align: center;">${article.hitCount }</td>
					<!-- 조회수 출력 -->
					<td style="text-align: center;">${article.goodReactionPoint }</td>
					<!-- 좋아요 개수 출력 -->
					<td style="text-align: center;">${article.badReactionPoint }</td>
					<!-- 싫어요 개수 출력 -->
				</tr>
			</c:forEach>

		</tbody>
	</table>

	<!-- 	글쓰기버튼 -->
	<c:if test="${member.loginId eq 'admin'}">
		<div class="area-for-writeBtn mx-auto"
			style="width: 50%; position: relative;">
			<a class="writeBtn btn btn-sm" href="../article/write"
				style="position: absolute; right: 15px; top: 15px;">글쓰기</a>
		</div>
	</c:if>

	<!-- 	동적 페이징 -->
	<div class="pagination flex justify-center mt-3"
		style="margin-top: 50px;">
		<!-- 페이지네이션 길이를 3으로 설정 -->
		<c:set var="paginationLen" value="3" />
		<!-- 현재 페이지에서 페이지네이션 길이를 뺀 값이 1 이상이면 startPage를 그 값으로 설정, 아니면 1로 설정 -->
		<c:set var="startPage"
			value="${page - paginationLen >= 1 ? page - paginationLen : 1}" />
		<!-- 현재 페이지에 페이지네이션 길이를 더한 값이 총 페이지 수 이하이면 endPage를 그 값으로 설정, 아니면 총 페이지 수로 설정 -->
		<c:set var="endPage"
			value="${page + paginationLen <= pagesCount ? page + paginationLen : pagesCount}" />

		<!-- 기본 URI에 boardId를 추가 -->
		<c:set var="baseUri" value="?boardId=${boardId }" />
		<!-- 기본 URI에 searchKeywordTypeCode를 추가 -->
		<c:set var="baseUri"
			value="${baseUri }&searchKeywordTypeCode=${searchKeywordTypeCode}" />
		<!-- 기본 URI에 searchKeyword를 추가 -->
		<c:set var="baseUri"
			value="${baseUri }&searchKeyword=${searchKeyword}" />

		<!-- 시작 페이지가 1보다 크면 첫 페이지와 '...' 표시를 추가 -->
		<c:if test="${startPage > 1 }">
			<a class="btn btn-circle btn-ghost btn-xs"
				style="margin-left: 5px; margin-right: 5px;"
				href="${baseUri }&page=1">1</a>
			<button class="btn btn-xs btn-circle btn-disabled"
				style="margin-left: 5px; margin-right: 5px; background-color: #d5f1e2">...</button>
		</c:if>

		<!-- 시작 페이지부터 끝 페이지까지 반복하여 페이지 번호 링크를 생성 -->
		<c:forEach begin="${startPage }" end="${endPage }" var="i">
			<a
				class="btn btn-circle btn-ghost btn-xs ${param.page == i ? 'btn-active' : '' }"
				style="margin-left: 5px; margin-right: 5px; background-color: #d5f1e2"
				href="${baseUri }&page=${i }">${i }</a>
		</c:forEach>

		<!-- 끝 페이지가 총 페이지 수보다 작으면 '...' 표시와 마지막 페이지 링크를 추가 -->
		<c:if test="${endPage < pagesCount }">
			<button class="btn btn-xs btn-circle btn-disabled"
				style="margin-left: 5px; margin-right: 5px;">...</button>
			<a class="btn btn-circle btn-ghost btn-xs"
				style="margin-left: 5px; margin-right: 5px;"
				href="${baseUri }&page=${pagesCount }">${pagesCount }</a>
		</c:if>
	</div>



	<!-- 검색창 -->
	<div class="mb-4 flex justify-center" style="margin-top: 50px;">
		<!-- 검색어 입력 폼 -->
		<div class="flex"></div>
		<form action="">
			<!-- boardId를 hidden으로 전달 -->
			<input type="hidden" name="boardId" value="${param.boardId }" />
			<!-- 검색어 유형 선택 -->
			<select data-value="${param.searchKeywordTypeCode }"
				class="select select-bordered select-sm w-full max-w-xs"
				style="width: 100px;" name="searchKeywordTypeCode">
				<option value="title">제목</option>
				<option value="body">내용</option>
				<option value="title,body">제목+내용</option>
			</select>
			<!-- 검색어 입력 필드 -->
			<input value="${param.searchKeyword }" name="searchKeyword"
				type="text" placeholder="검색어를 입력해주세요"
				class="input-sm input input-bordered w-48 max-w-xs"
				style="margin-top: 5px;" />
			<!-- 검색 버튼 -->
			<button class="btn btn-ghost btn-sm" type="submit">검색</button>
		</form>
	</div>


</section>



<%@ include file="../common/foot.jspf"%>