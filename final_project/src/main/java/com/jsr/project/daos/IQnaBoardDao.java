package com.jsr.project.daos;

import java.util.List;

import com.jsr.project.dtos.QnaBoardDto;

public interface IQnaBoardDao {
	
//	글 목록 조회 
	public List<QnaBoardDto> q_getAllList();
	
//	공개글 상세 조회 - 유저용 
	public QnaBoardDto q_getBoard(int q_seq);
	
//	모든글 상세 조회 - 관리자용 
//	q_detailboard_all
	public QnaBoardDto q_getAllBoard(int q_seq);
	
//	새로운 글 입력
	public boolean q_insertBoard(QnaBoardDto dto); 
	
//	새로운 답변 입력
	public int q_replyBoard(QnaBoardDto dto); 
	
//	일반 글 수정
	public boolean q_updateBoard(QnaBoardDto dto); 
	
//	답변 글 수정
	public int q_updateReply(int q_seq);
	
//	조횟수 증가
	public boolean q_readCount(int q_seq);
	
//	한 개의 글 삭제하기
//	q_deleteboard
	public boolean q_deleteOne(QnaBoardDto dto);

//	여러개의 글 삭제하기
	public boolean q_mulDelBoard(String [] q_seq);

//  ajax 처리
	public QnaBoardDto q_getBoardAjax(int q_seq);

}
