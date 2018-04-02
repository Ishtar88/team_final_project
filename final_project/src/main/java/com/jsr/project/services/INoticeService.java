package com.jsr.project.services;

import java.util.List;

import com.jsr.project.dtos.NoticeBoardDto;
import com.jsr.project.dtos.QnaBoardDto;

public interface INoticeService {
	
	
	public List<NoticeBoardDto> n_getAllList(QnaBoardDto dto);
	
	//게시판 글쓰기 기능 - 관리자만 가능한 기능 
	public boolean n_insertBoard(NoticeBoardDto dto);
	public boolean n_readcount(int n_seq);
	public NoticeBoardDto n_detailBoard(int n_seq, String count);
	public boolean n_updateBoard(NoticeBoardDto dto);
	public boolean n_deleteBoard(int n_seq);
	
	public NoticeBoardDto n_getBoardAjax(int n_seq);
	
	//공지게시판 다중삭제
	public boolean notice_multiDel(String[] chk);
	
}
