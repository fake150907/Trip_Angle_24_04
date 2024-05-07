package com.example.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.service.GenFileService;
import com.example.demo.service.MemberService;
import com.example.demo.service.ReactionPointService;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.Member;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrArticleController {

	@Autowired
	private Rq rq;

	@Autowired
	private ArticleService articleService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private GenFileService genFileService;

	@Autowired
	private ReactionPointService reactionPointService;

	@Autowired
	private MemberService memberService;

	public UsrArticleController() {

	}

	@RequestMapping("/usr/tripReview/reviewWrite")
	public String reviewWrite(Model model) {

		int currentId = articleService.getCurrentArticleId();

		model.addAttribute("currentId", currentId);

		return "usr/tripReview/reviewWrite";
	}

	@RequestMapping("/usr/tripReview/doReviewWrite")
	@ResponseBody
	public String doReviewWrite(HttpServletRequest req, String title, String body, String replaceUri,
			MultipartRequest multipartRequest) {

		Rq rq = (Rq) req.getAttribute("rq");
		
		// boardId 2번은 여행후기 게시판
		int boardId = 2;
		
		if (Ut.isNullOrEmpty(title)) {
			return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(body)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}

		ResultData<Integer> writeArticleRd = articleService.writeArticle(rq.getLoginedMemberId(), title, body, boardId);
		
		System.err.println(boardId);

		int id = (int) writeArticleRd.getData1();

		Article article = articleService.getArticle(id);

		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();

		for (String fileInputName : fileMap.keySet()) {
			MultipartFile multipartFile = fileMap.get(fileInputName);

			if (multipartFile.isEmpty() == false) {
				genFileService.save(multipartFile, id);
			}
		}

		return Ut.jsReplace(writeArticleRd.getResultCode(), writeArticleRd.getMsg(), "../tripReview/reviewDetail?id=" + id);

	}
	
	// 트립앵글 리뷰 리스트
		@RequestMapping("/usr/tripReview/reviewList")
		public String showTripReviewList() {

			return "/usr/tripReview/reviewList";
		}

		//트립앵글 리뷰 디테일
		@RequestMapping("/usr/tripReview/reviewDetail")
		public String showTripReviewDetail(HttpServletRequest req, Model model, int id) {

			Rq rq = (Rq) req.getAttribute("rq");

			Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);
			ResultData usersReactionRd = reactionPointService.usersReaction(rq.getLoginedMemberId(), "article", id);

			if (usersReactionRd.isSuccess()) {
				model.addAttribute("userCanMakeReaction", usersReactionRd.isSuccess());
			}

			List<Reply> replies = replyService.getForPrintReplies(rq.getLoginedMemberId(), "article", id);

			int repliesCount = replies.size();

			String relTypeCode = "article";

			model.addAttribute("article", article);
			model.addAttribute("replies", replies);
			model.addAttribute("repliesCount", repliesCount);
			model.addAttribute("relTypeCode", relTypeCode);
			model.addAttribute("isAlreadyAddGoodRp",
					reactionPointService.isAlreadyAddGoodRp(rq.getLoginedMemberId(), id, "article"));
			model.addAttribute("isAlreadyAddBadRp",
					reactionPointService.isAlreadyAddBadRp(rq.getLoginedMemberId(), id, "article"));
			
			return "/usr/tripReview/reviewDetail";
		}

	// 액션 메서드
	@RequestMapping("/usr/article/list")
	public String showList(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int boardId,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {

		Rq rq = (Rq) req.getAttribute("rq");

		// 현재 로그인한 회원이 있는지 확인
		Member member = null;
		if (rq.getLoginedMember() != null) {
			// 로그인한 회원이 있다면 해당 회원 정보를 가져옴
			member = memberService.getMemberByLoginId(rq.getLoginedMember().getLoginId());
		}

		// 게시판 정보 조회
		Board board = boardService.getBoardById(boardId);

		// 게시글 수 조회
		int articlesCount = articleService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);

		// 게시판이 존재하지 않는 경우
		if (board == null) {
			return rq.historyBackOnView("존재하지 않는 게시판입니다.");
		}

		// 한 페이지에 표시될 게시글 수
		int itemsInAPage = 10;

		// 전체 페이지 수 계산
		int pagesCount = (int) Math.ceil(articlesCount / (double) itemsInAPage);

		// 해당 페이지에 표시될 게시글 리스트 조회
		List<Article> articles = articleService.getForPrintArticles(boardId, itemsInAPage, page, searchKeywordTypeCode,
				searchKeyword);

		// 모델에 속성 추가
		model.addAttribute("board", board);
		model.addAttribute("boardId", boardId);
		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("articlesCount", articlesCount);
		model.addAttribute("articles", articles);
		model.addAttribute("member", member); // null이 될 수 있음에 유의
		// 로그인한 회원이 있다면 로그인 아이디도 추가
		if (rq.getLoginedMember() != null) {
			model.addAttribute("loginId", rq.getLoginedMember().getLoginId());
		}

		// 페이지 반환
		return "usr/article/list";
	}

	@RequestMapping("/usr/article/detail")
	public String showDetail(HttpServletRequest req, Model model, int id) {
		Rq rq = (Rq) req.getAttribute("rq");

		Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);
		ResultData usersReactionRd = reactionPointService.usersReaction(rq.getLoginedMemberId(), "article", id);

		if (usersReactionRd.isSuccess()) {
			model.addAttribute("userCanMakeReaction", usersReactionRd.isSuccess());
		}

		List<Reply> replies = replyService.getForPrintReplies(rq.getLoginedMemberId(), "article", id);

		int repliesCount = replies.size();

		String relTypeCode = "article";

		model.addAttribute("article", article);
		model.addAttribute("replies", replies);
		model.addAttribute("repliesCount", repliesCount);
		model.addAttribute("relTypeCode", relTypeCode);
		model.addAttribute("isAlreadyAddGoodRp",
				reactionPointService.isAlreadyAddGoodRp(rq.getLoginedMemberId(), id, "article"));
		model.addAttribute("isAlreadyAddBadRp",
				reactionPointService.isAlreadyAddBadRp(rq.getLoginedMemberId(), id, "article"));

		return "usr/article/detail";
	}

	@RequestMapping("/usr/article/doIncreaseHitCountRd")
	@ResponseBody
	public ResultData doIncreaseHitCountRd(int id) {

		ResultData increaseHitCountRd = articleService.increaseHitCount(id);

		if (increaseHitCountRd.isFail()) {
			return increaseHitCountRd;
		}

		ResultData rd = ResultData.newData(increaseHitCountRd, "hitCount", articleService.getArticleHitCount(id));

		rd.setData2("id", id);

		return rd;

	}

	@RequestMapping("/usr/article/write")
	public String showJoin(Model model) {

		int currentId = articleService.getCurrentArticleId();

		model.addAttribute("currentId", currentId);

		return "usr/article/write";
	}

	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, int boardId, String title, String body, String replaceUri,
			MultipartRequest multipartRequest) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (Ut.isNullOrEmpty(title)) {
			return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(body)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}

		ResultData<Integer> writeArticleRd = articleService.writeArticle(rq.getLoginedMemberId(), title, body, boardId);

		int id = (int) writeArticleRd.getData1();

		Article article = articleService.getArticle(id);

		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();

		for (String fileInputName : fileMap.keySet()) {
			MultipartFile multipartFile = fileMap.get(fileInputName);

			if (multipartFile.isEmpty() == false) {
				genFileService.save(multipartFile, id);
			}
		}

		return Ut.jsReplace(writeArticleRd.getResultCode(), writeArticleRd.getMsg(), "../article/detail?id=" + id);

	}

	@RequestMapping("/usr/article/modify")
	public String showModify(HttpServletRequest req, Model model, int id) {
		Rq rq = (Rq) req.getAttribute("rq");

		Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);

		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
		}

		model.addAttribute("article", article);

		return "usr/article/modify";
	}

	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, int id, String title, String body) {
		Rq rq = (Rq) req.getAttribute("rq");

		Article article = articleService.getArticle(id);

		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
		}

		ResultData loginedMemberCanModifyRd = articleService.userCanModify(rq.getLoginedMemberId(), article);

		if (loginedMemberCanModifyRd.isSuccess()) {
			articleService.modifyArticle(id, title, body);
		}

		return Ut.jsReplace(loginedMemberCanModifyRd.getResultCode(), loginedMemberCanModifyRd.getMsg(),
				"../article/detail?id=" + id);
	}

	// 로그인 체크 -> 유무 체크 -> 권한 체크 -> 삭제
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(HttpServletRequest req, int id) {
		Rq rq = (Rq) req.getAttribute("rq");

		Article article = articleService.getArticle(id);

		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
		}

		ResultData loginedMemberCanDeleteRd = articleService.userCanDelete(rq.getLoginedMemberId(), article);

		if (loginedMemberCanDeleteRd.isSuccess()) {
			articleService.deleteArticle(id);
		}

		return Ut.jsReplace(loginedMemberCanDeleteRd.getResultCode(), loginedMemberCanDeleteRd.getMsg(),
				"../article/list");
	}
	

	@RequestMapping("/usr/trip/tripReviewList")
	public String showTripReviewList(Model model, HttpServletRequest req, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "2") int boardId) {
		Rq rq = (Rq) req.getAttribute("rq");
		// 현재 로그인한 회원이 있는지 확인
		Member member = null;
		if (rq.getLoginedMember() != null) {
			// 로그인한 회원이 있다면 해당 회원 정보를 가져옴
			member = memberService.getMemberByLoginId(rq.getLoginedMember().getLoginId());
		}

		// 게시판 정보 조회
		Board board = boardService.getBoardById(boardId);

		// 게시판이 존재하지 않는 경우
		if (board == null) {
			return rq.historyBackOnView("존재하지 않는 게시판입니다.");
		}
		int reviewCount = articleService.getReviewCount(boardId);

		int itemsInAPage = 12;

		// 전체 페이지 수 계산
		int pagesCount = (int) Math.ceil(reviewCount / (double) itemsInAPage);

		
		// 해당 페이지에 표시될 게시글 리스트 조회
		List<Article> reviewList = articleService.getForPrintTripReviewList(boardId, itemsInAPage, page);

		// 모델에 속성 추가
		// 모델에 속성 추가
		model.addAttribute("board", board);
		model.addAttribute("boardId", boardId);
		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("relTypeCode", "review");
		model.addAttribute("member", member); // null이 될 수 있음에 유의

		// 로그인한 회원이 있다면 로그인 아이디도 추가
		if (rq.getLoginedMember() != null) {
			model.addAttribute("loginId", rq.getLoginedMember().getLoginId());
		}

		return "/usr/tripReview/reviewList";
	}

}
