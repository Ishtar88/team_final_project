package com.jsr.project.daos;

import java.util.List;

import com.jsr.project.dtos.NoticeBoardDto;

public interface INoticeDao {
	
	public List<NoticeBoardDto> n_getAllList();
	public boolean n_insertBoard(NoticeBoardDto dto);
	public NoticeBoardDto n_detailBoard(int n_seq);
	public boolean n_readCount(int n_seq);
	public boolean n_updateBoard(NoticeBoardDto dto); 
	public boolean n_muldelBoard(String[] n_seq); 
	public boolean n_deleteOne(NoticeBoardDto dto);
	public NoticeBoardDto n_getBoardAjax(int n_seq);
}
