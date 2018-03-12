package com.jsr.project.services;

import java.util.List;


import com.jsr.project.dtos.QnaBoardDto;

public interface IQnaService {

	// 모든 글 
	public List<QnaBoardDto> q_getAlllist();
	public boolean q_insertBoard(QnaBoardDto dto); 
	public boolean q_readcount(int q_seq);
	public QnaBoardDto q_getBoard(int q_seq, String count);
	public boolean q_updateBoard(QnaBoardDto dto);
	
	public boolean q_mulDelBoard(String[] seq);
	public boolean q_deleteBoard(int q_seq);
	
	public boolean q_replyBoard(QnaBoardDto dto); 
	public QnaBoardDto q_getBoardAjax(int q_seq);
	
	
	//인터페이스에 구현 덜한 것 
	//답변 글 수정

	
	
}
