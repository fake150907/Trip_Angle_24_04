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
    private Rq rq; // Rq 객체를 자동 주입

    @Autowired
    private ArticleService articleService; // ArticleService 객체를 자동 주입

    @Autowired
    private BoardService boardService; // BoardService 객체를 자동 주입

    @Autowired
    private ReplyService replyService; // ReplyService 객체를 자동 주입

    @Autowired
    private GenFileService genFileService; // GenFileService 객체를 자동 주입

    @Autowired
    private ReactionPointService reactionPointService; // ReactionPointService 객체를 자동 주입

    @Autowired
    private MemberService memberService; // MemberService 객체를 자동 주입

    // 여행 리뷰 목록 페이지로 이동
    @RequestMapping("/usr/trip/reviewList")
    public String showTripReviewList() {
        return "/usr/trip/reviewList";
    }

    // 여행 리뷰 작성 페이지로 이동
    @RequestMapping("/usr/tripReview/reviewWrite")
    public String reviewWrite(Model model) {
        // 현재 게시글의 ID를 모델에 추가하여 전달
        int currentId = articleService.getCurrentArticleId();
        model.addAttribute("currentId", currentId);
        return "usr/tripReview/reviewWrite";
    }

    // 여행 리뷰 작성 기능 수행
    @RequestMapping("/usr/tripReview/doReviewWrite")
    @ResponseBody
    public String doReviewWrite(HttpServletRequest req, String title, String body, String replaceUri,
            MultipartRequest multipartRequest) {
        Rq rq = (Rq) req.getAttribute("rq");
        int boardId = 2; // 여행 후기 게시판의 ID
        // 입력값 유효성 검사
        if (Ut.isNullOrEmpty(title)) {
            return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
        }
        if (Ut.isNullOrEmpty(body)) {
            return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
        }
        // 게시글 작성 기능 호출
        ResultData<Integer> writeArticleRd = articleService.writeArticle(rq.getLoginedMemberId(), title, body, boardId);
        int id = (int) writeArticleRd.getData1();
        // 작성한 게시글의 정보 조회
        Article article = articleService.getArticle(id);
        // 파일 업로드 처리
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        for (String fileInputName : fileMap.keySet()) {
            MultipartFile multipartFile = fileMap.get(fileInputName);
            if (multipartFile.isEmpty() == false) {
                genFileService.save(multipartFile, id);
            }
        }
        // 작성한 글의 상세 페이지로 이동
        return Ut.jsReplace(writeArticleRd.getResultCode(), writeArticleRd.getMsg(),
                "../tripReview/reviewDetail?id=" + id);
    }

    // 글 목록 페이지로 이동
    @RequestMapping("/usr/article/list")
    public String showList(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int boardId,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
            @RequestParam(defaultValue = "") String searchKeyword) {
        // 로그인 정보 확인
        Rq rq = (Rq) req.getAttribute("rq");
        Member member = null;
        if (rq.getLoginedMember() != null) {
            member = memberService.getMemberByLoginId(rq.getLoginedMember().getLoginId());
        }
        // 게시판 정보 조회
        Board board = boardService.getBoardById(boardId);
        // 게시글 수 조회
        int articlesCount = articleService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
        // 게시판이 존재하지 않는 경우 처리
        if (board == null) {
            return rq.historyBackOnView("존재하지 않는 게시판입니다.");
        }
        int itemsInAPage = 10; // 한 페이지에 표시될 게시글 수
        int pagesCount = (int) Math.ceil(articlesCount / (double) itemsInAPage); // 전체 페이지 수 계산
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
        model.addAttribute("member", member);
        if (rq.getLoginedMember() != null) {
            model.addAttribute("loginId", rq.getLoginedMember().getLoginId());
        }
        // 페이지 반환
        return "usr/article/list";
    }

    // 글 상세 페이지로 이동
    @RequestMapping("/usr/article/detail")
    public String showDetail(HttpServletRequest req, Model model, int id) {
        Rq rq = (Rq) req.getAttribute("rq");
        // 게시글 및 관련 정보 조회
        Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);
        ResultData usersReactionRd = reactionPointService.usersReaction(rq.getLoginedMemberId(), "article", id);
        // 사용자 반응 여부 확인
        if (usersReactionRd.isSuccess()) {
            model.addAttribute("userCanMakeReaction", usersReactionRd.isSuccess());
        }
        // 댓글 조회
        List<Reply> replies = replyService.getForPrintReplies(rq.getLoginedMemberId(), "article", id);
        int repliesCount = replies.size();
        String relTypeCode = "article";
        // 모델에 속성 추가
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

    // 조회수 증가 기능 수행
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

    // 글 작성 페이지로 이동
    @RequestMapping("/usr/article/write")
    public String showJoin(Model model) {
        // 현재 게시글의 ID를 모델에 추가하여 전달
        int currentId = articleService.getCurrentArticleId();
        model.addAttribute("currentId", currentId);
        return "usr/article/write";
    }

    // 글 작성 기능 수행
    @RequestMapping("/usr/article/doWrite")
    @ResponseBody
    public String doWrite(HttpServletRequest req, int boardId, String title, String body, String replaceUri,
            MultipartRequest multipartRequest) {
        Rq rq = (Rq) req.getAttribute("rq");
        // 입력값 유효성 검사
        if (Ut.isNullOrEmpty(title)) {
            return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
        }
        if (Ut.isNullOrEmpty(body)) {
            return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
        }
        // 게시글 작성 기능 호출
        ResultData<Integer> writeArticleRd = articleService.writeArticle(rq.getLoginedMemberId(), title, body, boardId);
        int id = (int) writeArticleRd.getData1();
        // 작성한 게시글의 정보 조회
        Article article = articleService.getArticle(id);
        // 파일 업로드 처리
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        for (String fileInputName : fileMap.keySet()) {
            MultipartFile multipartFile = fileMap.get(fileInputName);
            if (multipartFile.isEmpty() == false) {
                genFileService.save(multipartFile, id);
            }
        }
        // 작성한 글의 상세 페이지로 이동
        return Ut.jsReplace(writeArticleRd.getResultCode(), writeArticleRd.getMsg(), "../article/detail?id=" + id);
    }

    // 글 수정 페이지로 이동
    @RequestMapping("/usr/article/modify")
    public String showModify(HttpServletRequest req, Model model, int id) {
        Rq rq = (Rq) req.getAttribute("rq");
        // 수정할 글의 정보 조회
        Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);
        if (article == null) {
            return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
        }
        model.addAttribute("article", article);
        return "usr/article/modify";
    }

    // 글 수정 기능 수행
    @RequestMapping("/usr/article/doModify")
    @ResponseBody
    public String doModify(HttpServletRequest req, int id, String title, String body) {
        Rq rq = (Rq) req.getAttribute("rq");
        // 수정할 글의 정보 조회
        Article article = articleService.getArticle(id);
        if (article == null) {
            return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
        }
        // 글 수정 권한 확인
        ResultData loginedMemberCanModifyRd = articleService.userCanModify(rq.getLoginedMemberId(), article);
        // 권한이 있다면 수정 기능 수행
        if (loginedMemberCanModifyRd.isSuccess()) {
            articleService.modifyArticle(id, title, body);
        }
        // 결과 메시지 반환
        return Ut.jsReplace(loginedMemberCanModifyRd.getResultCode(), loginedMemberCanModifyRd.getMsg(),
                "/usr/tripReview/reviewDetail?id=" + id);
    }

    // 글 삭제 기능 수행
    @RequestMapping("/usr/article/doDelete")
    @ResponseBody
    public String doDelete(HttpServletRequest req, int id) {
        Rq rq = (Rq) req.getAttribute("rq");
        // 삭제할 글의 정보 조회
        Article article = articleService.getArticle(id);
        if (article == null) {
            return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
        }
        // 글 삭제 권한 확인
        ResultData loginedMemberCanDeleteRd = articleService.userCanDelete(rq.getLoginedMemberId(), article);
        // 권한이 있다면 삭제 기능 수행
        if (loginedMemberCanDeleteRd.isSuccess()) {
            articleService.deleteArticle(id);
        }
        // 결과 메시지 반환
        return Ut.jsReplace(loginedMemberCanDeleteRd.getResultCode(), loginedMemberCanDeleteRd.getMsg(),
                "../article/list");
    }

    // 여행 리뷰 상세 페이지로 이동
    @RequestMapping("/usr/tripReview/reviewDetail")
    public String showTripReviewDetail(HttpServletRequest req, Model model, int id) {
        Rq rq = (Rq) req.getAttribute("rq");
        // 여행 리뷰 및 관련 정보 조회
        Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);
        ResultData usersReactionRd = reactionPointService.usersReaction(rq.getLoginedMemberId(), "article", id);
        if (usersReactionRd.isSuccess()) {
            model.addAttribute("userCanMakeReaction", usersReactionRd.isSuccess());
        }
        // 댓글 조회
        List<Reply> replies = replyService.getForPrintReplies(rq.getLoginedMemberId(), "article", id);
        int repliesCount = replies.size();
        String relTypeCode = "article";
        // 모델에 속성 추가
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

    // 여행 리뷰 목록 페이지로 이동
    @RequestMapping("/usr/tripReview/reviewList")
    public String showTripReviewList(Model model, HttpServletRequest req, @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "2") int boardId) {
        Rq rq = (Rq) req.getAttribute("rq");
        Member member = null;
        if (rq.getLoginedMember() != null) {
            member = memberService.getMemberByLoginId(rq.getLoginedMember().getLoginId());
        }
        // 게시판 정보 조회
        Board board = boardService.getBoardById(boardId);
        // 게시판이 존재하지 않는 경우 처리
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
        model.addAttribute("board", board);
        model.addAttribute("boardId", boardId);
        model.addAttribute("page", page);
        model.addAttribute("pagesCount", pagesCount);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("relTypeCode", "article");
        model.addAttribute("member", member);
        if (rq.getLoginedMember() != null) {
            model.addAttribute("loginId", rq.getLoginedMember().getLoginId());
        }
        return "/usr/tripReview/reviewList";
    }

}
