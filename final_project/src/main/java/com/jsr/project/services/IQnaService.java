package com.jsr.project.services;

import java.util.List;


import com.jsr.project.dtos.QnaBoardDto;

public interface IQnaService {

	// 글목록 조회
	public List<QnaBoardDto> q_getAlllist();
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
	public boolean q_deleteBoard(QnaBoardDto dto);
	//답글 달기 
	public boolean q_replyBoard(QnaBoardDto dto); 
	
	public QnaBoardDto q_getBoardAjax(int q_seq);
	
	

	
	
}
