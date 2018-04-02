package com.jsr.project.services;

import java.util.List;


import com.jsr.project.dtos.QnaBoardDto;

public interface IQnaService {
	
	//페이지카운트 조회
	public int q_pageCount();
	
	//페이지카운트 조회
	public int n_pageCount();

	// 글목록 조회
	public List<QnaBoardDto> q_getAlllist(QnaBoardDto qDto);
	//새로운 글 쓰기 
	public boolean q_insertBoard(QnaBoardDto dto); 
	//글 조횟수
	public boolean q_readcount(int q_seq);
	//글 상세보기 
	public QnaBoardDto q_getBoard(int q_seq, String count);
	//글 수정하기 
	public boolean q_updateBoard(QnaBoardDto dto);
	//글 여러 개 삭제하기 
	public boolean q_mulDelBoard(String[] seq);
	//글 한 개 삭제하기 
	public boolean q_deleteBoard(int q_seq);
	//답글 달기 
	public boolean q_replyBoard(QnaBoardDto dto); 
	//아작스 처리 
	public QnaBoardDto q_getBoardAjax(int q_seq);
	//모든 글 불러오기(관리자용) 
	public QnaBoardDto q_getAllBoard(int q_seq);
	
	//병훈 작업
	
	//qnaBoard검색 조회 기능
	public List<QnaBoardDto> qnaDetailAjax(QnaBoardDto dto);
	
	//공지게시판 다중삭제
	public boolean qna_multiDel(String[] chk);
	
	
}
