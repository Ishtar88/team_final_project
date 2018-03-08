package com.jsr.project.services;

import java.util.List;

import com.jsr.project.dtos.NoticeBoardDto;

public interface INoticeService {
	
	
	public List<NoticeBoardDto> getAllList();
	
	//게시판 글쓰기 기능 - 관리자만 가능한 기능 
	public boolean insertBoard(NoticeBoardDto dto);
	public boolean readcount(int n_seq);
	public NoticeBoardDto detailBoard(int n_seq);
	public boolean updateBoard(NoticeBoardDto dto);
	public boolean mulDelBoard(String[] n_seq);
	public boolean deleteBoard(int n_seq);
	
	public NoticeBoardDto getBoardAjax(int n_seq);
}
