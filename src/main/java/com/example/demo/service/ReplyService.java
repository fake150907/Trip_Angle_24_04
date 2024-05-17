package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ReplyRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;

@Service
public class ReplyService {

	@Autowired
	private ReplyRepository replyRepository; // ReplyRepository 객체 주입

	// ReplyService 생성자
	public ReplyService(ReplyRepository replyRepository) {
		this.replyRepository = replyRepository;
	}

	// 특정 게시물에 대한 댓글 목록을 가져오는 메서드
	public List<Reply> getForPrintReplies(int loginedMemberId, String relTypeCode, int relId) {
		// 댓글 목록 가져오기
		List<Reply> replies = replyRepository.getForPrintReplies(loginedMemberId, relTypeCode, relId);

		// 댓글마다 권한을 확인하고, 권한 정보 설정
		for (Reply reply : replies) {
			controlForPrintData(loginedMemberId, reply);
		}

		// 댓글 목록 반환
		return replies;
	}

	// 댓글 작성 메서드
	public ResultData<Integer> writeReply(int loginedMemberId, String relTypeCode, int relId, String body) {
		// 댓글 작성
		replyRepository.writeReply(loginedMemberId, relTypeCode, relId, body);

		// 마지막으로 작성된 댓글의 id 가져오기
		int id = replyRepository.getLastInsertId();

		// 성공 메시지와 함께 id 반환
		return ResultData.from("S-1", Ut.f("%d번 댓글이 생성되었습니다", id), "id", id);
	}

	// 댓글의 출력 정보를 제어하는 메서드
	private void controlForPrintData(int loginedMemberId, Reply reply) {
		// 댓글이 null이면 메서드 종료
		if (reply == null) {
			return;
		}
		// 댓글 수정, 삭제 권한 확인
		ResultData userCanModifyRd = userCanModify(loginedMemberId, reply);
		reply.setUserCanModify(userCanModifyRd.isSuccess());

		ResultData userCanDeleteRd = userCanDelete(loginedMemberId, reply);
		reply.setUserCanDelete(userCanDeleteRd.isSuccess());
	}

	// 댓글 삭제 권한 확인 메서드
	public ResultData userCanDelete(int loginedMemberId, Reply reply) {
		// 현재 로그인한 회원의 id와 댓글 작성자의 id를 비교하여 권한 확인
		if (reply.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 댓글에 대한 삭제 권한이 없습니다", reply.getId()));
		}

		// 권한이 있는 경우 성공 메시지 반환
		return ResultData.from("S-1", Ut.f("%d번 댓글이 삭제 되었습니다", reply.getId()));
	}

	// 댓글 수정 권한 확인 메서드
	public ResultData userCanModify(int loginedMemberId, Reply reply) {
		// 현재 로그인한 회원의 id와 댓글 작성자의 id를 비교하여 권한 확인
		if (reply.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 댓글에 대한 수정 권한이 없습니다", reply.getId()));
		}

		// 권한이 있는 경우 성공 메시지 반환
		return ResultData.from("S-1", Ut.f("%d번 댓글을 수정했습니다", reply.getId()));
	}

	// 특정 id의 댓글 가져오는 메서드
	public Reply getReply(int id) {
		return replyRepository.getReply(id);
	}

	// 댓글 삭제 메서드
	public ResultData deleteReply(int id) {
		// 댓글 삭제
		replyRepository.deleteReply(id);
		// 성공 메시지 반환
		return ResultData.from("S-1", Ut.f("%d번 댓글을 삭제했습니다", id));
	}

	// 댓글 수정 메서드
	public void modifyReply(int id, String body) {
		// 댓글 수정
		replyRepository.modifyReply(id, body);
	}
}
