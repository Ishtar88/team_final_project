package com.jsr.project.daos;

import java.util.List;

import com.jsr.project.dtos.QnaBoardDto;

public interface IQnaBoardDao {
	
//	글 목록 조회 
	public List<QnaBoardDto> getAllList();
	
//	공개글 상세 조회
	public QnaBoardDto getBoard(int q_seq);
	
//	모든글 상세 조회
//	q_detailboard_all
	public QnaBoardDto getAllBoard(int q_seq);
	
//	새로운 글 입력
	public boolean q_insertBoard(QnaBoardDto dto); 
	
//	새로운 답변 입력
	public boolean replyBoard(QnaBoardDto dto); 
	
//	일반 글 수정
	public boolean updateBoard(QnaBoardDto dto); 
	
//	답변 글 수정
	public boolean updateReply(QnaBoardDto dto);
	
//	조횟수 증가
	public boolean readCount(int q_seq);
	
//	한 개의 글 삭제하기
//	q_deleteboard
	public boolean deleteOne(int q_seq);

//	여러개의 글 삭제하기
	public boolean mulDelBoard(String [] q_seq);

//  ajax 처리
	public QnaBoardDto getBoardAjax(int q_seq);

}
