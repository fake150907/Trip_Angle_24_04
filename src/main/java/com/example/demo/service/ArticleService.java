package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;

@Service
public class ArticleService {

	@Autowired
	private ArticleRepository articleRepository;

	// ArticleService 생성자를 통해 ArticleRepository 의존성 주입
	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}

	// 특정 게시글을 가져오는 서비스 메서드
	public Article getForPrintArticle(int loginedMemberId, int id) {
		// ArticleRepository 를 통해 특정 id 의 게시글을 가져옴
		Article article = articleRepository.getForPrintArticle(id);
		// 로그인한 회원의 권한을 확인하여 게시글의 수정, 삭제 가능 여부 설정
		controlForPrintData(loginedMemberId, article);
		return article;
	}

	// 게시글의 수정, 삭제 가능 여부를 설정하는 메서드
	private void controlForPrintData(int loginedMemberId, Article article) {
		// 만약 게시글이 null 이면 메서드 종료
		if (article == null) {
			return;
		}
		// 게시글의 수정 가능 여부를 확인하여 설정
		ResultData userCanModifyRd = userCanModify(loginedMemberId, article);
		article.setUserCanModify(userCanModifyRd.isSuccess());
		// 게시글의 삭제 가능 여부를 확인하여 설정
		ResultData userCanDeleteRd = userCanDelete(loginedMemberId, article);
		article.setUserCanDelete(userCanDeleteRd.isSuccess());
	}

	// 게시글 삭제 권한을 확인하는 메서드
	public ResultData userCanDelete(int loginedMemberId, Article article) {
		// 만약 로그인한 회원의 id 가 게시글 작성자의 id 와 다르면 권한 없음을 반환
		if (article.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 삭제 권한이 없습니다", article.getId()));
		}
		// 권한 있음을 반환
		return ResultData.from("S-1", Ut.f("%d번 글이 삭제 되었습니다", article.getId()));
	}

	// 게시글 수정 권한을 확인하는 메서드
	public ResultData userCanModify(int loginedMemberId, Article article) {
		// 만약 로그인한 회원의 id 가 게시글 작성자의 id 와 다르면 권한 없음을 반환
		if (article.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 수정 권한이 없습니다", article.getId()));
		}
		// 권한 있음을 반환
		return ResultData.from("S-1", Ut.f("%d번 글을 수정했습니다", article.getId()));
	}

	// 게시글 작성 메서드
	public ResultData<Integer> writeArticle(int memberId, String title, String body, int boardId) {
		// ArticleRepository 를 통해 게시글 작성
		articleRepository.writeArticle(memberId, title, body, boardId);
		// 마지막 삽입된 게시글의 id 를 가져와서 반환
		int id = articleRepository.getLastInsertId();
		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);
	}

	// 게시글 삭제 메서드
	public void deleteArticle(int id) {
		// ArticleRepository 를 통해 게시글 삭제
		articleRepository.deleteArticle(id);
	}

	// 게시글 수정 메서드
	public void modifyArticle(int id, String title, String body) {
		// ArticleRepository 를 통해 게시글 수정
		articleRepository.modifyArticle(id, title, body);
	}

	// 특정 id 의 게시글을 가져오는 메서드
	public Article getArticle(int id) {
		return articleRepository.getArticle(id);
	}

	// 모든 게시글을 가져오는 메서드
	public List<Article> getArticles() {
		return articleRepository.getArticles();
	}

	// 특정 게시판의 게시글 수를 가져오는 메서드
	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword) {
		// ArticleRepository 를 통해 특정 게시판의 게시글 수를 가져옴
		return articleRepository.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
	}

	// 게시글 조회수를 증가시키는 메서드
	public ResultData increaseHitCount(int id) {
		// ArticleRepository 를 통해 특정 id 의 게시글 조회수를 증가시킴
		int affectedRow = articleRepository.increaseHitCount(id);
		// 증가된 행이 없다면 해당 게시글이 없음을 반환
		if (affectedRow == 0) {
			return ResultData.from("F-1", "해당 게시물 없음", "id", id);
		}
		// 조회수 증가 완료를 반환
		return ResultData.from("S-1", "해당 게시물 조회수 증가", "id", id);
	}

	// 게시글 조회수를 가져오는 메서드
	public Object getArticleHitCount(int id) {
		// ArticleRepository 를 통해 특정 id 의 게시글 조회수를 가져옴
		return articleRepository.getArticleHitCount(id);
	}

	// 특정 게시판의 특정 페이지에 해당하는 게시글 목록을 가져오는 메서드
	public List<Article> getForPrintArticles(int boardId, int itemsInAPage, int page, String searchKeywordTypeCode,
			String searchKeyword) {
		// 페이지당 게시글 수에 따라 가져올 게시글의 범위 설정
		int limitFrom = (page - 1) * itemsInAPage;
		int limitTake = itemsInAPage;
		// ArticleRepository 를 통해 특정 게시판의 특정 페이지에 해당하는 게시글 목록을 가져옴
		return articleRepository.getForPrintArticles(boardId, limitFrom, limitTake, searchKeywordTypeCode, searchKeyword);
	}

	// 좋아요 수를 증가시키는 메서드
	public ResultData increaseGoodReactionPoint(int relId) {
		// ArticleRepository 를 통해 특정 id 의 게시글의 좋아요 수를 증가시킴
		int affectedRow = articleRepository.increaseGoodReactionPoint(relId);
		// 증가된 행이 없다면 해당 게시글이 없음을 반환
		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}
		// 좋아요 증가 완료를 반환
		return ResultData.from("S-1", "좋아요 증가", "affectedRow", affectedRow);
	}

	// 싫어요 수를 증가시키는 메서드
	public ResultData increaseBadReactionPoint(int relId) {
		// ArticleRepository 를 통해 특정 id 의 게시글의 싫어요 수를 증가시킴
		int affectedRow = articleRepository.increaseBadReactionPoint(relId);
		// 증가된 행이 없다면 해당 게시글이 없음을 반환
		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}
		// 싫어요 증가 완료를 반환
		return ResultData.from("S-1", "싫어요 증가", "affectedRow", affectedRow);
	}

	// 좋아요 수를 감소시키는 메서드
	public ResultData decreaseGoodReactionPoint(int relId) {
		// ArticleRepository 를 통해 특정 id 의 게시글의 좋아요 수를 감소시킴
		int affectedRow = articleRepository.decreaseGoodReactionPoint(relId);
		// 감소된 행이 없다면 해당 게시글이 없음을 반환
		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}
		// 좋아요 감소 완료를 반환
		return ResultData.from("S-1", "좋아요 감소", "affectedRow", affectedRow);
	}

	// 싫어요 수를 감소시키는 메서드
	public ResultData decreaseBadReactionPoint(int relId) {
		// ArticleRepository 를 통해 특정 id 의 게시글의 싫어요 수를 감소시킴
		int affectedRow = articleRepository.decreaseBadReactionPoint(relId);
		// 감소된 행이 없다면 해당 게시글이 없음을 반환
		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}
		// 싫어요 감소 완료를 반환
		return ResultData.from("S-1", "싫어요 감소", "affectedRow", affectedRow);
	}

	// 좋아요 수를 가져오는 메서드
	public int getGoodRP(int relId) {
		// ArticleRepository 를 통해 특정 id 의 게시글의 좋아요 수를 가져옴
		return articleRepository.getGoodRP(relId);
	}

	// 싫어    // 요 수를 가져오는 메서드
	public int getBadRP(int relId) {
		// ArticleRepository 를 통해 특정 id 의 게시글의 싫어요 수를 가져옴
		return articleRepository.getBadRP(relId);
	}

	// 현재 게시글의 id를 가져오는 메서드
	public int getCurrentArticleId() {
		// ArticleRepository 를 통해 현재 게시글의 id를 가져옴
		return articleRepository.getCurrentArticleId();
	}

	// 특정 게시판의 특정 페이지에 해당하는 여행 리뷰 게시글 목록을 가져오는 메서드
	public List<Article> getForPrintTripReviewList(int boardId, int itemsInAPage, int page) {
		// 페이지당 게시글 수에 따라 가져올 게시글의 범위 설정
		int limitFrom = (page - 1) * itemsInAPage;
		int limitTake = itemsInAPage;
		// ArticleRepository 를 통해 특정 게시판의 특정 페이지에 해당하는 여행 리뷰 게시글 목록을 가져옴
		return articleRepository.getForPrintTripReviewList(boardId, limitFrom, limitTake);
	}

	// 특정 게시판의 리뷰 게시글 수를 가져오는 메서드
	public int getReviewCount(int boardId) {
		// ArticleRepository 를 통해 특정 게시판의 리뷰 게시글 수를 가져옴
		return articleRepository.getReviewCount(boardId);
	}
}


