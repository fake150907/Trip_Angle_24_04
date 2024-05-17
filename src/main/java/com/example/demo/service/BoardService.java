package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.BoardRepository;
import com.example.demo.vo.Board;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;

	// BoardService 생성자를 통해 BoardRepository 의존성 주입
	public BoardService(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}

	// 특정 게시판의 정보를 가져오는 메서드
	public Board getBoardById(int boardId) {
		// BoardRepository 를 통해 특정 id 의 게시판 정보를 가져옴
		return boardRepository.getBoardById(boardId);
	}

}
