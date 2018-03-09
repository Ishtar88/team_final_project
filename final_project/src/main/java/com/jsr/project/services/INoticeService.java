package com.jsr.project.services;

import java.util.List;

import com.jsr.project.dtos.NoticeBoardDto;

public interface INoticeService {
	
	
	public List<NoticeBoardDto> n_getAllList();
	
	//게시판 글쓰기 기능 - 관리자만 가능한 기능 
	public boolean n_insertBoard(NoticeBoardDto dto);
	public boolean n_readcount(int n_seq);
	public NoticeBoardDto n_detailBoard(int n_seq);
	public boolean n_updateBoard(NoticeBoardDto dto);
	public boolean n_mulDelBoard(String[] n_seq);
	public boolean n_deleteBoard(NoticeBoardDto dto);
	
	public NoticeBoardDto n_getBoardAjax(int n_seq);
}
