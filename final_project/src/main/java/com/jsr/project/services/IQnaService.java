package com.jsr.project.services;

import java.util.List;


import com.jsr.project.dtos.QnaBoardDto;

public interface IQnaService {

	public List<QnaBoardDto> getAlllist();
	public boolean insertBoard(QnaBoardDto dto); 
	public boolean readcount(int q_seq);
	public QnaBoardDto getBoard(int q_seq);
	public boolean updateBoard(QnaBoardDto dto);
	
	public boolean mulDelBoard(String[] seq);
	public boolean deleteBoard(int q_seq);
	
	public boolean replyBoard(QnaBoardDto dto); 
	public QnaBoardDto getBoardAjax(int q_seq);
	
	
	
}
