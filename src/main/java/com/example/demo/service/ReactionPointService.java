package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ReactionPointRepository;
import com.example.demo.vo.ResultData;

@Service
public class ReactionPointService {

	@Autowired
	private ArticleService articleService; // ArticleService 객체 주입

	@Autowired
	private ReactionPointRepository reactionPointRepository; // ReactionPointRepository 객체 주입

	// ReactionPointService 생성자
	public ReactionPointService(ReactionPointRepository reactionPointRepository) {
		this.reactionPointRepository = reactionPointRepository;
	}

	// 사용자의 반응을 확인하는 메서드
	public ResultData usersReaction(int loginedMemberId, String relTypeCode, int relId) {
		// 로그인 여부 확인
		if (loginedMemberId == 0) {
			return ResultData.from("F-L", "로그인 하고 사용해주세요");
		}

		// 회원이 이미 반응을 했는지 확인
		int sumReactionPointByMemberId = reactionPointRepository.getSumReactionPoint(loginedMemberId, relTypeCode,
				relId);

		// 이미 반응을 한 경우 처리
		if (sumReactionPointByMemberId != 0) {
			return ResultData.from("F-1", "추천 불가능", "sumReactionPointByMemberId", sumReactionPointByMemberId);
		}

		// 반응 가능한 경우 처리
		return ResultData.from("S-1", "추천 가능", "sumReactionPointByMemberId", sumReactionPointByMemberId);
	}

	// 좋아요 반응 추가하는 메서드
	public ResultData addGoodReactionPoint(int loginedMemberId, String relTypeCode, int relId) {
		// 좋아요 반응 추가 결과 반환
		int affectedRow = reactionPointRepository.addGoodReactionPoint(loginedMemberId, relTypeCode, relId);

		// 좋아요 반응 추가 실패 처리
		if (affectedRow != 1) {
			return ResultData.from("F-1", "좋아요 실패");
		}

		// 게시글인 경우, ArticleService를 통해 좋아요 수 증가 처리
		switch (relTypeCode) {
		case "article":
			articleService.increaseGoodReactionPoint(relId);
			break;
		}

		// 성공 메시지 반환
		return ResultData.from("S-1", "좋아요!");
	}

	// 싫어요 반응 추가하는 메서드
	public ResultData addBadReactionPoint(int loginedMemberId, String relTypeCode, int relId) {
		// 싫어요 반응 추가 결과 반환
		int affectedRow = reactionPointRepository.addBadReactionPoint(loginedMemberId, relTypeCode, relId);

		// 싫어요 반응 추가 실패 처리
		if (affectedRow != 1) {
			return ResultData.from("F-1", "싫어요 실패");
		}

		// 게시글인 경우, ArticleService를 통해 싫어요 수 증가 처리
		switch (relTypeCode) {
		case "article":
			articleService.increaseBadReactionPoint(relId);
			break;
		}

		// 성공 메시지 반환
		return ResultData.from("S-1", "싫어요!");
	}

	// 좋아요 반응 삭제하는 메서드
	public ResultData deleteGoodReactionPoint(int loginedMemberId, String relTypeCode, int relId) {
		// 좋아요 반응 삭제
		reactionPointRepository.deleteReactionPoint(loginedMemberId, relTypeCode, relId);

		// 게시글인 경우, ArticleService를 통해 좋아요 수 감소 처리
		switch (relTypeCode) {
		case "article":
			articleService.decreaseGoodReactionPoint(relId);
			break;
		}
		// 성공 메시지 반환
		return ResultData.from("S-1", "좋아요 취소 됨");
	}

	// 싫어요 반응 삭제하는 메서드
	public ResultData deleteBadReactionPoint(int loginedMemberId, String relTypeCode, int relId) {
		// 싫어요 반응 삭제
		reactionPointRepository.deleteReactionPoint(loginedMemberId, relTypeCode, relId);

		// 게시글인 경우, ArticleService를 통해 싫어요 수 감소 처리
		switch (relTypeCode) {
		case "article":
			articleService.decreaseBadReactionPoint(relId);
			break;
		}
		// 성공 메시지 반환
		return ResultData.from("S-1", "싫어요 취소 됨");
	}

	// 좋아요 반응 여부 확인하는 메서드
	public boolean isAlreadyAddGoodRp(int memberId, int relId, String relTypeCode) {
		// 회원이 이미 좋아요 반응을 했는지 확인
		int getPointTypeCodeByMemberId = reactionPointRepository.getSumReactionPoint(memberId, relTypeCode, relId);

		// 이미 좋아요 반응을 한 경우 true 반환
		if (getPointTypeCodeByMemberId > 0) {
			return true;
		}

		// 그 외 경우 false 반환
		return false;
	}

	// 싫어요 반응 여부 확인하는 메서드
	public boolean isAlreadyAddBadRp(int memberId, int relId, String relTypeCode) {
		// 회원이 이미 싫어요 반응을 했는지 확인
		int getPointTypeCodeByMemberId = reactionPointRepository.getSumReactionPoint(memberId, relTypeCode, relId);

		// 이미 싫어요 반응을 한 경우 true 반환
		if (getPointTypeCodeByMemberId < 0) {
			return true;
		}

		// 그 외 경우 false 반환
		return false;
	}

}
